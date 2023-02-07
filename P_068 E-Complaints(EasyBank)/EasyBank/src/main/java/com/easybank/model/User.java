package com.easybank.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.*;


@Data
@Entity
@Table(name="userdetails")
public class User {
	@Id
	private int id;
	private String username;
	private String firstname;
	private String lastname;
	private String mobileno;
	private String emailid;
	private String password;
	
	public User() {
		
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
	public User(String username, String firstname, String lastname, String mobileno, String emailid, String password) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", mobileno=" + mobileno + ", emailid=" + emailid + ", password=" + password + "]";
	}
	
	
	
}
