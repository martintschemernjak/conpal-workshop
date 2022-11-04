resource "azurerm_log_analytics_saved_search" "main" {
  count               = length(var.search_queries_image_names)

  name                       = "${var.search_queries_image_names[count.index]}-log-analytics-query"
  log_analytics_workspace_id = var.log_analytics_workspace.id

  category     = "Applications"
  display_name = "${var.search_queries_image_names[count.index]} Application Logs"
  query        = <<EOT
    let podInventory = KubePodInventory
        | distinct ContainerID, ContainerName
        | project-rename Name=ContainerName;
    let containerInventory = ContainerInventory
        | extend ClusterId = _ResourceId
        | distinct ContainerID, Image;
    ContainerLog
    | project-away Name, Image
    | extend ClusterId = _ResourceId
    | join kind=leftouter podInventory on ContainerID
    | join kind=leftouter containerInventory on ContainerID
    | where Image == "${var.search_queries_image_names[count.index]}"
    | extend parsedJson = parse_json(LogEntry)
    | project TimeGenerated, ContainerID,  Logger = parsedJson.logger_name, LogLevel = parsedJson.level, Message = parsedJson.message, Stacktrace = parsedJson.stack_trace
    | order by TimeGenerated desc
  EOT
}