package com.lancrypt.lctenantmgmcmp.entities.repositories.impl;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.ws.rs.core.Response;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.EventRepresentation;
import org.keycloak.representations.idm.GroupRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Profile;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.lancrypt.lctenantmgmcmp.entities.User;
import com.lancrypt.lctenantmgmcmp.entities.repositories.KeyCloakRepository;
import com.lancrypt.lctenantmgmcmp.enums.KeyCloakActions;
import com.lancrypt.lctenantmgmcmp.enums.KeyCloakEventType;
import com.lancrypt.lctenantmgmcmp.exceptions.KeycloakException;

@Repository
@Profile("!integration")
public class KeyCloakRepositoryImpl implements KeyCloakRepository {

    private static final Logger LOG = LoggerFactory.getLogger(KeyCloakRepositoryImpl.class);

    private final Keycloak keycloak;

    public KeyCloakRepositoryImpl(Keycloak keycloak) {
        this.keycloak = keycloak;
    }

    @Override
    public String createGroup(String realm, String name) {

        LOG.info("Creating Group for realm {} with name: {}", realm, name);
        GroupRepresentation group = new GroupRepresentation();
        group.setName(name);

        RealmResource tenantRealm = keycloak.realm(realm);
        validateResponse(tenantRealm
            .groups()
            .add(group));

        List<GroupRepresentation> groups = tenantRealm
            .groups()
            .groups(name, 0, Integer.MAX_VALUE, true);

        if (groups.size() == 1) {
            return groups.get(0).getId();
        } else {
            return null;
        }
    }

    @Override
    public String addUser(String realm, UUID tenantId, User user, String password, boolean emailVerified) {
        LOG.info("Adding user to realm {} and group/tenant {} with username: {}",
            realm, tenantId, user.getEmailAddress());

        var userRepresentation = new UserRepresentation();
        userRepresentation.setUsername(user.getEmailAddress());
        userRepresentation.setEmail(user.getEmailAddress());
        userRepresentation.setFirstName(user.getFirstName());
        userRepresentation.setLastName(user.getLastName());
        userRepresentation.setEnabled(true);
        userRepresentation.setEmailVerified(emailVerified);
        if (StringUtils.hasText(password)) {
            CredentialRepresentation credentials = new CredentialRepresentation();
            credentials.setType(CredentialRepresentation.PASSWORD);
            credentials.setValue(password);
            credentials.setTemporary(false);
            userRepresentation.setCredentials(List.of(credentials));
        }
        userRepresentation.setGroups(List.of(tenantId.toString()));

        validateResponse(keycloak.realm(realm)
            .users()
            .create(userRepresentation));

        List<UserRepresentation> users = keycloak.realm(realm)
            .users()
            .search(user.getEmailAddress(), true);

        if (users.size() == 1) {
            return users.get(0).getId();
        } else {
            return null;
        }
    }

    @Override
    @Nullable
    public UserRepresentation getUserByUsername(String realm, String username) {
        var users = keycloak.realm(realm)
            .users().search(username);

        if (users.isEmpty()) {
            return null;
        }

        return keycloak.realm(realm)
            .users().search(username).get(0);
    }

    @Override
    public void removeUserById(String realm, String id) {
        LOG.info("Removing user in realm {} with id: {}", realm, id);

        var response = keycloak.realm(realm)
            .users().delete(id);

        validateDeletion(response, "user");
    }

    @Override
    public void removeGroup(String realm, String id) {
        LOG.info("Removing group in realm {} with id: {}", realm, id);

        keycloak.realm(realm)
            .groups().group(id).remove();
    }

    @Override
    public List<EventRepresentation> fetchEvents(String realm, Set<KeyCloakEventType> eventTypes) {
        return keycloak.realm(realm)
            .getEvents(eventTypes.stream().map(KeyCloakEventType::name).toList(),
                null, null, null, null, null, null, Integer.MAX_VALUE);
    }

    @Override
    public void sendVerifyEmail(String realm, String userId) {
        keycloak.realm(realm)
            .users().get(userId)
            .sendVerifyEmail();
    }

    @Override
    public void startUserAction(KeyCloakActions action, String realm, String userId) {
        keycloak.realm(realm)
            .users().get(userId)
            .executeActionsEmail(List.of(action.name()), 60 * 60); //1hour
    }

    @Override
    public void updateEmail(String realm, String userId, String email) {
        var userRepresentation = new UserRepresentation();
        userRepresentation.setEmail(email);
        userRepresentation.setEmailVerified(false);
        keycloak.realm(realm)
            .users().get(userId)
            .update(userRepresentation);
    }

    @Override
    public UserRepresentation getUserById(String realm, String userId) {
        return keycloak.realm(realm)
            .users().get(userId)
            .toRepresentation();
    }

    private void validateResponse(Response response) {
        if (response.getStatus() != 200 && response.getStatus() != 201) {
            String body = response.readEntity(String.class);

            throw new KeycloakException(
                String.format("Error creating user: Status %s - %s", response.getStatus(), body));
        }
    }

    private void validateDeletion(Response response, String entityName) {
        if (response.getStatus() != 200 && response.getStatus() != 204) {
            String body = response.readEntity(String.class);

            throw new KeycloakException(
                String.format("Error deleting %s: Status %s - %s", entityName, response.getStatus(), body)
            );
        }
    }
}
