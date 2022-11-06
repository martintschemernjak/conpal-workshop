package com.lancrypt.lctenantmgmcmp.api.dto;

public class EmailValidationResult {

    boolean emailInUse;

    public EmailValidationResult(boolean emailInUse) {
        this.emailInUse = emailInUse;
    }

    public EmailValidationResult() {
    }

    public boolean isEmailInUse() {
        return emailInUse;
    }

    public void setEmailInUse(boolean emailInUse) {
        this.emailInUse = emailInUse;
    }
}
