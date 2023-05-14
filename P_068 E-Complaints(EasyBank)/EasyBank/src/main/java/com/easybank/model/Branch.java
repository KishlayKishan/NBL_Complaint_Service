package com.easybank.model;



import lombok.Data;

import javax.persistence.*;
//import javax.persistence.Id;
//import javax.persistence.Table;

@Data
@Entity
@Table(name="branchlog")
public class Branch {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(unique = true)
	private String username;
	private String firstname;
	private String lastname;
	private String region;
	private String branchname;
	private String location;
	private String mobileno;
	@Column(unique = true)
	private String emailid;
	private String password;
	private String level;
	
	
	public Branch() {
		super();
	}

	public Branch(String username, String firstname, String lastname, String region, String branchname, String location,
			String mobileno, String emailid, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.level = region;
		this.branchname = branchname;
		this.location = location;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.password = password;
	}

}