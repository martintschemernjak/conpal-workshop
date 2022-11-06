package com.lancrypt.lctenantmgmcmp.controller;

import java.util.Locale;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceResolvable;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.lancrypt.lctenantmgmcmp.api.dto.ErrorDto;
import com.lancrypt.lctenantmgmcmp.api.dto.FieldErrorDto;

@ControllerAdvice(annotations = RestController.class)
public class LCExceptionHandler {

    private static final Logger LOG = LoggerFactory.getLogger(LCExceptionHandler.class);

    private final MessageSource messageSource;

    public LCExceptionHandler(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorDto> handleValidationException(MethodArgumentNotValidException exception) {
        LOG.warn(exception.getMessage(), exception);

        final ErrorDto errorDto = new ErrorDto();
        for (ObjectError error : exception.getBindingResult().getAllErrors()) {
            String fieldName = ((FieldError) error).getField();
            errorDto.addFieldError(new FieldErrorDto(error.getObjectName(), fieldName, error.getDefaultMessage()));
        }

        return new ResponseEntity<>(errorDto, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ErrorDto> handleValidationException(ConstraintViolationException constraintException) {
        LOG.warn(constraintException.getMessage(), constraintException);

        final ErrorDto errorDto = new ErrorDto();
        for (ConstraintViolation<?> violation : constraintException.getConstraintViolations()) {
            String fieldName = String.valueOf(violation.getPropertyPath());
            String message = resolveErrorMessage(new ObjectError(fieldName, violation.getMessage()));
            errorDto.addFieldError(new FieldErrorDto(violation.getRootBeanClass().getSimpleName(), fieldName, message));
        }

        return new ResponseEntity<>(errorDto, HttpStatus.BAD_REQUEST);
    }

    private String resolveErrorMessage(final MessageSourceResolvable resolvable) {
        final Locale currentLocale = LocaleContextHolder.getLocale();
        String message =
            messageSource.getMessage(resolvable.getDefaultMessage(), resolvable.getArguments(), null, currentLocale);
        if (message == null) {
            message = messageSource.getMessage(resolvable, currentLocale);
        }
        return message;
    }
}
