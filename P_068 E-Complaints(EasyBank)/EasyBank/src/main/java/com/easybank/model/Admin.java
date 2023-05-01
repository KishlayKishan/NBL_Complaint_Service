package com.easybank.model;



import lombok.Data;

import javax.persistence.*;
//import javax.persistence.Id;
//import javax.persistence.Table;

@Data
@Entity
@Table(name="adminlog")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(unique = true)
	private String username;
	private String firstname;
	private String lastname;
	private String level;
	private String branchname;
	private String location;
	private String mobileno;
	@Column(unique = true)
	private String emailid;
	private String password;
	
	
	public Admin() {
		super();
	}

	public Admin(String username, String firstname, String lastname, String level, String branchname, String location,
			String mobileno, String emailid, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.level = level;
		this.branchname = branchname;
		this.location = location;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.password = password;
	}

}
