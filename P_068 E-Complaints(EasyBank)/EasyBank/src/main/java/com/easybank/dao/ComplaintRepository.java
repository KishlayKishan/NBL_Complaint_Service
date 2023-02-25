package com.easybank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer>{

	//List<Complaint> findByFirstname(String firstname);

	
}
