package com.lancrypt.lctenantmgmcmp.security.model;

import java.util.Collection;

import org.keycloak.KeycloakPrincipal;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import com.lancrypt.lctenantmgmcmp.security.UserRoles;

public class CurrentUserKeycloakImpl implements CurrentUser {

    private final String userName;
    private final Collection<GrantedAuthority> authorities;

    public CurrentUserKeycloakImpl(KeycloakAuthenticationToken token)
    {
        if (token.getPrincipal() instanceof KeycloakPrincipal keycloakPrincipal) {
            userName = keycloakPrincipal.getName();
        } else {
            throw new IllegalArgumentException("expected token.principal to be of type KeycloakPrincipal");
        }
        authorities = token.getAuthorities();
    }

    @Override
    public String getFirstName() {
        return null;
    }

    @Override
    public String getLastName() {
        return null;
    }

    @Override
    public String getUserName() {
        return userName;
    }

    @Override
    public boolean isAdmin() {
        return false;
    }

    @Override
    public String getTenantId() {
        return null;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public boolean hasRole(UserRoles role) {
        return getAuthorities().stream().anyMatch(r -> r.getAuthority().equalsIgnoreCase(role.toString()));
    }
}
