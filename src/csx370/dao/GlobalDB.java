package csx370.dao;

/**
 * Data Access Object
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

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
	
	public GlobalDB() {}
	
	public void openDBconnection() {
		try {
			//Connect to database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost/srs", "root", "");
			uuid = UUID.randomUUID();
			System.out.println("<MySQL " + uuid.toString().substring(0, 8) + " Connected>");
			
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
	
	public void closeDBconnection() {
		try {
			conn.close();
			System.out.println("<MySQL " + uuid.toString().substring(0, 8) + " Disconnected>");
		} catch(Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
