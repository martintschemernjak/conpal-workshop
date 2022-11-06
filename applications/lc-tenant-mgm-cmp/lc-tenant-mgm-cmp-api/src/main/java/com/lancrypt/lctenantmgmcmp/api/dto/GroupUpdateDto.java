package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.List;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class GroupUpdateDto {

    @NotNull
    private UUID id;

    @Size(max = 100)
    @NotBlank
    private String name;

    @Size(max = 254)
    private String description;

    @Size(min = 1)
    @NotNull
    private List<UUID> parents;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<UUID> getParents() {
        return parents;
    }

    public void setParents(List<UUID> parents) {
        this.parents = parents;
    }
}
