package com.table;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Employee_table")
public class Employee {

	@Id
	private int eId;
	private String name;
	private String username;
	private String password;
	private String email;
	private String mobileNumber;
	private String role;

	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(int eId, String name, String username, String password, String email, String mobileNumber,
			String role) {
		super();
		this.eId = eId;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.role = role;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Employee [eId=" + eId + ", name=" + name + ", username=" + username + ", password=" + password
				+ ", email=" + email + ", mobileNumber=" + mobileNumber + ", role=" + role + "]";
	}

}
