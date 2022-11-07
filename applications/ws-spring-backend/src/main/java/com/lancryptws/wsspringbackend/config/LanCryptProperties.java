package com.lancryptws.wsspringbackend.config;


import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "lc", ignoreUnknownFields = false)
public class LanCryptProperties {

    private String cloudfunctionUrl;

    public String getCloudfunctionUrl() {
        return cloudfunctionUrl;
    }

    public void setCloudfunctionUrl(String cloudfunctionUrl) {
        this.cloudfunctionUrl = cloudfunctionUrl;
    }
}
