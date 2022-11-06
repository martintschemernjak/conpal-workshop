package com.lancrypt.lctenantmgmcmp.api;

import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.lancrypt.lctenantmgmcmp.api.dto.ConpalUserUpdateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.ConpalUserUpdateLanguageInfoDto;
import com.lancrypt.lctenantmgmcmp.api.dto.ConpalUserViewDto;
import com.lancrypt.lctenantmgmcmp.api.dto.ContactMessageCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.CreationResult;
import com.lancrypt.lctenantmgmcmp.api.dto.EmailValidationResult;
import com.lancrypt.lctenantmgmcmp.api.dto.UserCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.UserTreeViewDto;
import com.lancrypt.lctenantmgmcmp.api.dto.UserUpdateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.UserViewDto;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api("User")
public interface UserApi {
    String CONTEXT_PATH = "/api/user";


    @ApiOperation("Return the MSO user by email")
    @GetMapping(CONTEXT_PATH + "/{userId}")
    ConpalUserViewDto getConpalUserById(@PathVariable(name = "userId") UUID userId,
        @RequestParam(name = "email") String email);


    @ApiOperation("Sends a Contact Message")
    @PostMapping(value = CONTEXT_PATH + "/contact", consumes = MediaType.APPLICATION_JSON_VALUE)
    void createContactMessage( @Valid @RequestBody ContactMessageCreateDto contactMessageCreateDto);

    @ApiOperation("Create a User")
    @PostMapping(value = CONTEXT_PATH, consumes = MediaType.APPLICATION_JSON_VALUE)
    CreationResult createUser(@Valid @RequestBody UserCreateDto createDto);


}
