package com.easybank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer>{
	
	public Admin findByUsernameAndPassword(String username, String password);
}
