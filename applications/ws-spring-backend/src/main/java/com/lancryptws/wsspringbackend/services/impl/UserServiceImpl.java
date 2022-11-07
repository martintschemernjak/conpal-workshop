package com.lancryptws.wsspringbackend.services.impl;

import com.lancryptws.wsspringbackend.dto.CreationResult;
import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.entities.User;
import com.lancryptws.wsspringbackend.entities.repositories.UserRepository;
import com.lancryptws.wsspringbackend.mapper.UserMapper;
import com.lancryptws.wsspringbackend.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public UserServiceImpl(UserRepository userRepository, UserMapper userMapper) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public CreationResult createUser(UserCreateDto createDto) {
        var user = userMapper.map(createDto);
        userRepository.save(user);

        return new CreationResult(user.getId());
    }

    @Transactional(readOnly = true)
    @Override
    public User findById(UUID userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
    }
}
