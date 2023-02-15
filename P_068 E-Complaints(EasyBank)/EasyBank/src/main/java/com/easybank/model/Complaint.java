package com.easybank.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "complaint")
public class Complaint implements Serializable {
	@Id
	private int id;
	private String firstname;
	private String lastname;
	private String emailid;
	private String accountno;
	private String category;
	private String subcategory;
	private String branch;
	private String details;
	private String assignto;
	private String assigndate;
	private String priority;
	private String status;
	
	
	
	public Complaint() {
	}


	public Complaint(String firstname, String lastname, String emailid, String accountno, String category,
					 String subcategory, String branch, String details, String assignto, String assigndate, String priority, String status) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.emailid = emailid;
		this.accountno = accountno;
		this.category = category;
		this.subcategory = subcategory;
		this.branch = branch;
		this.details = details;
		this.assignto = assignto;
		this.assigndate = assigndate;
		this.priority = priority;
		this.status = status;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFirstname() {
		return firstname;
	}



	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}



	public String getLastname() {
		return lastname;
	}



	public void setLastname(String lastname) {
		this.lastname = lastname;
	}



	public String getEmailid() {
		return emailid;
	}



	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}



	public String getAccountno() {
		return accountno;
	}



	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getSubcategory() {
		return subcategory;
	}



	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public  String getBranch() { return branch; }

	public void setBranch(String branch) { this.branch = branch;}



	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public String getAssignto() {
		return assignto;
	}

	public void setAssignto(String assignto) {
		this.assignto = assignto;
	}

	public String getAssigndate() { return assigndate;}

	public void setAssigndate(String assigndate) {this.assigndate = assigndate;}







	public String getPriority() {
		return priority;
	}



	public void setPriority(String priority) {
		this.priority = priority;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Complaint [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", emailid=" + emailid
				+ ", accountno=" + accountno + ", category=" + category + ", subcategory=" + subcategory + ", branch=" + branch + ", details="
				+ details + ", assignto=" + assignto + ", assigndate=" + assigndate + ", priority=" + priority + ", status=" + status + "]";
	}
	
	
	
	
}
