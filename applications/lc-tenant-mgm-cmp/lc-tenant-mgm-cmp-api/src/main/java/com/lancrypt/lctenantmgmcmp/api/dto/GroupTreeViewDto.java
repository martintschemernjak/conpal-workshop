package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.List;
import java.util.UUID;

public class GroupTreeViewDto {

    private UUID id;
    private String name;
    private List<GroupTreeViewDto> children;

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

    public List<GroupTreeViewDto> getChildren() {
        return children;
    }

    public void setChildren(List<GroupTreeViewDto> children) {
        this.children = children;
    }
}
