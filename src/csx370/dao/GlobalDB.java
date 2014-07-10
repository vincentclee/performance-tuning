package csx370.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

/**
 * Data Access Object
 */
public class GlobalDB {
	//Student
	public PreparedStatement insert_student;
	
	//Professor
	public PreparedStatement insert_professor;
	
	//Course
	public PreparedStatement insert_course;
	
	//Teaching
	public PreparedStatement insert_teaching;
	
	//Transcript
	public PreparedStatement insert_transcript;
	
	private Connection conn;
	private UUID uuid;
	private Database db;
	
	/**
	 * Database Constructor
	 * @param db the database to use (MySQL, PostgreSQL)
	 */
	public GlobalDB(Database db) {
		this.db = db;
	}
	
	/**
	 * Open the Database Connection
	 */
	public void openDBconnection() {
		try {
			//Connect to database
			switch (db) {
				case MySQL:
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection("jdbc:mysql://localhost/srs", "root", "platypus1");
					break;
				case PostgreSQL:
					Class.forName("org.postgresql.Driver").newInstance();
					conn = DriverManager.getConnection("jdbc:postgresql://localhost/srs", "postgres", "");
					break;
			}
			
			uuid = UUID.randomUUID();
			System.out.println("<" + db + " " + uuid.toString().substring(0, 8) + " Connected>");
			
			//Prepared statements used to query database
			
			//Student
			insert_student = conn.prepareStatement("INSERT INTO Student(id,name,address,status) VALUES(?,?,?,?)");
			
			//Professor
			insert_professor = conn.prepareStatement("INSERT INTO Professor(id,name,deptId) VALUES(?,?,?)");
			
			//Course
			insert_course = conn.prepareStatement("INSERT INTO Course(crsCode,deptId,crsName,descr) VALUES(?,?,?,?)");
			
			//Teaching
			insert_teaching = conn.prepareStatement("INSERT INTO Teaching(crsCode,semester,profId) VALUES(?,?,?)");
			
			//Transcript
			insert_transcript = conn.prepareStatement("INSERT INTO Transcript(studId,crsCode,semester,grade) VALUES(?,?,?,?)");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * Close the Database Connection
	 */
	public void closeDBconnection() {
		try {
			conn.close();
			System.out.println("<" + db + " " + uuid.toString().substring(0, 8) + " Disconnected>");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
