package com.example.receiver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	Logger logger = LoggerFactory.getLogger(HelloController.class);

	@GetMapping("/")
	public String index() {
		logger.info("Request happened.");
		return "Greetings from Spring Boot!";
	}

}
