package com.lancrypt.lctenantmgmcmp.controller;

import java.io.IOException;
import java.time.Instant;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

class JwtInterceptor implements ClientHttpRequestInterceptor {
    private final String sharedSecret;

    public JwtInterceptor(String sharedSecret) {
        this.sharedSecret = sharedSecret;
    }

    @Override
    public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
        throws IOException {
        HttpHeaders headers = request.getHeaders();
        if (!headers.containsKey(HttpHeaders.AUTHORIZATION)) {
            headers.setBearerAuth(generateBearerToken());
        }
        return execution.execute(request, body);
    }

    private String generateBearerToken() {
        return JWT.create()
            .withExpiresAt(Instant.now().plusSeconds(60))
            .sign(Algorithm.HMAC512(sharedSecret));
    }
}
