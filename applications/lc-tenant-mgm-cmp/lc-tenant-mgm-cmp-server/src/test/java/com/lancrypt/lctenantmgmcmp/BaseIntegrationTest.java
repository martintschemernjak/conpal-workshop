package com.lancrypt.lctenantmgmcmp;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("integration")
@Transactional
public class BaseIntegrationTest {

    @LocalServerPort
    private int currentServerPort;

    protected int getCurrentServerPort()
    {
        return this.currentServerPort;
    }
}
