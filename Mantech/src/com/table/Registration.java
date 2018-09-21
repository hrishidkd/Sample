package com.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Registration_Table")
public class Registration {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int eId;
	private String name;
	private String username;
	private String password;
	private String email;
	private String mobileNumber;

	public Registration() {

	}

	public Registration(String name, String username, String password, String email, String mobileNumber) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.mobileNumber = mobileNumber;
	}

	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Override
	public String toString() {
		return "Registration [eId=" + eId + ", name=" + name + ", username=" + username + ", password=" + password
				+ ", email=" + email + ", mobileNumber=" + mobileNumber + "]";
	}

}
