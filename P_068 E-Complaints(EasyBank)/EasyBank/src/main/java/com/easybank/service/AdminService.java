package com.easybank.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybank.dao.AdminRepository;
import com.easybank.dao.ComplaintRepository;
import com.easybank.enums.ComplaintActions;
import com.easybank.model.Admin;
import com.easybank.model.Complaint;

@Service
@Transactional
public class AdminService {

	@Autowired
	ComplaintRepository complaintRepo;
	private final AdminRepository adminRepo;

	public AdminService(AdminRepository adminRepo) {
		this.adminRepo = adminRepo;
	}

	public void saveAdmin(Admin admin) {
		adminRepo.save(admin);
	}

	public Admin findByUsernameAndPassword(String username, String password) {
		return adminRepo.findByUsernameAndPassword(username, password);
	}

	public List<Complaint> showAllComplaints() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaints = complaintRepo.findAll();

		return complaints;
	}

	public Complaint editStatus(String id) {
		return complaintRepo.findById(id).orElse(new Complaint());
	}
	
	public List<Admin> getAllAdminExceptMe(int id) {
		if(id==-1) {
			return adminRepo.findAll();
		}else {
			return adminRepo.findAll().stream().filter(x->x.getId()!=id).collect(Collectors.toList());
		}
	}

	public void deleteComplaint(String id) {
		complaintRepo.deleteById(id);
	}

	public void complainstatus(String id) {
		complaintRepo.findById(id);

	}

	public void rollbackToUser(String id) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(id);
		complaintCheck.ifPresent((Complaint c) -> {
			c.setStep(ComplaintActions.ADMIN_ROLLBACK_TO_USER);
			c.setLastUpdateDate(LocalDateTime.now());
			complaintRepo.save(c);
		});

	}
	
	public List<Complaint> getAllComplaintsNotAssignedToAnyOne(){
		return complaintRepo.findAllByAssigntoIsNull();
	}
	
	public void assignToRandomAdmins(Complaint complaint,Admin admin) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaint.getId());
		complaintCheck.ifPresent((Complaint c) -> {
			c.setAssignto(""+admin.getId());
			c.setAssigndate(LocalDate.now());
			complaintRepo.save(c);
		});
	}
}
