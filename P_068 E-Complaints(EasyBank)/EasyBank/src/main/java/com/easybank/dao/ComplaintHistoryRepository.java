package com.easybank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.ComplaintHistory;

public interface ComplaintHistoryRepository extends JpaRepository<ComplaintHistory, Integer>{
	List<ComplaintHistory> findAllByComplaintId(String complaintId);
}
