package com.easybank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybank.model.User;
import com.easybank.service.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private UserService userService;
	
	/*@GetMapping("/")
	public String hello() {
		return "homepage";
	}*/
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam String username, @RequestParam String firstname, @RequestParam String lastname, @RequestParam String mobileno, @RequestParam String emailid, @RequestParam String password) {
		User user = new User(username, firstname, lastname, mobileno, emailid, password);
		userService.saveUser(user);
		return "User Saved";
	}
	
}
