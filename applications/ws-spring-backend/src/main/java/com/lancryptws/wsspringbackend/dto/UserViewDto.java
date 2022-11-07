package com.lancryptws.wsspringbackend.dto;

import java.util.List;
import java.util.UUID;

public class UserViewDto {

    private final UUID id;
    private final String firstName;
    private final String lastName;
    private final String description;
    private final String emailAddress;

    public UserViewDto(UUID id, String firstName, String lastName, String description, String emailAddress) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.description = description;
        this.emailAddress = emailAddress;
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
}
