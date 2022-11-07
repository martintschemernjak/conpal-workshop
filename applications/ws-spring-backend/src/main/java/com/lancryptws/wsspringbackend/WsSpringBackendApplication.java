package com.lancryptws.wsspringbackend;

import com.microsoft.applicationinsights.attach.ApplicationInsights;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WsSpringBackendApplication {

	public static void main(String[] args) {
		ApplicationInsights.attach();
		SpringApplication.run(WsSpringBackendApplication.class, args);
	}

}
