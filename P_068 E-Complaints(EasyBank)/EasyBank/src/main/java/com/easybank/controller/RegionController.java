package com.easybank.controller;

import com.easybank.model.Region;
import com.easybank.model.SuperAdmin;
import com.easybank.model.User;
import com.easybank.service.AdminService;
import com.easybank.service.ComplaintService;
import com.easybank.service.RegionService;
import com.easybank.service.SuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegionController {

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

    @RequestMapping("/regionRegistration")
    public String regionRegistration(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_REGISTER");
        return "complaints";
    }

    @PostMapping("/save-region")
    public String saveRegion(@ModelAttribute Region region, BindingResult bindingResult, HttpServletRequest request) {
        regionService.saveRegion(region);
        request.setAttribute("mode", "MODE_LOGIN");
        return "complaints";
    }

    @RequestMapping("/login-region")
    public String loginUser(@ModelAttribute Region region, HttpServletRequest request, HttpSession httpSession) {
        Region regionLoginCheck = regionService.findByRegionNameAndPassword(region.getUsername(), region.getPassword());
        if (regionLoginCheck != null) {
            httpSession.setAttribute("user_name", regionLoginCheck.getEmailid());
            httpSession.setAttribute("user_role", "REGION");
            httpSession.setAttribute("userDetails", regionLoginCheck);
            httpSession.setAttribute("id", regionLoginCheck.getId());
            request.setAttribute("mode", "MODE_HOME");
            return "complaints";
        } else {
            request.setAttribute("error", "Invalid Username or Password ");
            request.setAttribute("mode", "MODE_LOGIN");
            return "welcomepage";
        }
    }

    @GetMapping("/show-complaints")
    public String showAllComplaints(HttpServletRequest request,HttpSession session) {
        Region currentUser = (Region) session.getAttribute("userDetails");
        request.setAttribute("complaints", complaintService.findByAssignedTo(currentUser.getId()+""));
        request.setAttribute("mode", "ALL_COMPLAINTS");
        return "complaints";
    }

    @RequestMapping("/edit-status")
    public String editStatus(@RequestParam String id, HttpServletRequest request, HttpSession httpSession) {
        request.setAttribute("complaint", regionService.editStatus(id));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(id));
        request.setAttribute("mode", "MODE_UPDATE");
        request.setAttribute("allRegions", regionService.getAllRegionExceptMe(-1));
        return "complaints";
    }

    @RequestMapping("/get-all-superAdmin")
    public String getAllSuperAdmin(@RequestParam String id, HttpServletRequest request) {
        request.setAttribute("superAdmins", superAdminService.getAllSuperAdmin());
        request.setAttribute("mode", "MODE_FORWARD_TO_SUPERADMIN");
        request.setAttribute("complainId", id);
        return "complaints";
    }

    @RequestMapping("/forward-to-super-region")
    public String forwardToSuperAdmin(@RequestParam String complaintId, @RequestParam int superAdminId, HttpServletRequest request) throws Exception {
        SuperAdmin superAdmin = superAdminService.getAdminById(superAdminId);
        if (superAdmin == null) {
            throw new Exception("Super Admin Does not Exists!");
        }
        complaintService.markForSuperAdmin(complaintId, superAdmin.getId());
        request.setAttribute("complaint", regionService.editStatus(complaintId));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(complaintId));
        request.setAttribute("mode", "MODE_UPDATE");
        return "complaints";
    }

    @RequestMapping("/rollback-to-branch")
    public String rollbackToBranch(@RequestParam String complaintId, HttpServletRequest request) throws Exception {
        regionService.rollbackToBranch(complaintId);
        request.setAttribute("complaint", regionService.editStatus(complaintId));
        request.setAttribute("complaint_history", complaintService.getAllComplaintHistoryOfComplaint(complaintId));
        request.setAttribute("mode", "MODE_UPDATE");
        return "complaints";
    }

    @RequestMapping("/delete-complaint")
    public String deleteComplaint(@RequestParam String id, HttpServletRequest request,HttpSession session) {

        Region currentUser = (Region) session.getAttribute("userDetails");
        regionService.deleteComplaint(id);
        request.setAttribute("complaint", complaintService.findByAssignedTo(currentUser.getId()+""));
        request.setAttribute("mode", "All_COMPLAINTS");
        return "complaints";

    }


}

