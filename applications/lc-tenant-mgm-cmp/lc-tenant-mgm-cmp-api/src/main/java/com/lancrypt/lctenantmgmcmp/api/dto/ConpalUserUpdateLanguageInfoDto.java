package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ConpalUserUpdateLanguageInfoDto {

    @NotNull
    private UUID id;
    @NotBlank
    private String languageInfo;
    @NotBlank
    private String regionalFormats;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
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
