package com.easybank.model;



import lombok.Data;

import javax.persistence.*;
//import javax.persistence.Id;
//import javax.persistence.Table;

@Data
@Entity
@Table(name="regionlog")
public class Region {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(unique = true)
	private String username;
	private String firstname;
	private String lastname;
	private String region;
	private String location;
	private String mobileno;
	@Column(unique = true)
	private String emailid;
	private String password;
	
	
	public Region() {
		super();
	}

	public Region(String username, String firstname, String lastname, String region, String location,
			String mobileno, String emailid, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.level = region;
		this.location = location;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.password = password;
	}

}