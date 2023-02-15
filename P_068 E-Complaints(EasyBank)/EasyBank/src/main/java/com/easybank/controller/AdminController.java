package com.easybank.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

import com.easybank.model.Admin;
import com.easybank.model.User;
import com.easybank.service.AdminService;
import com.easybank.service.ComplaintService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/complaints")
	public String allComplaints() {
		return "complaints";
	}
	
	@RequestMapping("/adminRegistration")
	public String adminRegistration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "complaints";
	}
	
	@PostMapping("/save-admin")
	public String saveAdmin(@ModelAttribute Admin admin, BindingResult bindingResult, HttpServletRequest request ) {
		adminService.saveAdmin(admin);
		request.setAttribute("mode", "MODE_HOME");
		return "complaints";
	}
	
	@RequestMapping("/login-admin")
	public String loginUser(@ModelAttribute Admin admin, HttpServletRequest request ) {
		if(adminService.findByUsernameAndPassword(admin.getUsername(), admin.getPassword())!=null) {
			request.setAttribute("mode", "MODE_HOME");
			return "complaints";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password ");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
		}
	}
	@GetMapping("/show-complaints")
	public String showAllComplaints(HttpServletRequest request ) {
		request.setAttribute("complaints", adminService.showAllComplaints());
		request.setAttribute("mode", "ALL_COMPLAINTS");
		return "complaints";
	}
	
	@RequestMapping("/edit-status")
	public String editStatus(@RequestParam int id,HttpServletRequest request ) {
		request.setAttribute("complaint", adminService.editStatus(id));
		request.setAttribute("mode", "MODE_UPDATE");
		//request.setAttribute("mode", "MODE_COMPLAINTS");
		return "complaints";
	}
	@RequestMapping("/delete-complaint")
	public String deleteComplaint(@RequestParam int id, HttpServletRequest request ) {
		adminService.deleteComplaint(id);
		request.setAttribute("complaint", adminService.showAllComplaints());
		request.setAttribute("mode", "All_COMPLAINTS");
		return "complaints";

	}



}
