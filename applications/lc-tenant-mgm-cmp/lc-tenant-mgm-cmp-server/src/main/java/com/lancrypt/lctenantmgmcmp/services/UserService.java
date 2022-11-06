package com.lancrypt.lctenantmgmcmp.services;

import java.util.UUID;

import com.lancrypt.lctenantmgmcmp.api.dto.ContactMessageCreateDto;
import com.lancrypt.lctenantmgmcmp.api.dto.UserCreateDto;
import com.lancrypt.lctenantmgmcmp.entities.User;

public interface UserService {

    User findByEmail(UUID tenantId, String email);

    void createContactMessage(UUID tenantId, ContactMessageCreateDto contactMessageCreateDto);

    User createUser(UUID tenantId, UserCreateDto createDto);

    User findById(UUID id);

}
