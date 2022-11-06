package com.lancrypt.lctenantmgmcmp.controller;

import java.util.List;
import java.util.UUID;

import org.jetbrains.annotations.NotNull;
import org.springframework.web.bind.annotation.RestController;

import com.lancrypt.lctenantmgmcmp.api.UserApi;
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
import com.lancrypt.lctenantmgmcmp.mapper.UserMapper;
import com.lancrypt.lctenantmgmcmp.services.UserService;

@RestController
public class UserController implements UserApi {

    private final UserService userService;
    private final UserMapper userMapper;

    public UserController(UserService userService,
        UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }


    @Override
    public ConpalUserViewDto getConpalUserById(UUID userId, String email) {
        return null;
    }

    @Override
    public void createContactMessage(ContactMessageCreateDto contactMessageCreateDto) {

    }

    @Override
    public CreationResult createUser(UserCreateDto createDto) {
        return null;
    }
}
