package com.lancrypt.lctenantmgmcmp;

import static org.mockito.Mockito.mock;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.lancrypt.lctenantmgmcmp.entities.repositories.KeyCloakRepository;

@Configuration
public class TestMocksConfiguration {

    @Bean
    public KeyCloakRepository keyCloakRepository() {
        return mock(KeyCloakRepository.class);
    }
}
