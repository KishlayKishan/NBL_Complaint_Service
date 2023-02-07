package com.easybank.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybank.model.Complaint;
import com.easybank.service.ComplaintService;

@Controller
public class ComplaintController {
	@Autowired
	ComplaintService complaintService;
	
	@RequestMapping("/get-form")
	public String getForm(HttpServletRequest request ) {
		request.setAttribute("mode", "MODE_FORM");
		return "homepage";
	}
	
	@PostMapping("/save-complaint")
	public String saveComplaint(@ModelAttribute Complaint complaint, BindingResult bindingResult, HttpServletRequest request) {
		complaintService.saveComplaint(complaint);
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}
	@RequestMapping("/contact")
	public String contact(HttpServletRequest request) {
		request.setAttribute("mode", "CONTACT_US");
		return "homepage";
	}
	@RequestMapping("/checkStatus")
	public String checkStatus( HttpServletRequest request) {
		request.setAttribute("complaints", complaintService.checkStatus());
		request.setAttribute("mode", "CHECKSTATUS");
		return "homepage";
	}
}
