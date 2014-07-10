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
public class MySQLLoadTest {
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
	 * 500k tuple load
	 */
	@Test
	public void halfMillionLoadTest() {
		loader.dataToSQL(Database.MySQL);
	}
}
