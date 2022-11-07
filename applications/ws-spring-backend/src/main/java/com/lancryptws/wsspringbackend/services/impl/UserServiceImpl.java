package com.lancryptws.wsspringbackend.services.impl;

import com.lancryptws.wsspringbackend.config.LanCryptProperties;
import com.lancryptws.wsspringbackend.dto.CreationResult;
import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.entities.User;
import com.lancryptws.wsspringbackend.entities.repositories.UserRepository;
import com.lancryptws.wsspringbackend.mapper.UserMapper;
import com.lancryptws.wsspringbackend.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.server.ResponseStatusException;

import java.time.Duration;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final LanCryptProperties lanCryptProperties;

    public UserServiceImpl(UserRepository userRepository, UserMapper userMapper, LanCryptProperties lanCryptProperties) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
        this.lanCryptProperties = lanCryptProperties;
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

    @Override
    public String getMessageFromCloudfunction(String name) {

        var uri = lanCryptProperties.getCloudfunctionUrl()+ "?name="+name;

        WebClient webClient = WebClient.builder().build();
        String conversionResponse = webClient.get()
                .uri(uri)
                .retrieve()
                .bodyToMono(String.class)
                .block(Duration.ofSeconds(10));

        return conversionResponse;
    }
}
