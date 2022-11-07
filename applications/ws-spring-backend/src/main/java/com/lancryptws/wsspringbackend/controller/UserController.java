package com.lancryptws.wsspringbackend.controller;


import com.lancryptws.wsspringbackend.dto.CreationResult;
import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.dto.UserViewDto;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.UUID;

@RestController
public class UserController {
    private final String CONTEXT_PATH = "/api/user";

    @PostMapping(value = CONTEXT_PATH, consumes = MediaType.APPLICATION_JSON_VALUE)
    CreationResult createUser(@Valid @RequestBody UserCreateDto createDto){
        return null;
    }

    @GetMapping(CONTEXT_PATH + "/{userId}")
    UserViewDto getById(@PathVariable(name = "userId") UUID userId){
        return null;
    }
}
