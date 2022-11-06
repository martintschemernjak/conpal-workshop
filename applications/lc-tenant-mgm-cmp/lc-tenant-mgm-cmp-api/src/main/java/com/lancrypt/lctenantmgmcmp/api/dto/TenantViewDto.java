package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class TenantViewDto {

    private UUID id;
    private String companyName;
    private String vatNr;
    private AddressDto address;

    public TenantViewDto(UUID id, String companyName, String vatNr, AddressDto address) {
        this.id = id;
        this.companyName = companyName;
        this.vatNr = vatNr;
        this.address = address;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getVatNr() {
        return vatNr;
    }

    public void setVatNr(String vatNr) {
        this.vatNr = vatNr;
    }

    public AddressDto getAddress() {
        return address;
    }

    public void setAddress(AddressDto address) {
        this.address = address;
    }
}
