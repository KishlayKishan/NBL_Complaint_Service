package com.easybank.scheduler;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

import com.easybank.model.Branch;
import com.easybank.service.BranchService;
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

	@Autowired
	BranchService branchService;


	@Scheduled(cron = "* * * * * *")     //"0 0 0 * * *" for 12 non  //"* * * * * *" = For every second //0 * * * * * = for every minute
    public void runAutoAssignToRandomAdmins() {

		log.info("runAutoAssignToRandomAdmins started!");


        
        List<Complaint> complaints=adminService.getAllComplaintsNotAssignedToAnyOne();
		List<Branch> allAdmins=null;
        for(Complaint complaint:complaints) {
			if(checkSevenDaysPassedAndNotAssigned(complaint)) {
				allAdmins=branchService.getAllBranchExceptMe(Integer.parseInt(complaint.getAssignto()));
				Branch admin = allAdmins.get(getRandomNumberBetweenRange(allAdmins.size()));
				adminService.assignToRandomBranches(complaint, admin);
			}else{
				if(complaint.getAssignto()==null) {
					allAdmins = branchService.getAllBranchExceptMe(-1);
					Branch admin = allAdmins.get(getRandomNumberBetweenRange(allAdmins.size()));
					adminService.assignToRandomBranches(complaint, admin);
				}
			}
        }

		log.info("runAutoAssignToRandomAdmins ended!");
    }


	public static int getRandomNumberBetweenRange(int maxVal) {
		Random random=new Random();
		return random.nextInt(maxVal);
	}

	public static boolean checkSevenDaysPassedAndNotAssigned(Complaint complaint){
		if(complaint.getStatus().equalsIgnoreCase("Open") && complaint.getAssignto()!=null){
			Calendar cal = Calendar.getInstance();

			cal.add(Calendar.DAY_OF_MONTH, -7);
			Date sevenDaysAgo = cal.getTime();

			Date dateToCheck = complaint.getAssigndate();
			if(dateToCheck.before(sevenDaysAgo)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}
