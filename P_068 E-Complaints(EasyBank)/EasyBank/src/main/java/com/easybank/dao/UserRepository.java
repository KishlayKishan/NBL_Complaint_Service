package com.easybank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.easybank.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

		public User findByUsernameAndPassword(String username, String password);
 
}
