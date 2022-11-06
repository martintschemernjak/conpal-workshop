package com.lancrypt.lctenantmgmcmp.api.dto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ErrorDto {
    private final List<FieldErrorDto> errors = new ArrayList<>();

    public void addFieldError(FieldErrorDto error) {
        errors.add(error);
    }

    public List<FieldErrorDto> getErrors() {
        return Collections.unmodifiableList(errors);
    }
}
