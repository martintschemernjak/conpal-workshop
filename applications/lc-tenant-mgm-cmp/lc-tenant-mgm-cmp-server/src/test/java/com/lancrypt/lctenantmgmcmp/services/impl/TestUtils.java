package com.lancrypt.lctenantmgmcmp.services.impl;

import java.util.List;
import java.util.UUID;

import org.jetbrains.annotations.NotNull;

import com.lancrypt.lctenantmgmcmp.api.dto.AddressDto;
import com.lancrypt.lctenantmgmcmp.api.dto.ConpalUserCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.ContactMessageCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.GroupCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.TenantCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.TenantDetailsCreateDto;

public class TestUtils {

    public static String ADMIN_EMAIL = "email@test.com";

    private TestUtils() {
    }

    public static TenantCreateDto createTenantDto() {
        return createTenantDto(ADMIN_EMAIL);
    }

    @NotNull
    public static TenantCreateDto createTenantDto(String adminEmail) {
        var dto = new TenantCreateDto();
        var tenantDto = new TenantDetailsCreateDto();
        tenantDto.setCompanyName("company");
        tenantDto.setVatNr("AT123456789");
        var addressDto = new AddressDto();
        addressDto.setStreet1("street1");
        addressDto.setStreet2("street2");
        addressDto.setZip("5541");
        addressDto.setCity("Altenmarkt");
        addressDto.setState("Salzburg");
        addressDto.setCountry("Austria");
        tenantDto.setAddress(addressDto);
        dto.setTenant(tenantDto);
        var adminUserDto = new ConpalUserCreateDto();
        adminUserDto.setEmailAddress(adminEmail);
        adminUserDto.setFirstName("firstname");
        adminUserDto.setLastName("lastName");
        adminUserDto.setPassword("password");
        adminUserDto.setMobilePhoneNumber("+43123456789");
        adminUserDto.setBusinessPhoneNumber("+123456");
        adminUserDto.setAgreedToTerms(true);
        adminUserDto.setLanguageInfo("en");
        adminUserDto.setRegionalFormats("en");
        dto.setAdminUser(adminUserDto);
        return dto;
    }

    @NotNull
    public static GroupCreateDto createGroupDto(List<UUID> parents) {
        var dto = new GroupCreateDto();
        dto.setName("group1");
        dto.setDescription("group description");
        dto.setParents(parents);
        return dto;
    }

    @NotNull
    public static ContactMessageCreateDto createContactMessageDto(boolean containMessage, UUID tenantId) {
        var dto = new ContactMessageCreateDto();

        if(containMessage)
            dto.setMessage("testMessage");

        dto.setEmail(ADMIN_EMAIL);
        dto.setSubject("TestSubject");
        dto.setTenantId(tenantId);

        return dto;
    }
}
