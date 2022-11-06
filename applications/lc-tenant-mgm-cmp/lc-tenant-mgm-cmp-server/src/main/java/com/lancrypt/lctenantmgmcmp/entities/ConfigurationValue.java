package com.lancrypt.lctenantmgmcmp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity
public class ConfigurationValue extends BaseEntity {

    @NotNull
    @Column(unique = true)
    private String configKey;

    @NotNull
    private String configValue;

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String key) {
        this.configKey = key;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String value) {
        this.configValue = value;
    }
}
