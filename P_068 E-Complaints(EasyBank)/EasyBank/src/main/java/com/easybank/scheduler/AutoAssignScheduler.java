package com.easybank.scheduler;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.easybank.model.Admin;
import com.easybank.model.Complaint;
import com.easybank.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AutoAssignScheduler {
	@Autowired
	AdminService adminService;
	
	@Scheduled(cron = "0 0 0 * * *")
    public void runAutoAssignToRandomAdmins() {
		
		log.info("runAutoAssignToRandomAdmins started!");
		
        List<Admin> allAdmins=adminService.getAllAdminExceptMe(-1);
        
        List<Complaint> complaints=adminService.getAllComplaintsNotAssignedToAnyOne();
        
        for(Complaint complaint:complaints) {
        	Admin admin=allAdmins.get(getRandomNumberBetweenRange(allAdmins.size()));
        	adminService.assignToRandomAdmins(complaint, admin);
        }
		
		log.info("runAutoAssignToRandomAdmins ended!");
    }
	
	
	public static int getRandomNumberBetweenRange(int maxVal) {
		Random random=new Random();
		return random.nextInt(maxVal);
	}
}
