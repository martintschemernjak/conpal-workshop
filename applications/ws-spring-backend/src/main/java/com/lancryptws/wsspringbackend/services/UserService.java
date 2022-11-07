package com.lancryptws.wsspringbackend.services;

import com.lancryptws.wsspringbackend.dto.CreationResult;
import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.entities.User;

import java.util.UUID;

public interface UserService {
    CreationResult createUser(UserCreateDto createDto);

    User findById(UUID userId);
    String getMessageFromCloudfunction(String name);
}
