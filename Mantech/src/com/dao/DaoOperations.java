package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.table.Login;

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

	public void finalize() {
		session.close();
	}

}
