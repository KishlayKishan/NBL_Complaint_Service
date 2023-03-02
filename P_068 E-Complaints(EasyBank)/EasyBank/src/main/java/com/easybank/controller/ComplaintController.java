package com.easybank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easybank.enums.ComplaintActions;
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
	public String saveComplaint(@ModelAttribute Complaint complaint, BindingResult bindingResult, HttpServletRequest request,HttpSession httpSession ) {
		Integer userId=(Integer) httpSession.getAttribute("id");
		complaint.setStep(ComplaintActions.USER_SUBMIT);
		complaintService.saveComplaint(complaint,userId);
		request.setAttribute("mode", "MODE_HOME");
		return "homepage";
	}
	
	@PostMapping("/update-complaint")
	public String updateComplaint(@ModelAttribute Complaint complaint, BindingResult bindingResult, HttpServletRequest request) {
		complaintService.updateComplaint(complaint);
		complaint.setStep(ComplaintActions.USER_UPDATED);
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
	public String checkStatus( HttpServletRequest request,HttpSession httpSession) {
		Integer userId=(Integer) httpSession.getAttribute("id");
		request.setAttribute("complaints", complaintService.checkStatus(userId));
		request.setAttribute("mode", "CHECKSTATUS");
		return "homepage";
	}
	
	@RequestMapping("/getStatus")
	public String checkStatus( HttpServletRequest request,@RequestParam("id") int cid) {
		request.setAttribute("complaints", complaintService.getComplaintById(cid));
		request.setAttribute("mode", "MODE_SHOW_USER_COMPLAINT");
		return "homepage";
	}

	@PostMapping("/user-update-complaint")
	public String userUpdateComplaint(@ModelAttribute Complaint complaint, BindingResult bindingResult, HttpServletRequest request) {
		complaintService.userUpdateComplaint(complaint);
		request.setAttribute("complaints", complaintService.getComplaintById(complaint.getId()));
		request.setAttribute("mode", "MODE_SHOW_USER_COMPLAINT");
		return "homepage";
	}
	@PostMapping("/request-to-close")
	public String requestToCloseComplaint(@RequestParam("id") int id, HttpServletRequest request) {
		complaintService.requestToClose(id);
		request.setAttribute("complaints", complaintService.getComplaintById(id));
		request.setAttribute("mode", "MODE_SHOW_USER_COMPLAINT");
		return "homepage";
	}


}
