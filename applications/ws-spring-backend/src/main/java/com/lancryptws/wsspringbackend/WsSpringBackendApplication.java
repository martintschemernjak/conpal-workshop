package com.lancryptws.wsspringbackend;

import com.lancryptws.wsspringbackend.config.LanCryptProperties;
import com.microsoft.applicationinsights.attach.ApplicationInsights;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties(LanCryptProperties.class)
public class WsSpringBackendApplication {

	public static void main(String[] args) {
		ApplicationInsights.attach();
		SpringApplication.run(WsSpringBackendApplication.class, args);
	}

}
