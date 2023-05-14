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

import com.easybank.model.Branch;
import com.easybank.model.Region;
import com.easybank.model.Admin;
import com.easybank.model.SuperAdmin;
import com.easybank.service.BranchService;
import com.easybank.service.RegionService;
import com.easybank.service.AdminService;
import com.easybank.service.ComplaintService;
import com.easybank.service.SuperAdminService;

@Controller
public class BranchController {

    @Autowired
    private BranchService branchService;

    @Autowired
    private RegionService regionService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private SuperAdminService superAdminService;

    @RequestMapping("/complaints")
    public String allComplaints() {
        return "complaints";
    }

    @RequestMapping("/branchRegistration")
    public String branchRegistration(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_REGISTER");
        return "complaints";
    }

    @PostMapping("/save-branch")
    public String saveBranch(@ModelAttribute Branch branch, BindingResult bindingResult, HttpServletRequest request ) {
        branchService.saveBranch(branch);
        request.setAttribute("mode", "MODE_LOGIN");
        return "complaints";
    }

    @RequestMapping("/login-branch")
    public String loginUser(@ModelAttribute Branch branch, HttpServletRequest request ,HttpSession httpSession) {
        Branch branchLoginCheck=branchService.findByBranchNameAndPassword(branch.getUsername(), branch.getPassword());
        if(branchLoginCheck!=null) {
            httpSession.setAttribute("user_name", branchLoginCheck.getEmailid());
            httpSession.setAttribute("user_role", "BRANCH");
            httpSession.setAttribute("userDetails", branchLoginCheck);
            httpSession.setAttribute("id", branchLoginCheck.getId());
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
    public String showAllComplaints(HttpServletRequest request,HttpSession session) {
        Branch currentUser = (Branch) session.getAttribute("userDetails");
        request.setAttribute("complaints", complaintService.getAllComplaintByUserIdOrBranchIdOrRegionId(null,currentUser.getId(),null));
        request.setAttribute("mode", "ALL_COMPLAINTS");
        return "complaints";
    }

    @RequestMapping("/edit-status")
    public String editStatus(@RequestParam String id,HttpServletRequest request ,HttpSession httpSession) {
        request.setAttribute("complaint", branchService.editStatus(id));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(id));
        request.setAttribute("mode", "MODE_UPDATE");
        request.setAttribute("allBranch", branchService.getAllBranchExceptMe(-1));
        return "complaints";
    }

    @RequestMapping("/get-all-Region")
    public String getAllRegion(@RequestParam String id,HttpServletRequest request ) {
        request.setAttribute("Region", regionService.getRegion());
        request.setAttribute("mode", "MODE_FORWARD_TO_REGION");
        request.setAttribute("complainId", id);
        return "complaints";
    }

    @RequestMapping("/forward-to-Region")
    public String forwardToRegion(@RequestParam String complaintId,@RequestParam int RegionId,HttpServletRequest request ) throws Exception {
        Region region=regionService.getRegionById(regionId);
        if(region==null) {
            throw new Exception("NO REGION FOUND!");
        }
        complaintService.markForRegion(complaintId,region.getId());
        request.setAttribute("complaint", branchService.editStatus(complaintId));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(complaintId));
        request.setAttribute("mode", "MODE_UPDATE");
        return "complaints";
    }

    @RequestMapping("/rollback-to-user")
    public String rollbackToUser(@RequestParam String complaintId,HttpServletRequest request ) throws Exception {
        branchService.rollbackToUser(complaintId);
        request.setAttribute("complaint", branchService.editStatus(complaintId));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(complaintId));
        request.setAttribute("mode", "MODE_UPDATE");
        return "complaints";
    }

    @RequestMapping("/delete-complaint")
    public String deleteComplaint(@RequestParam String id, HttpServletRequest request ) {
        branchService.deleteComplaint(id);
        request.setAttribute("complaint", branchService.showAllComplaints());
        request.setAttribute("mode", "All_COMPLAINTS");
        return "complaints";

    }



}

