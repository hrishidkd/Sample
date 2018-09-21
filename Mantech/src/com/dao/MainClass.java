package com.dao;

import java.io.IOException;
import java.util.Date;

import com.table.Complaints;

public class MainClass {

	public static void main(String[] args) throws IOException {

		DaoOperations obj = new DaoOperations();

		if (obj.isValid("mike", "123")) {
			System.out.println("welcome");
		} else {
			System.out.println("wrong password");
		}

		System.out.println(obj.getRole("mike"));

		Complaints o = new Complaints("mike", 101, new Date(), "1", "HR", "HARDWARE", "INCOMPLETE");

		obj.generateDetailedReport();
		obj.generateSummaryReport();

	}

}
