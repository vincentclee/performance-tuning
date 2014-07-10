package csx370.impl;

import csx370.dao.Database;

/**
 * Loads data into a PostgreSQL Database
 */
public class PostgreSQLLoader {
	/**
	 * Main to populate database
	 * @param args 
	 */
	public static void main(String[] args) {
		SQLLoader loader = new SQLLoader(10);
		loader.generate();
		loader.dataToSQL(Database.PostgreSQL);
	}
}
