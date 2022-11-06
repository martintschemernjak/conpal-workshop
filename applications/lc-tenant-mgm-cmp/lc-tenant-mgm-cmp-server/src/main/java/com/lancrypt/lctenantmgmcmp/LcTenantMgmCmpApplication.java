package com.lancrypt.lctenantmgmcmp;

import com.microsoft.applicationinsights.attach.ApplicationInsights;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.lancrypt.lctenantmgmcmp.config.LanCryptProperties;

import net.javacrumbs.shedlock.spring.annotation.EnableSchedulerLock;

@SpringBootApplication
@EnableScheduling
@EnableSchedulerLock(defaultLockAtMostFor = "10m")
@EnableConfigurationProperties(LanCryptProperties.class)
public class LcTenantMgmCmpApplication {

    public static void main(String[] args) {
        ApplicationInsights.attach();
        SpringApplication.run(LcTenantMgmCmpApplication.class, args);
    }
}
