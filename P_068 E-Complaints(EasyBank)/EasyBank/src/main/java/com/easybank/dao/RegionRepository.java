package com.easybank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Region;

public interface RegionRepository extends JpaRepository<Region, Integer>{
	
	public Region findByUsernameAndPassword(String username, String password);
}