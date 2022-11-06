package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.List;
import java.util.UUID;

public class UserViewDto {

    private final UUID id;
    private final String firstName;
    private final String lastName;
    private final String description;
    private final String emailAddress;
    private final List<GroupSelectDto> groups;

    public UserViewDto(UUID id, String firstName, String lastName, String description, String emailAddress,
        List<GroupSelectDto> groups) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.description = description;
        this.emailAddress = emailAddress;
        this.groups = groups;
    }

    public UUID getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getDescription() {
        return description;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public List<GroupSelectDto> getGroups() {
        return groups;
    }
}
