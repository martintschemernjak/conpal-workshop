resource "azurerm_consumption_budget_subscription" "main" {
  name            = "cb-${var.project_name}-${var.location}-budget-001"
  subscription_id = var.subscription_id

  amount     = var.budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'hh:mm:ssZ", timestamp())
  }

  notification {
    enabled   = true
    threshold = 50.0 # in %
    operator  = "EqualTo"

    contact_emails = concat([var.project_admin_email], var.budget_email_notification_recipients)
  }

  notification {
    enabled        = true
    threshold      = 100.0 # in %
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = concat([var.project_admin_email], var.budget_email_notification_recipients)
  }

  #Start date is dynamic and should no be evaluated every month again only when creating for the first time
  lifecycle {
    ignore_changes = [
      time_period
    ]
  }
}
