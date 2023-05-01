package com.easybank.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import com.easybank.model.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybank.dao.ComplaintHistoryRepository;
import com.easybank.dao.ComplaintRepository;
import com.easybank.enums.ComplaintActions;

@Service
@Transactional
@Slf4j
public class ComplaintService {
	@Autowired
	private ComplaintRepository complaintRepo;

	@Autowired
	private ComplaintHistoryRepository complaintHistoryRepo;


	public void updateComplaint(Complaint complaint,Admin admin,String role) {
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
			c.setCloseddate(complaint.getCloseddate());
			c.setReview(complaint.getReview());
			c.setLastUpdateDate(LocalDateTime.now());

			ComplaintHistory complaintHistory=new ComplaintHistory();
			complaintHistory.setComplaintId(complaint.getId());
			complaintHistory.setFeedback(complaint.getComplainFeedback());
			complaintHistory.setName(admin.getFirstname()+" "+admin.getLastname());
			complaintHistory.setModifiedByRole(role);
			complaintHistory.setModifiedEntityId(admin.getId());
			complaintHistoryRepo.save(complaintHistory);

			complaintRepo.save(c);
		});
	}

	public void updateComplaintSuperAdmin(Complaint complaint, SuperAdmin admin, String role) {
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
			c.setCloseddate(complaint.getCloseddate());
			c.setReview(complaint.getReview());
			c.setLastUpdateDate(LocalDateTime.now());

			ComplaintHistory complaintHistory=new ComplaintHistory();
			complaintHistory.setComplaintId(complaint.getId());
			complaintHistory.setFeedback(complaint.getComplainFeedback());
			complaintHistory.setName(admin.getFirstname()+" "+admin.getLastname());
			complaintHistory.setModifiedByRole(role);
			complaintHistory.setModifiedEntityId(admin.getId());
			complaintHistoryRepo.save(complaintHistory);

			complaintRepo.save(c);
		});
	}

	public void markForSuperAdmin(String complaintId, Integer superAdminId) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaintId);
		complaintCheck.ifPresent((Complaint c) -> {
			c.setStep(ComplaintActions.MOVED_TO_SUPER_ADMIN);
			c.setIsMarkedForSuperAdmin(superAdminId);
			complaintRepo.save(c);
		});
	}

	public Complaint saveComplaint(Complaint complaint,Integer userId) {
		complaint.setUserId(userId);
		return complaintRepo.save(complaint);
	}

	public List<Complaint> showAllComplaints() {
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaints=complaintRepo.findAll();

		return complaints;
	}

	public Complaint editStatus(String id) {
		return complaintRepo.findById(id).orElse(new Complaint());
	}

	public void deleteComplaint(String id) {
		complaintRepo.deleteById(id);
	}

	public List<Complaint> checkStatus(Integer userId) {
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaints=complaintRepo.findAll().stream().filter(x->x.getUserId()==userId).collect(Collectors.toList());
		return complaints;
	}

	public Complaint getComplaintById(String cid) {
		log.info("complaint cid: {}",cid);
		return complaintRepo.findById(cid).get();
	}

	public void userUpdateComplaint(Complaint complaint,User user,String role) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(complaint.getId());
		complaintCheck.ifPresent((Complaint c) -> {
			c.setDetails(complaint.getDetails());
			c.setStep(ComplaintActions.USER_UPDATED);
			c.setLastUpdateDate(LocalDateTime.now());

			ComplaintHistory complaintHistory=new ComplaintHistory();
			complaintHistory.setComplaintId(complaint.getId());
			complaintHistory.setFeedback(complaint.getComplainFeedback());
			complaintHistory.setName(user.getFirstname()+" "+user.getLastname());
			complaintHistory.setModifiedByRole(role);
			complaintHistory.setModifiedEntityId(user.getId());
			complaintHistoryRepo.save(complaintHistory);

			complaintRepo.save(c);
		});
	}

	public Complaint requestToClose(String id) {
		Optional<Complaint> complaintCheck = complaintRepo.findById(id);
		if(complaintCheck.isPresent()){
			Complaint c=complaintCheck.get();
			log.info("complaint is:{}",c);
				c.setStep(ComplaintActions.USER_REQUEST_TO_CLOSE);
				c.setLastUpdateDate(LocalDateTime.now());
				return complaintRepo.save(c);
		}
		else{
			return new Complaint();
		}
	}

	public List<ComplaintHistory> getAllComplaintHistoryOfComplaint(String complaintId) {
		return complaintHistoryRepo.findAllByComplaintId(complaintId);
	}
}
