package com.easybank;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class EasyBankApplication {

	public static void main(String[] args) {
		SpringApplication.run(EasyBankApplication.class, args);
		log.info("Welcome to Nainital Bank Complaint Portal");
	}

}
