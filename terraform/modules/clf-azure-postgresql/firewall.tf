resource "azurerm_postgresql_flexible_server_firewall_rule" "main" {
  for_each = var.firewall_rules

  name                = each.key
  server_id           = azurerm_postgresql_flexible_server.main.id
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}