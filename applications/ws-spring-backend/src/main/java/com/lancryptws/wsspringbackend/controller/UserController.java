package com.lancryptws.wsspringbackend.controller;


import com.lancryptws.wsspringbackend.dto.CreationResult;
import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.dto.UserViewDto;
import com.lancryptws.wsspringbackend.mapper.UserMapper;
import com.lancryptws.wsspringbackend.services.UserService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.UUID;

@RestController
public class UserController {
    private final String CONTEXT_PATH = "/api/user";

    private final UserService userService;
    private final UserMapper userMapper;

    public UserController(UserService userService, UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }

    @PostMapping(value = CONTEXT_PATH, consumes = MediaType.APPLICATION_JSON_VALUE)
    CreationResult createUser(@Valid @RequestBody UserCreateDto createDto){
        return userService.createUser(createDto);
    }

    @GetMapping(CONTEXT_PATH + "/{userId}")
    UserViewDto getById(@PathVariable(name = "userId") UUID userId){
        return userMapper.map(userService.findById(userId));
    }

    @GetMapping(CONTEXT_PATH + "/error")
    UserViewDto getError(){
        throw new IllegalArgumentException("This is a test Error");
    }

    //TODO: Create GET Endpoint with the path /api/user/groupX/{name}
    //Use the getMessageFromCloudfunction Method of the useService
}
