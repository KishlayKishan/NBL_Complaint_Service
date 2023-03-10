package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.ComplaintRepository;
import com.easybank.enums.ComplaintActions;
import com.easybank.model.Complaint;

@Service
@Transactional
public class ComplaintService {

	private final ComplaintRepository complaintRepo;

	public ComplaintService(ComplaintRepository complaintRepo) {
		this.complaintRepo = complaintRepo;
	}

	public void updateComplaint(Complaint complaint) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaint.getId());
		complaintCheck.ifPresent((Complaint c) -> {
			c.setAssigndate(complaint.getAssigndate());
			c.setBranch(complaint.getBranch());
			c.setCategory(complaint.getCategory());
			c.setDetails(complaint.getDetails());
			c.setEmailid(complaint.getEmailid());
//			c.setFirstname(complaint.getF);
//			c.setLastname(null);
			c.setSubcategory(complaint.getSubcategory());
			c.setStatus(complaint.getStatus());
			c.setPriority(complaint.getPriority());
			c.setAssignto(complaint.getAssignto());
			c.setReview(complaint.getReview());
			complaintRepo.save(c);
		});
	}

	public void markForSuperAdmin(Integer complaintId, Integer superAdminId) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaintId);
		complaintCheck.ifPresent((Complaint c) -> {
			c.setStep(ComplaintActions.MOVED_TO_SUPER_ADMIN);
			c.setIsMarkedForSuperAdmin(superAdminId);
			complaintRepo.save(c);
		});
	}

	public void saveComplaint(Complaint complaint,Integer userId) {
		complaint.setUserId(userId);
		complaintRepo.save(complaint);
	}

	public List<Complaint> showAllComplaints() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaints=complaintRepo.findAll();

		return complaints;
	}

	public Complaint editStatus(int id) {
		return complaintRepo.findById(id).orElse(new Complaint());
	}

	public void deleteComplaint(int id) {
		complaintRepo.deleteById(id);
	}

	public List<Complaint> checkStatus(Integer userId) {
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaints=complaintRepo.findAll().stream().filter(x->x.getUserId()==userId).collect(Collectors.toList());
		return complaints;
	}

	public Complaint getComplaintById(int cid) {
		return complaintRepo.findById(cid).get();
	}
	
	public void userUpdateComplaint(Complaint complaint) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaint.getId());
		complaintCheck.ifPresent((Complaint c) -> {
			c.setDetails(complaint.getDetails());
			c.setStep(ComplaintActions.USER_UPDATED);
			complaintRepo.save(c);
		});
	}
	
	public void requestToClose(int id) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(id);
		complaintCheck.ifPresent((Complaint c) -> {
			c.setStep(ComplaintActions.USER_REQUEST_TO_CLOSE);
			complaintRepo.save(c);
		});
	}
}
