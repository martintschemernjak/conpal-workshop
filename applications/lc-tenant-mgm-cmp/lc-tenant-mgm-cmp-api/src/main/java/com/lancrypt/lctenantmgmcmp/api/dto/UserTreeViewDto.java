package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class UserTreeViewDto {
    private UUID id;
    private String displayName;
    private String description;

    public UserTreeViewDto(UUID id, String displayName, String description) {
        this.id = id;
        this.displayName = displayName;
        this.description = description;
    }

    public UserTreeViewDto() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
