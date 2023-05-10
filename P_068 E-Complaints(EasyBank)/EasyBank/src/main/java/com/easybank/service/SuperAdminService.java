package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybank.dao.ComplaintRepository;
import com.easybank.dao.SuperAdminRepository;
import com.easybank.model.Complaint;
import com.easybank.model.SuperAdmin;

@Service
public class SuperAdminService {

	@Autowired
	SuperAdminRepository superAdminRepository;

	@Autowired
	ComplaintRepository complaintRepo;

	public List<SuperAdmin> getAllSuperAdmin(){
		List<SuperAdmin> superAdmins=new ArrayList<SuperAdmin>();
		superAdminRepository.findAll().forEach(s->{superAdmins.add(s);});
		return superAdmins;

	}

	public SuperAdmin getAdminById(Integer id){
		return superAdminRepository.findById(id).get();

	}

	public SuperAdmin saveSuperAdmin(SuperAdmin superAdmin){
		return superAdminRepository.save(superAdmin);

	}

	public List<Complaint> allForwardedComplaints(Integer adminId){
		List<Complaint> complaints = new ArrayList<Complaint>();
		complaintRepo.findAll().stream().filter(x->x.getIsMarkedForSuperAdmin().equals(adminId)).collect(Collectors.toList());
		return complaints;
	}

	public SuperAdmin findByUsernameAndPassword(String username, String password) {
		return superAdminRepository.findByUsernameAndPassword(username, password);
	}
}
