package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

public class TenantUpdateDto {

    private UUID id;
    @NotNull
    @Valid
    private AddressDto address;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public AddressDto getAddress() {
        return address;
    }

    public void setAddress(AddressDto address) {
        this.address = address;
    }
}
