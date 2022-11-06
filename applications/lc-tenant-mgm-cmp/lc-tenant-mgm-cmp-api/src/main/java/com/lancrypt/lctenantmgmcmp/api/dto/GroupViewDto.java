package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.List;
import java.util.UUID;

public class GroupViewDto {

    private final UUID id;
    private final String name;
    private final String description;
    private final List<GroupSelectDto> parents;

    public GroupViewDto(UUID id, String name, String description,
        List<GroupSelectDto> parents) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.parents = parents;
    }

    public UUID getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public List<GroupSelectDto> getParents() {
        return parents;
    }
}
