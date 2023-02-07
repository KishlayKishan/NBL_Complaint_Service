package com.easybank.dao;

import org.springframework.data.repository.CrudRepository;

import com.easybank.model.Admin;

public interface AdminRepository extends CrudRepository<Admin, Integer>{
	
	public Admin findByUsernameAndPassword(String username, String password);
}
