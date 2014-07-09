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
		SQLLoader loader = new SQLLoader(Database.MySQL, 100);
		loader.dataToSQL();
	}
}
