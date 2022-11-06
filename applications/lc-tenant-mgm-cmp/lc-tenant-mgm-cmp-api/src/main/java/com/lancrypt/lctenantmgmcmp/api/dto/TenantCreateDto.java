package com.lancrypt.lctenantmgmcmp.api.dto;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

public class TenantCreateDto {

    @NotNull
    @Valid
    private TenantDetailsCreateDto tenant;
    @NotNull
    @Valid
    private ConpalUserCreateDto adminUser;

    public TenantDetailsCreateDto getTenant() {
        return tenant;
    }

    public void setTenant(TenantDetailsCreateDto tenant) {
        this.tenant = tenant;
    }

    public ConpalUserCreateDto getAdminUser() {
        return adminUser;
    }

    public void setAdminUser(ConpalUserCreateDto adminUser) {
        this.adminUser = adminUser;
    }
}
