package com.lancrypt.lctenantmgmcmp.api.dto;

public class FieldErrorDto {

    private final String entity;
    private final String field;
    private final String message;

    public FieldErrorDto(String entity, String field, String message) {
        this.entity = entity;
        this.field = field;
        this.message = message;
    }

    public String getEntity() {
        return entity;
    }

    public String getField() {
        return field;
    }

    public String getMessage() {
        return message;
    }
}
