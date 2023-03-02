package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

	public Complaint editStatus(int id) {
		return complaintRepo.findById(id).orElse(new Complaint());
	}

	public void deleteComplaint(int id) {
		complaintRepo.deleteById(id);
	}

	public void complainstatus(int id) {
		complaintRepo.findById(id);

	}

	public void rollbackToUser(int id) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(id);
		complaintCheck.ifPresent((Complaint c) -> {
			c.setStep(ComplaintActions.ADMIN_ROLLBACK_TO_USER);
			complaintRepo.save(c);
		});

	}
}
