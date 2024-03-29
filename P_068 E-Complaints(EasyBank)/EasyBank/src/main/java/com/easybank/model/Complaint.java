package com.easybank.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.easybank.enums.ComplaintActions;

import lombok.Data;

@Data
@Entity
@Table(name = "complaint")
public class Complaint implements Serializable {
	@Id
	@GeneratedValue(generator = "myStringSequenceGenerator")
    @GenericGenerator(name = "myStringSequenceGenerator", strategy = "com.easybank.model.CustomStringSequenceGenerator")
	private String id;
	private String firstname;
	private String lastname;
	private String emailid;
	private String accountType;
	private String accountno;
	@Column(name = "COMPLAINT_DATE")
	private LocalDate date=LocalDate.now();
	private String category;
	private String subcategory;
	private String branch;
	@Lob
	private String details;
	private String assignto;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date assigndate;
	private String priority;
	private String status;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date closeddate;
	private String review;
	private Integer userId;
	private Integer isMarkedForSuperAdmin;
	@Lob
	private String complainFeedback;
	@Enumerated(EnumType.STRING)
	private ComplaintActions step;
    private LocalDateTime lastUpdateDate=LocalDateTime.now();
	
	public Complaint() {
	}

	public Complaint(String id, String firstname, String lastname, String emailid, String accountType, String accountno,
			LocalDate date, String category, String subcategory, String branch, String details, String assignto,
			Date assigndate, String priority, String status, Date closeddate, String review, Integer userId,
			Integer isMarkedForSuperAdmin, String complainFeedback, ComplaintActions step, LocalDateTime lastUpdateDate) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.emailid = emailid;
		this.accountType = accountType;
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
		this.complainFeedback = complainFeedback;
		this.step = step;
		this.lastUpdateDate = lastUpdateDate;
	}

}
