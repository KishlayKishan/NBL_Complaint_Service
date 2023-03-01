package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.ComplaintRepository;
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
			c.setIsMarkedForSuperAdmin(superAdminId);
			complaintRepo.save(c);
		});
	}

	public void saveComplaint(Complaint complaint) {
		complaintRepo.save(complaint);
	}

	public List<Complaint> showAllComplaints() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		for (Complaint complaint : complaintRepo.findAll()) {
			complaints.add(complaint);
		}

		return complaints;
	}

	public Complaint editStatus(int id) {
		return complaintRepo.findById(id).orElse(new Complaint());
	}

	public void deleteComplaint(int id) {
		complaintRepo.deleteById(id);
	}

	public List<Complaint> checkStatus() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		for (Complaint complaint : complaintRepo.findAll()) {
			complaints.add(complaint);
		}
		return complaints;
	}

	public Complaint getComplaintById(int cid) {
		return complaintRepo.findById(cid).get();
	}
}
