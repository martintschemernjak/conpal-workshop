package com.lancrypt.lctenantmgmcmp.security.config;

import static org.keycloak.OAuth2Constants.PASSWORD;

import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.keycloak.adapters.springboot.KeycloakSpringBootProperties;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
public class KeycloakConfig {

    @Bean
    public KeycloakSpringBootConfigResolver keycloakConfigResolver() {
        return new KeycloakSpringBootConfigResolver();
    }

    @Profile("!integration")
    @Bean
    public Keycloak keycloak(KeycloakSpringBootProperties keycloakProperties) {
        return KeycloakBuilder.builder()
            .grantType(PASSWORD)
            .serverUrl(keycloakProperties.getAuthServerUrl())
            .realm("master")
            .clientId("admin-cli")
            .username((String)keycloakProperties.getCredentials().get("username"))
            .password((String)keycloakProperties.getCredentials().get("password"))
            .build();
    }
}
