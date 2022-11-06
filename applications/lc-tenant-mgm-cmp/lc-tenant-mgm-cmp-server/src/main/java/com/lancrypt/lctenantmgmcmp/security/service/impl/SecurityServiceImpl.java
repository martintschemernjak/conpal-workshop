package com.lancrypt.lctenantmgmcmp.security.service.impl;

import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.lancrypt.lctenantmgmcmp.security.model.CurrentUser;
import com.lancrypt.lctenantmgmcmp.security.model.CurrentUserKeycloakImpl;
import com.lancrypt.lctenantmgmcmp.security.service.SecurityService;

@Service
public class SecurityServiceImpl implements SecurityService {

    private boolean isCurrentUserAvailable() {
        return SecurityContextHolder.getContext().getAuthentication() != null;
    }

    @Override
    public CurrentUser getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication instanceof CurrentUser currentUser) {
            return currentUser;
        }
        if (authentication instanceof KeycloakAuthenticationToken keycloakToken) {
            return new CurrentUserKeycloakImpl(keycloakToken);
        }
        if (authentication instanceof UsernamePasswordAuthenticationToken) {
            return (CurrentUser) authentication.getPrincipal();
        }

        throw new AccessDeniedException("User not logged in.");
    }

    @Override
    public String getUserName() {
        return isCurrentUserAvailable() ? getCurrentUser().getUserName() : "User not logged in";
    }
}
