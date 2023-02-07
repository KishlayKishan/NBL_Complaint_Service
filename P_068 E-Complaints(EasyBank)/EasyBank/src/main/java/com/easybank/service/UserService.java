package com.easybank.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.UserRepository;
import com.easybank.model.User;


@Service
@Transactional
public class UserService {
	
	private final UserRepository userRepo;
	
	public UserService(UserRepository userRepo) {
		super();
		this.userRepo = userRepo;
	}

	public void saveUser(User user) {
		userRepo.save(user);
	}
	
	public List<User> showAllUsers() {
		List<User> users = new ArrayList<User>();
		for(User user : userRepo.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	
	public void deleteUser(int id) {
	userRepo.deleteById(id);
	}
	
	public User editUser(int id) {
		return userRepo.findById(id).orElse(new User());
		}
	
	public User findByUsernameAndPassword(String username, String password) {
		return userRepo.findByUsernameAndPassword(username, password);	
	}
	 
}
