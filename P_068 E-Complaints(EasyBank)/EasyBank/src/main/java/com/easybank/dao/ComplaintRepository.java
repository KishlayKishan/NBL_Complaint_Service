package com.easybank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.easybank.model.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer>{

	//List<Complaint> findByFirstname(String firstname);

	
}
