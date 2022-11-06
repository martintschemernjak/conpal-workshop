package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class ConpalUserViewDto {

    private UUID id;

    private String firstName;

    private String lastName;

    private String emailAddress;

    private String mobilePhoneNumber;

    private String businessPhoneNumber;

    private String languageInfo;
    private String regionalFormats;

    public ConpalUserViewDto(UUID id, String firstName, String lastName, String emailAddress, String mobilePhoneNumber,
        String businessPhoneNumber, String languageInfo, String regionalFormats) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.mobilePhoneNumber = mobilePhoneNumber;
        this.businessPhoneNumber = businessPhoneNumber;
        this.languageInfo = languageInfo;
        this.regionalFormats = regionalFormats;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getMobilePhoneNumber() {
        return mobilePhoneNumber;
    }

    public void setMobilePhoneNumber(String mobilePhoneNumber) {
        this.mobilePhoneNumber = mobilePhoneNumber;
    }

    public String getBusinessPhoneNumber() {
        return businessPhoneNumber;
    }

    public void setBusinessPhoneNumber(String businessPhoneNumber) {
        this.businessPhoneNumber = businessPhoneNumber;
    }

    public String getLanguageInfo() {
        return languageInfo;
    }

    public void setLanguageInfo(String languageInfo) {
        this.languageInfo = languageInfo;
    }

    public String getRegionalFormats() {
        return regionalFormats;
    }

    public void setRegionalFormats(String regionalFormats) {
        this.regionalFormats = regionalFormats;
    }
}
