package com.easybank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.easybank.dao.BranchRepository;
import com.easybank.model.Branch;
import com.easybank.util.EmailSenderService;
import com.easybank.util.TokenUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class BranchService {

    @Autowired
    EmailSenderService mailService;

    @Autowired
    TokenUtility util;


    public String addBranch(BranchRepository userRepository) {
        Branch newBranch = new Branch(userRepository);
        branchRepository.save(newBranch);
        String token = util.createToken(newBranch.getId());
        mailService.sendEmail(newBranch.getEmailid(), "Branch Registration", " Hi " + newBranch.getFirstname() +
                " You Have Been Successfully Registerd on Nainital Bank Complaint Portal. Please Click here to get data-> "
                + "http://localhost:8085/save-branch" + token);
        return token;
    }

    private final BranchRepository branchRepo;

    public BranchService(BranchRepository branchRepo) {
        super();
        this.branchRepo = branchRepo;
    }

    public void saveBranch(Branch branch) {
        branchRepo.save(branch);
    }

    public List<Branch> showAllBranchs() {
        List<Branch> branches = new ArrayList<Branch>();
        for(Branch branch : branchRepo.findAll()) {
            branches.add(branch);
        }

        return branches;
    }

    public void deleteBranch(int id) {
        branchRepo.deleteById(id);
    }

    public Branch editBranch(int id) {
        return branchRepo.findById(id).orElse(new Branch());
    }

    public Branch findByBranchnameAndPassword(String username, String password) {
        return branchRepo.findByBranchnameAndPassword(username, password);
    }

    private String generateToken() {
        StringBuilder token = new StringBuilder();
        return token.append(UUID.randomUUID().toString())
                .append(UUID.randomUUID().toString()).toString();
    }

    public List<Complaint> showAssignedComplaints() {
        List<Complaint> complaints = new ArrayList<Complaint>();
        complaints = complaintRepo.findAll();

        return complaints;
    }

    public Complaint editStatus(String id) {
        return complaintRepo.findById(id).orElse(new Complaint());
    }

    public Complaint editStatus(String id) {
        return complaintRepo.findById(id).orElse(new Complaint());
    }

    public List<Branch> getAllBranchExceptMe(int id) {
        if(id==-1) {
            return branchRepo.findAll();
        }else {
            return branchRepo.findAll().stream().filter(x->x.getId()!=id).collect(Collectors.toList());
        }

        public void deleteComplaint(String id) {
            complaintRepo.deleteById(id);
        }

        public void complainstatus(String id) {
            complaintRepo.findById(id);

        }

        public void rollbackToUser(String id) {
            Optional<Complaint> complaintCheck = complaintRepo.findById(id);
            complaintCheck.ifPresent((Complaint c) -> {
                c.setStep(ComplaintActions.BRANCH_ROLLBACK_TO_USER);
                c.setLastUpdateDate(LocalDateTime.now());
                complaintRepo.save(c);
            });

        }

        public List<Complaint> getAllComplaintsNotAssignedToAnyOne(){
            String status="Open";

            return complaintRepo.findByAssigntoNullOrAssigntoNotNullAndStatusAndAssigntoNotIn(status);
        }



    }
