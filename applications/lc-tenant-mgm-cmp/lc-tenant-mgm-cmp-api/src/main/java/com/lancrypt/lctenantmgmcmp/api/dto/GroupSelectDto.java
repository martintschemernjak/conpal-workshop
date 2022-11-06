package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

public class GroupSelectDto {
    private final UUID id;
    private final String name;

    public GroupSelectDto(UUID id, String name) {
        this.id = id;
        this.name = name;
    }

    public UUID getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
