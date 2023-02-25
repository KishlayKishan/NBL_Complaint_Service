package com.easybank.dao;

import org.springframework.data.repository.CrudRepository;

import com.easybank.model.SuperAdmin;

public interface SuperAdminRepository extends CrudRepository<SuperAdmin, Integer>{
	
	public SuperAdmin findByUsernameAndPassword(String username, String password);
}
