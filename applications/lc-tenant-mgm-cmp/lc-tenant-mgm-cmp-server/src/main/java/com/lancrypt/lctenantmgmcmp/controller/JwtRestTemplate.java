package com.lancrypt.lctenantmgmcmp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.util.Assert;
import org.springframework.web.client.RestTemplate;

public class JwtRestTemplate extends RestTemplate {
    public JwtRestTemplate(String sharedSecret) {
        Assert.notNull(sharedSecret, "Shared secret must not be null");

        addInterceptors(sharedSecret);
    }

    private void addInterceptors(String sharedSecret) {
        List<ClientHttpRequestInterceptor> interceptors = new ArrayList<>();

        interceptors.add(new JwtInterceptor(sharedSecret));

        setInterceptors(interceptors);
    }
}
