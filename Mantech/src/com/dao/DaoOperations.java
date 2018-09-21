package com.dao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
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
		}

		t.commit();
		return isValid;

	}

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
	}

	public void addUser(int eId, String name, String username, String password, String email, String mobileNumber,
			String role) {
		Employee emp = new Employee(eId, name, username, password, email, mobileNumber, role);

		Transaction t = session.beginTransaction();

		session.save(emp);

		t.commit();
	}

	public List<Complaints> getAllComplaints() {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		System.out.println("------>Before query creation.");
		Query query = session.createQuery("from Complaints");
		list = query.list();

		System.out.println("------>Before commit.");
		t.commit();
		return list;
	}

	public List<Complaints> getSortedComplaints() {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Complaints order by department");
		list = query.list();

		t.commit();
		return list;
	}

	public List<Complaints> getTechnician(String role) {
		List<Complaints> list = new ArrayList<Complaints>();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("from Employee where role = ?");
		query.setString(0, role);
		list = query.list();

		t.commit();
		return list;
	}

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
	}

	public void addTempUser(String name, String username, String password, String email, String mobileNumber) {

		Registration reg = new Registration(name, username, password, email, mobileNumber);
		Transaction t = session.beginTransaction();
		session.save(reg);
		t.commit();
	}

	public List<String> viewTempUserList() {
		List<String> userList = new ArrayList<String>();
		Query query = session.createQuery("Select name from Registration");

		userList = query.list();

		for (String string : userList) {
			System.out.println(string);
		}
		return userList;
	}

	public List<Registration> viewTempUserDetails(String name) {
		List<Registration> userList = new ArrayList<Registration>();
		Query query = session.createQuery("From Registration where name='" + name + "'");
		userList = query.list();

		for (Registration reg : userList) {
			System.out.println(reg);
		}

		return userList;
	}

	public void generateSummaryReport() throws IOException {
		File file = new File("summary report.txt");
		FileWriter fr = new FileWriter(file);
		BufferedWriter bw = new BufferedWriter(fr);

		
		
	}

	public void finalize() {
		session.close();
	}

}
