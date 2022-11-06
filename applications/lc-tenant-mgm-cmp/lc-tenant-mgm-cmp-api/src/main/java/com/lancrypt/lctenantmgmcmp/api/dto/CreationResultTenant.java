package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class CreationResultTenant {
    private UUID tenantId;
    private UUID userId;
    private UUID groupId;

    public CreationResultTenant(UUID tenantId, UUID userId, UUID groupId) {
        this.tenantId = tenantId;
        this.userId = userId;
        this.groupId = groupId;
    }

    public CreationResultTenant() {
    }

    public UUID getTenantId() {
        return tenantId;
    }

    public void setTenantId(UUID tenantId) {
        this.tenantId = tenantId;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public UUID getGroupId() {
        return groupId;
    }

    public void setGroupId(UUID groupId) {
        this.groupId = groupId;
    }
}
