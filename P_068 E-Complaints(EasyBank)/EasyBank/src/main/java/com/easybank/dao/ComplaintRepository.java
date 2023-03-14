package com.easybank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, String>{

	//List<Complaint> findByFirstname(String firstname);

	List<Complaint> findAllByAssigntoIsNull();
	
}
