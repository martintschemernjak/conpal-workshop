package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ConpalUserUpdateDto {

    public ConpalUserUpdateDto(UUID id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public ConpalUserUpdateDto() {
        //needed for jackson mapper
    }

    @NotNull
    private UUID id;
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
