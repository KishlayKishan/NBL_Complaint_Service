package com.easybank.model;



import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name="super_admin_log")
public class SuperAdmin {
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
	private String department; 
	private String position;
	
	
	public SuperAdmin() {
		super();
	}


	public SuperAdmin(String username, String firstname, String lastname, String level, String branchname, String location,
			String mobileno, String emailid, String password, String department, String position) {
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
		this.department = department;
		this.position = position;
	}


}
