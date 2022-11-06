package com.lancrypt.lctenantmgmcmp.services.impl;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.lancrypt.lctenantmgmcmp.api.dto.ContactMessageCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.UserCreateDto;
import com.lancrypt.lctenantmgmcmp.entities.User;
import com.lancrypt.lctenantmgmcmp.services.UserService;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger LOG = LoggerFactory.getLogger(UserServiceImpl.class);


    @Override
    public User findByEmail(UUID tenantId, String email) {
        return null;
    }

    @Override
    public void createContactMessage(UUID tenantId, ContactMessageCreateDto contactMessageCreateDto) {

    }

    @Override
    public User createUser(UUID tenantId, UserCreateDto createDto) {
        return null;
    }

    @Override
    public User findById(UUID id) {
        return null;
    }
}
