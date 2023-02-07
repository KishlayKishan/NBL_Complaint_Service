package com.easybank.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.ComplaintRepository;
import com.easybank.model.Complaint;
import com.easybank.model.User;

@Service
@Transactional
public class ComplaintService {
	
	private final ComplaintRepository complaintRepo;

	public ComplaintService(ComplaintRepository complaintRepo) {
		this.complaintRepo = complaintRepo;
	}
	
	public void saveComplaint(Complaint complaint) {
		complaintRepo.save(complaint);
	}
	
	public List<Complaint> showAllComplaints() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		for(Complaint complaint : complaintRepo.findAll()) {
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
		for(Complaint complaint : complaintRepo.findAll()) {
			complaints.add(complaint);
		}
		return complaints;
	}
}


