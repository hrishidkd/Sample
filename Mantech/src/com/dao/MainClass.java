package com.dao;

public class MainClass {

	public static void main(String[] args) {

		DaoOperations obj = new DaoOperations();

		if (obj.isValid("mike", "123")) {
			System.out.println("welcome");
		} else {
			System.out.println("wrong password");
		}

	}

}
