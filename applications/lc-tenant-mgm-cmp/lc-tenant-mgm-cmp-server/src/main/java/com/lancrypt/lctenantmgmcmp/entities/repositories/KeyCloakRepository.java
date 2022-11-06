package com.lancrypt.lctenantmgmcmp.entities.repositories;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.keycloak.representations.idm.EventRepresentation;
import org.keycloak.representations.idm.UserRepresentation;

import com.lancrypt.lctenantmgmcmp.entities.User;
import com.lancrypt.lctenantmgmcmp.enums.KeyCloakActions;
import com.lancrypt.lctenantmgmcmp.enums.KeyCloakEventType;

public interface KeyCloakRepository {

    String createGroup(String realm, String name);

    String addUser(String realm, UUID tenantId, User user, String password, boolean emailVerified);

    UserRepresentation getUserByUsername(String realm, String username);

    void removeUserById(String realm, String id);

    void removeGroup(String realm, String id);

    List<EventRepresentation> fetchEvents(String realm, Set<KeyCloakEventType> eventTypes);

    void sendVerifyEmail(String realm, String userId);

    void startUserAction(KeyCloakActions action, String realm, String userId);

    void updateEmail(String realm, String userId, String email);

    UserRepresentation getUserById(String realm, String userId);
}
