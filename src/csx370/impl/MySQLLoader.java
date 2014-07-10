package csx370.impl;

import csx370.dao.Database;

/**
 * Loads data into a MySQL Database
 */
public class MySQLLoader {
	/**
	 * Main to populate database
	 * @param args 
	 */
	public static void main(String[] args) {
		SQLLoader loader = new SQLLoader(10);
		loader.generate();
		loader.dataToSQL(Database.MySQL);
	}
}
