resource "azurerm_mssql_firewall_rule" "fw01" {

  for_each = var.firewall_rules

  name                = each.key
  server_id           = azurerm_mssql_server.main.id
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address

}