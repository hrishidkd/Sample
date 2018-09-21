package com.table;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Complaint_table")
public class Complaints {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	String complianeeName;
	String technicianName;
	int technician_Eid;
	Date startDate;
	Date endDate;
	String priority;
	String department;
	String category;
	String status;

	public Complaints() {
		// TODO Auto-generated constructor stub
	}

	public Complaints(String complianeeName, Date startDate, String priority, String department, String category,
			String status) {
		super();
		this.complianeeName = complianeeName;
		this.startDate = startDate;
		this.priority = priority;
		this.department = department;
		this.category = category;
		this.status = status;
	}

	public Complaints(String complianeeName, int technician_Eid, Date startDate, String priority, String department,
			String category, String status) {
		super();
		this.complianeeName = complianeeName;
		this.technician_Eid = technician_Eid;
		this.startDate = startDate;
		this.priority = priority;
		this.department = department;
		this.category = category;
		this.status = status;
	}

	public Complaints(String complianeeName, String technicianName, int technician_Eid, Date startDate, Date endDate,
			String priority, String department, String category, String status) {
		super();
		this.complianeeName = complianeeName;
		this.technicianName = technicianName;
		this.technician_Eid = technician_Eid;
		this.startDate = startDate;
		this.endDate = endDate;
		this.priority = priority;
		this.department = department;
		this.category = category;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComplianeeName() {
		return complianeeName;
	}

	public void setComplianeeName(String complianeeName) {
		this.complianeeName = complianeeName;
	}

	public String getTechnicianName() {
		return technicianName;
	}

	public void setTechnicianName(String technicianName) {
		this.technicianName = technicianName;
	}

	public int getTechnician_Eid() {
		return technician_Eid;
	}

	public void setTechnician_Eid(int technician_Eid) {
		this.technician_Eid = technician_Eid;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Complaints [id=" + id + ", complianeeName=" + complianeeName + ", technicianName=" + technicianName
				+ ", technician_Eid=" + technician_Eid + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", priority=" + priority + ", department=" + department + ", category=" + category + ", status="
				+ status + "]";
	}

}
