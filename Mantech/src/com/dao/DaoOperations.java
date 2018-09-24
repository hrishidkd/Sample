package com.dao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.table.Complaints;
import com.table.Employee;
import com.table.Login;
import com.table.Registration;

public class DaoOperations {

	Session session;

	public DaoOperations() {

		Configuration cfg = new AnnotationConfiguration();
		SessionFactory factory = cfg.configure().buildSessionFactory();
		session = factory.openSession();

	}

	//method to validate the login
	public boolean isValid(String username, String password) {
		boolean isValid = false;

		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Login where username = ? and password = ?");
		query.setString(0, username);
		query.setString(1, password);
		List<Login> list = new ArrayList<Login>();
		list = query.list();
		if (list.size() != 0) {
			isValid = true;
			System.out.println("----->Returned true for isValid");
		}

		t.commit();
		return isValid;

	}//end isValid

	
	//method to get the user role
	public String getRole(String username) {
		String role = null;

		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Login where username = ?");
		query.setString(0, username);
		List<Login> list = new ArrayList<Login>();
		list = query.list();
		if (list.size() != 0) {
			role = list.get(0).getRole();
			System.out.println("Role returned from getRole()---------->" + role);
		}

		t.commit();
		return role;
	}//end getRole

	
	//method to add a permanent user
	public void addUser(int eId, String name, String username, String password, String email, String mobileNumber,
			String role) {
		Employee emp = new Employee(eId, name, username, password, email, mobileNumber, role);

		Transaction t = session.beginTransaction();

		session.save(emp);

		t.commit();
	}//end addUser

	
	//method to return all complaints to admin
	public List<Complaints> getAllComplaints() {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		System.out.println("------>Before query creation.");
		Query query = session.createQuery("from Complaints");
		list = query.list();

		System.out.println("------>Before commit.");
		t.commit();
		return list;
	}//end getAllComplaints

	
	//method to return all Sorted complaints to admin
	public List<Complaints> getSortedComplaints() {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints order by department");
		list = query.list();

		t.commit();
		return list;
	}//end getSortedComplaints

	
	//method to return a list of avilable technician to the admin
	public List<Complaints> getTechnician(String role) {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Employee where role = ?");
		query.setString(0, role);
		list = query.list();

		t.commit();
		return list;
	}//end getTechnician

	
	//method to assign a technician by admin
	public void assignTechnician(int id, int technician_Eid) {
		Transaction t = session.beginTransaction();
		List<Employee> list = new ArrayList<Employee>();

		Query query = session.createQuery("select from Employee where eId = ?");
		query.setInteger(0, technician_Eid);
		list = query.list();
		String name = list.get(0).getName();

		Complaints obj = (Complaints) session.get(Complaints.class, id);
		obj.setTechnician_Eid(technician_Eid);
		obj.setTechnicianName(name);

		t.commit();
	}//end assignTechnician

	
	//method to add a temp user i.e. self registration
	public void addTempUser(String name, String username, String password, String email, String mobileNumber) {

		Registration reg = new Registration(name, username, password, email, mobileNumber);
		Transaction t = session.beginTransaction();
		session.save(reg);
		t.commit();
	}//end addTempUser
	
	
	//method to view all temp user to admin
	public List<String> viewTempUserList() {
		List<String> userList = new ArrayList<String>();
		Query query = session.createQuery("Select name from Registration");

		userList = query.list();

		for (String string : userList) {
			System.out.println(string);
		}
		return userList;
	}//end viewTempUserList

	
	//method to view details of a single temp user to admin, so that he can verify it.
	public List<Registration> viewTempUserDetails(String name) {
		List<Registration> userList = new ArrayList<Registration>();
		Query query = session.createQuery("From Registration where name='" + name + "'");
		userList = query.list();

		for (Registration reg : userList) {
			System.out.println(reg);
		}

		return userList;
	}//end viewTempUserDetails

	
	//method to lodge a new complaint
	public void createComplaint(String complianeeName, Date startDate, String priority, String department,
			String category) {

		Complaints obj = new Complaints(complianeeName, startDate, priority, department, category, "incomplete");
		Transaction t = session.beginTransaction();
		session.save(obj);
		t.commit();

	}//end createComplaint

	
	//method to check the status of the complaint.
	public String checkStatus(int cId) {
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints where id = ?");
		query.setInteger(0, cId);

		List<Complaints> list = new ArrayList<Complaints>();
		list = query.list();

		String status = list.get(0).getStatus();

		t.commit();

		return status;
	}//end checkStatus

	
	//method to change the status of the complaint by technician
	public void changeStatus(int id) {
		Transaction t = session.beginTransaction();

		Complaints obj = (Complaints) session.get(Complaints.class, id);
		obj.setStatus("Complete");

		t.commit();
	}//end changeStatus

	
	//method to generate summary report
	public void generateSummaryReport() throws IOException {
		File file = new File("summary_report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints order by department");
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("Complaint Id\t:\t" + obj.getId() + "\n");
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName() + "\n");
			bw.write("Technician Name\t:\t" + obj.getTechnicianName() + "\n");
			bw.write("Department\t\t:\t" + obj.getDepartment() + "\n");
			bw.write("Status\t\t\t:\t" + obj.getStatus() + "\n");

			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n-----------------------*End Of Report*--------------------------------");
		bw.close();

	}//endgenerateSummaryReport

	
	//method to generate detailed report by admin
	public void generateDetailedReport() throws IOException {
		File file = new File("detailed_report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints");
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();

			bw.write("Complaint Id\t:\t" + obj.getId() + "\n");
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName() + "\n");
			bw.write("Technician Name\t:\t" + obj.getTechnicianName() + "\n");
			bw.write("Department\t\t:\t" + obj.getDepartment() + "\n");
			bw.write("Start Date\t\t:\t" + obj.getStartDate() + "\n");
			bw.write("End Date\t\t:\t" + obj.getEndDate() + "\n");
			bw.write("Priority\t\t:\t" + obj.getPriority() + "\n");
			bw.write("Status\t\t\t:\t" + obj.getStatus() + "\n");
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n------------------------*End Of Report*-------------------------------");
		bw.close();

	}//end generateDetailedReport

	
	//method to generatePendingReportByDays by admin
	public void generatePendingReportByDays() throws IOException {
		File file = new File("pending_report_by_days.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints order by startDate");
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("ID\t\t\t:\t" + obj.getId());
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName());
			bw.write("Technician Name\t:\t" + obj.getTechnicianName());
			bw.write("Start Date\t\t:\t" + obj.getStartDate());
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n-------------------------*End Of Report*------------------------------");
		bw.close();

	}//end generatePendingReportByDays

	
	//method to generatePendingReportByPriority by admin
	public void generatePendingReportByPriority() throws IOException {
		File file = new File("pending_report_by_priority.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints order by priority");
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("ID\t\t\t:\t" + obj.getId());
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName());
			bw.write("Technician Name\t:\t" + obj.getTechnicianName());
			bw.write("Start Date\t\t:\t" + obj.getStartDate());
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n------------------------*End Of Report*-------------------------------");
		bw.close();

	}//end generatePendingReportByPriority

	
	//method to generateReportByDept by admin
	public void generateReportByDept(String dept) throws IOException {
		File file = new File("department_report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints where department = ?");
		query.setString(0, dept);
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("ID\t\t\t:\t" + obj.getId());
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName());
			bw.write("Technician Name\t:\t" + obj.getTechnicianName());
			bw.write("Category\t\t:\t" + obj.getCategory());
			bw.write("Start Date\t\t:\t" + obj.getStartDate());
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n--------------------------*End Of Report*-----------------------------");
		bw.close();
	}//end generateReportByDept

	
	//method to generateReportByTechnician by admin
	public void generateReportByTechnician(int id) throws IOException {
		File file = new File("technician_report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints where technician_Eid = ?");
		query.setInteger(0, id);
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("ID\t\t\t:\t" + obj.getId());
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName());
			bw.write("Technician Name\t:\t" + obj.getTechnicianName());
			bw.write("Category\t\t:\t" + obj.getCategory());
			bw.write("Start Date\t\t:\t" + obj.getStartDate());
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n-------------------------*End Of Report*------------------------------");
		bw.close();

	}//end generateReportByTechnician

	
	//method to generateReportByCategory by admin
	public void generateReportByCategory(String category) throws IOException {
		File file = new File("category_report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints where category = ?");
		query.setString(0, category);
		list = query.list();

		t.commit();

		Complaints obj = new Complaints();

		Iterator<Complaints> itr = list.iterator();
		while (itr.hasNext()) {

			obj = itr.next();
			bw.write("ID\t\t\t:\t" + obj.getId());
			bw.write("Complainee Name\t:\t" + obj.getComplianeeName());
			bw.write("Technician Name\t:\t" + obj.getTechnicianName());
			bw.write("Category\t\t:\t" + obj.getCategory());
			bw.write("Start Date\t\t:\t" + obj.getStartDate());
			bw.write("-----------------------------------------------------\n");

		}

		bw.write("\n---------------------------*End Of Report*----------------------------");
		bw.close();

	}//end generateReportByCategory

	public void finalize() {
		session.close();
	}

}
