package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class CreationResult {
    private UUID id;

    public CreationResult(UUID id) {
        this.id = id;
    }

    public CreationResult() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }
}
