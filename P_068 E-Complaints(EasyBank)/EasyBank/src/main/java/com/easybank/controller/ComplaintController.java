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
	@Autowired
	private ComplaintService adminService;
	
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
	
	@PostMapping("/update-complaint")
	public String updateComplaint(@ModelAttribute Complaint complaint, BindingResult bindingResult, HttpServletRequest request) {
		complaintService.updateComplaint(complaint);
		request.setAttribute("complaints", adminService.showAllComplaints());
		request.setAttribute("mode", "ALL_COMPLAINTS");
		return "complaints";
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
	
	@RequestMapping("/getStatus")
	public String checkStatus( HttpServletRequest request,@RequestParam("id") int cid) {
		request.setAttribute("complaints", complaintService.getComplaintById(cid));
		request.setAttribute("mode", "MODE_SHOW_USER_COMPLAINT");
		return "homepage";
	}



}
