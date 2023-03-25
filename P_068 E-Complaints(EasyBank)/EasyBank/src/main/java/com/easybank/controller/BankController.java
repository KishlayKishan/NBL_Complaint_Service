package com.easybank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybank.model.User;
import com.easybank.service.UserService;

@Controller
public class BankController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/home")
	public String Hello(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}
	
	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request,HttpSession session) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/register")
	public String Registration(HttpServletRequest request ) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "welcomepage";
	}
	
	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveUser(user);
		request.setAttribute("mode","MODE_LOGIN" );
		return "welcomepage";
	}
	
	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request ) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request ) {
		userService.deleteUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,HttpServletRequest request ) {
		userService.editUser(id);
		request.setAttribute("user", userService.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "welcomepage";
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request,HttpSession httpSession ) {
		User userLoginCheck=userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if(userLoginCheck!=null) {
			httpSession.setAttribute("user_name", userLoginCheck.getEmailid());
			httpSession.setAttribute("userDetails", userLoginCheck);
			httpSession.setAttribute("user_role", "USER");
			httpSession.setAttribute("id", userLoginCheck.getId());
			request.setAttribute("mode", "MODE_HOME");
			return "homepage";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password ");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpSession httpSession) {
		httpSession.invalidate();
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "complaints";
	}

}


