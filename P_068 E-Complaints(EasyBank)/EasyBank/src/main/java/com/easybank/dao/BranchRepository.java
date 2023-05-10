package com.easybank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Branch;

public interface BranchRepository extends JpaRepository<Branch, Integer>{
	
	public Branch findByUsernameAndPassword(String username, String password);
}