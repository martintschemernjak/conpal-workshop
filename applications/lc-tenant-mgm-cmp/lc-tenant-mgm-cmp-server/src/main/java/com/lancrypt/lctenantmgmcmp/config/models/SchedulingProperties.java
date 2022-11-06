package com.lancrypt.lctenantmgmcmp.config.models;

public class SchedulingProperties {

    private int tenantCleanupInterval;
    private boolean keyCloakEventsEnabled = true;

    public int getTenantCleanupInterval() {
        return tenantCleanupInterval;
    }

    public void setTenantCleanupInterval(int tenantCleanupInterval) {
        this.tenantCleanupInterval = tenantCleanupInterval;
    }

    public boolean isKeyCloakEventsEnabled() {
        return keyCloakEventsEnabled;
    }

    public void setKeyCloakEventsEnabled(boolean keyCloakEventsEnabled) {
        this.keyCloakEventsEnabled = keyCloakEventsEnabled;
    }
}
