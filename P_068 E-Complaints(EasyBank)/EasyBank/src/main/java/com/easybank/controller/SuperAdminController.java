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

import com.easybank.model.Admin;
import com.easybank.model.SuperAdmin;
import com.easybank.service.SuperAdminService;

@Controller
public class SuperAdminController {
	
	@Autowired
	private SuperAdminService adminService;
	
	@RequestMapping("/superAdminRegistration")
	public String adminRegistration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER_SUPER_ADMIN");
		request.setAttribute("path", "register-super-admin");
		return "complaints";
	}
	
	@RequestMapping("/superAdminLogin")
	public String admin(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN_SUPER_ADMIN");
		request.setAttribute("path", "login-super-admin");
		return "complaints";
	}
	
	@PostMapping("/register-super-admin")
	public String saveAdmin(@ModelAttribute SuperAdmin admin, BindingResult bindingResult, HttpServletRequest request ) {
		adminService.saveSuperAdmin(admin);
		request.setAttribute("mode", "MODE_LOGIN_SUPER_ADMIN");
		request.setAttribute("path", "login-super-admin");
		return "complaints";
	}
	
	@RequestMapping("/login-super-admin")
	public String loginUser(@ModelAttribute Admin admin, HttpServletRequest request ,HttpSession httpSession) {
		SuperAdmin adminLoginCheck=adminService.findByUsernameAndPassword(admin.getUsername(), admin.getPassword());
		if(adminLoginCheck!=null) {
			httpSession.setAttribute("user_name", adminLoginCheck.getEmailid());
			httpSession.setAttribute("id", adminLoginCheck.getId());
			httpSession.setAttribute("user_role", "SUPER_ADMIN");
			request.setAttribute("mode", "MODE_HOME");
			return "complaints";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password ");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
		}
	}
	
	@GetMapping("/show-complaints-super-admin")
	public String showAllComplaints(HttpServletRequest request,HttpSession httpSession ) {
		Integer superAdminId=(Integer) httpSession.getAttribute("id");
		request.setAttribute("complaints", adminService.allForwardedComplaints(superAdminId));
		request.setAttribute("mode", "ALL_COMPLAINTS");
		return "complaints";
	}
//	@RequestMapping("/edit-status-super-admin")
//	public String editStatus(@RequestParam int id,HttpServletRequest request ) {
//		request.setAttribute("complaint", adminService.editStatus(id));
//		request.setAttribute("mode", "MODE_UPDATE");
//		return "complaints";
//	}
}
