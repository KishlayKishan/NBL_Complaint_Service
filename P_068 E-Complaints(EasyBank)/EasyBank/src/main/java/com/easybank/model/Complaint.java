package com.easybank.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.easybank.enums.ComplaintActions;

import lombok.Data;

@Data
@Entity
@Table(name = "complaint")
public class Complaint implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String firstname;
	private String lastname;
	private String emailid;
	private String accountno;
	private String date;
	private String category;
	private String subcategory;
	private String branch;
	private String details;
	private String assignto;
	private String assigndate;
	private String priority;
	private String status;
	private String closeddate;
	private String review;
	private Integer userId;
	private Integer isMarkedForSuperAdmin;
	@Enumerated(EnumType.STRING)
	private ComplaintActions step;
	
	
	
	public Complaint(int id, String firstname, String lastname, String emailid, String accountno, String date,
			String category, String subcategory, String branch, String details, String assignto, String assigndate,
			String priority, String status, String closeddate, String review, Integer userId,
			Integer isMarkedForSuperAdmin,ComplaintActions step) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.emailid = emailid;
		this.accountno = accountno;
		this.date = date;
		this.category = category;
		this.subcategory = subcategory;
		this.branch = branch;
		this.details = details;
		this.assignto = assignto;
		this.assigndate = assigndate;
		this.priority = priority;
		this.status = status;
		this.closeddate = closeddate;
		this.review = review;
		this.userId = userId;
		this.isMarkedForSuperAdmin = isMarkedForSuperAdmin;
		this.step=step;
	}



	public Complaint() {
	}

	

}
