package com.easybank.service;

import com.easybank.dao.ComplaintRepository;
import com.easybank.dao.RegionRepository;
import com.easybank.enums.ComplaintActions;
import com.easybank.model.Complaint;
import com.easybank.model.Region;
import com.easybank.util.EmailSenderService;
import com.easybank.util.TokenUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;


@Service
@Transactional
public class RegionService {

    @Autowired
    EmailSenderService mailService;

    @Autowired
    TokenUtility util;

    @Autowired
    RegionRepository regionRepo;

    @Autowired
    ComplaintRepository complaintRepo;


    public String addRegion(Region newRegion) {
        regionRepo.save(newRegion);
        String token = util.createToken(newRegion.getId());
        mailService.sendEmail(newRegion.getEmailid(), "Region Registration", " Hi " + newRegion.getFirstname() + " You Have Been Successfully Registerd on Nainital Bank Complaint Portal. Please Click here to get data-> " + "http://localhost:8085/save-region" + token);
        return token;
    }


    public RegionService(RegionRepository regionRepo) {
        super();
        this.regionRepo = regionRepo;
    }

    public void saveRegion(Region region) {
        regionRepo.save(region);
    }

    public List<Region> showAllRegions() {
        List<Region> branches = new ArrayList<Region>();
        for (Region region : regionRepo.findAll()) {
            branches.add(region);
        }

        return branches;
    }

    public void deleteRegion(int id) {
        regionRepo.deleteById(id);
    }

    public Region editRegion(int id) {
        return regionRepo.findById(id).orElse(new Region());
    }

    public Region findByRegionNameAndPassword(String username, String password) {
        return regionRepo.findByUsernameAndPassword(username, password);
    }

    private String generateToken() {
        StringBuilder token = new StringBuilder();
        return token.append(UUID.randomUUID().toString()).append(UUID.randomUUID().toString()).toString();
    }

    public List<Complaint> showAssignedComplaints() {
        List<Complaint> complaints = new ArrayList<Complaint>();
        complaints = complaintRepo.findAll();

        return complaints;
    }

    public Complaint editStatus(String id) {
        return complaintRepo.findById(id).orElse(new Complaint());
    }

    public List<Region> getAllRegionExceptMe(int id) {
        if (id == -1) {
            return regionRepo.findAll();
        } else {
            return regionRepo.findAll().stream().filter(x -> x.getId() != id).collect(Collectors.toList());
        }
    }

    public void deleteComplaint(String id) {
        complaintRepo.deleteById(id);
    }

    public void complainstatus(String id) {
        complaintRepo.findById(id);

    }

    public void rollbackToBranch(String id) {
        Optional<Complaint> complaintCheck = complaintRepo.findById(id);
        complaintCheck.ifPresent((Complaint c) -> {
            c.setStep(ComplaintActions.REGION_ROLLBACK_TO_BRANCH);
            c.setLastUpdateDate(LocalDateTime.now());
            complaintRepo.save(c);
        });

    }

    public List<Complaint> getAllComplaintsNotAssignedToAnyOne() {
        String status = "Open";

        return complaintRepo.findByAssigntoNullOrAssigntoNotNullAndStatusAndAssigntoNotIn(status);
    }

    public Region getRegionById(Integer id){
        return regionRepo.findById(id).get();
    }


}



