package com.lancrypt.lctenantmgmcmp.config.models;

public class AuditingProperties {

    private String sharedJwtSecret;

    public String getSharedJwtSecret() {
        return sharedJwtSecret;
    }

    public void setSharedJwtSecret(String sharedJwtSecret) {
        this.sharedJwtSecret = sharedJwtSecret;
    }
}
