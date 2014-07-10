package csx370.test;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import csx370.dao.Database;
import csx370.impl.SQLLoader;

/**
 * Load Data in to MySQL
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MySQL_and_PostgreSQLLoadTest {
	private SQLLoader loader;
	
	/**
	 * 500k random tuple generation
	 */
	@Test
	public void generateTest() {
		loader = new SQLLoader(500000);
		loader.generate();
	}
	
	/**
	 * 500k MySQL tuple load
	 */
	@Test
	public void halfMillionMySQLLoadTest() {
		loader.dataToSQL(Database.MySQL);
	}
	
	/**
	 * 500k PostgreSQL tuple load
	 */
	@Test
	public void halfMillionPostgreSQLLoadTest() {
		loader.dataToSQL(Database.PostgreSQL);
	}
}
