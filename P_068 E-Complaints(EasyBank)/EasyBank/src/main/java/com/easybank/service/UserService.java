package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.UserRepository;
import com.easybank.model.User;
import com.easybank.util.EmailSenderService;
import com.easybank.util.TokenUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class UserService {

	@Autowired
	EmailSenderService mailService;

	@Autowired
	TokenUtility util;


	public String addUser(UserRepository userRepository) {
		User newUser = new User(userRepository);
		userRepository.save(newUser);
		String token = util.createToken(newUser.getId());
		mailService.sendEmail(newUser.getEmailid(), "User Registration", " Hi " + newUser.getFirstname() +
				" You Have Been Successfully Registerd on Nainital Bank Complaint Portal. Please Click here to get data-> "
				+ "http://localhost:8085/save-user" + token);
		return token;
	}

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

	private String generateToken() {
		StringBuilder token = new StringBuilder();
		return token.append(UUID.randomUUID().toString())
				.append(UUID.randomUUID().toString()).toString();
	}
	 
}
