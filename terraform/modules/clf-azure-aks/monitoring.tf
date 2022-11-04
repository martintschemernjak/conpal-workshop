resource "azurerm_application_insights_web_test" "main" {
  for_each = var.monitoring_availability_urls

  application_insights_id = var.application_insights.id
  name                    = "wt-${var.project_name}-${each.key}"
  location                = var.resource_group.location
  resource_group_name     = var.resource_group.name
  kind                    = "ping"
  geo_locations           = ["emea-nl-ams-azr"] # West Europe
  frequency               = 300
  enabled                 = true
  retry_enabled           = true

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  configuration = <<XML
<WebTest Name="PingTest" Id="ABD48585-0831-40CB-9069-682EA6BB3580" Enabled="True" CssProjectStructure=""
         CssIteration="" Timeout="120" WorkItemIds="" xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"
         Description="" CredentialUserName="" CredentialPassword="" PreAuthenticate="True" Proxy="default"
         StopOnError="False"
         RecordedResultFile="" ResultsLocale="">
    <Items>
        <Request Method="GET" Guid="a5f10126-e4cd-570d-961c-cea43999a201" Version="1.1"
                 Url="${each.value}"
                 ThinkTime="0" Timeout="120" ParseDependentRequests="False" FollowRedirects="True" RecordResult="True"
                 Cache="False"
                 ResponseTimeGoal="0" Encoding="utf-8" ExpectedHttpStatusCode="200" ExpectedResponseUrl=""
                 ReportingName=""
                 IgnoreHttpStatusCode="False"/>
    </Items>
</WebTest>
  XML
}

resource "azurerm_monitor_metric_alert" "main" {
  for_each = var.monitoring_availability_urls
  name                = "${each.key}-monitor-alert"
  resource_group_name = var.resource_group.name
  scopes              = [
    azurerm_application_insights_web_test.main[each.key].id,
    var.application_insights.id,
  ]

  description = "Alert will be triggered when ${azurerm_application_insights_web_test.main[each.key].name} fails."
  severity    = 0

  application_insights_web_test_location_availability_criteria {
    web_test_id           = azurerm_application_insights_web_test.main[each.key].id
    component_id          = var.application_insights.id
    failed_location_count = 1
  }

  action {
    action_group_id = var.action_group.id
  }
}
