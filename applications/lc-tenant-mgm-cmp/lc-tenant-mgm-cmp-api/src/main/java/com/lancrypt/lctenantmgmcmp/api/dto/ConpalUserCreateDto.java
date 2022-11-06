package com.lancrypt.lctenantmgmcmp.api.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ConpalUserCreateDto {
    @NotBlank
    @Size(max = 100)
    private String firstName;
    @NotBlank
    @Size(max = 100)
    private String lastName;
    @NotBlank
    @Email
    @Size(max = 254)
    private String emailAddress;
    @NotBlank
    @Size(max = 64)
    private String password;
    @NotBlank
    @Size(max = 50)
    private String mobilePhoneNumber;
    @Size(max = 50)
    private String businessPhoneNumber;
    @NotNull
    private boolean agreedToTerms;
    @NotBlank
    @Size(max = 5)
    private String languageInfo;
    @NotBlank
    @Size(max = 5)
    private String regionalFormats;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String laseName) {
        this.lastName = laseName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public boolean isAgreedToTerms() {
        return agreedToTerms;
    }

    public void setAgreedToTerms(boolean agreedToTerms) {
        this.agreedToTerms = agreedToTerms;
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
