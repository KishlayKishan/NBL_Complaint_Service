package com.easybank.model;



import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.*;
//import javax.persistence.Id;
//import javax.persistence.Table;

@Data
@Entity
@Table(name="adminlog")
public class Admin {
	@Id
	private int id;
	private String username;
	private String firstname;
	private String lastname;
	private String branchname;
	private String location;
	private String mobileno;
	private String emailid;
	private String password;
	
	
	public Admin() {
		super();
	}

	public Admin(String username, String firstname, String lastname, String branchname, String location,
			String mobileno, String emailid, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.branchname = branchname;
		this.location = location;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", branchname=" + branchname + ", location=" + location + ", mobileno=" + mobileno + ", emailid="
				+ emailid + ", password=" + password + "]";
	}
	
	
	
	
	
	
}
