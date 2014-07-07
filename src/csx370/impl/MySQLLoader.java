package csx370.impl;

import csx370.dao.GlobalDB;

public class MySQLLoader {
	private static final int NUM_TUPLES = 10;
	private GlobalDB global;
	
	public MySQLLoader() {
		global = new GlobalDB();
	}
	
	@SuppressWarnings("rawtypes")
	public void dataToSQL() {
		try {
			//Open DB connection
			global.openDBconnection();
			
			// Generate Data for those tuples
			TupleGenerator test = new TupleGeneratorImpl();
			
			// Schemas
			test.addRelSchema("Student",
					"id name address status",
					"Integer String String String",
					"id",
					null);
			test.addRelSchema("Professor",
					"id name deptId",
					"Integer String String",
					"id",
					null);
			test.addRelSchema("Course",
					"crsCode deptId crsName descr",
					"String String String String",
					"crsCode",
					null);
			test.addRelSchema("Teaching",
					"crsCode semester profId",
					"String String Integer",
					"crsCode semester",
					new String[][]{{"profId", "Professor", "id"},
					{"crsCode", "Course", "crsCode"}});
			test.addRelSchema("Transcript",
					"studId crsCode semester grade",
					"Integer String String String",
					"studId crsCode semester",
					new String [][] {{"studId", "Student", "id"},
					{"crsCode", "Course", "crsCode"},
					{"crsCode semester", "Teaching", "crsCode semester"}});
			
			// Tuple sizes
			int[] tups = new int[] {NUM_TUPLES, NUM_TUPLES, NUM_TUPLES, NUM_TUPLES, NUM_TUPLES};
			
			// Generate random data
			Comparable[][][] resultTest = test.generate(tups);
			
			// Student Tables
			for (int i = 0; i < resultTest[0].length; i++) {
				global.insert_student.setInt(1, (int) resultTest[0][i][0]);
				global.insert_student.setString(2, resultTest[0][i][1].toString());
				global.insert_student.setString(3, resultTest[0][i][2].toString());
				global.insert_student.setString(4, resultTest[0][i][3].toString());
				global.insert_student.execute();
			}
			
			// Professor Tables
			for (int i = 0; i < resultTest[1].length; i++) {
				global.insert_professor.setInt(1, (int) resultTest[1][i][0]);
				global.insert_professor.setString(2, resultTest[1][i][1].toString());
				global.insert_professor.setString(3, resultTest[1][i][2].toString());
				global.insert_professor.execute();
			}
			
			// Course Tables
			for (int i = 0; i < resultTest[2].length; i++) {
				global.insert_course.setString(1, resultTest[2][i][0].toString());
				global.insert_course.setString(2, resultTest[2][i][1].toString());
				global.insert_course.setString(3, resultTest[2][i][2].toString());
				global.insert_course.setString(4, resultTest[2][i][3].toString());
				global.insert_course.execute();
			}
			
			// Teaching Tables
			for (int i = 0; i < resultTest[3].length; i++) {
				global.insert_teaching.setString(1, resultTest[3][i][0].toString());
				global.insert_teaching.setString(2, resultTest[3][i][1].toString());
				global.insert_teaching.setInt(3, (int) resultTest[3][i][2]);
				global.insert_teaching.execute();
			}
			
			// Transcript Tables
			for (int i = 0; i < resultTest[4].length; i++) {
				global.insert_transcript.setInt(1, (int) resultTest[4][i][0]);
				global.insert_transcript.setString(2, resultTest[4][i][1].toString());
				global.insert_transcript.setString(3, resultTest[4][i][2].toString());
				global.insert_transcript.setString(4, resultTest[4][i][3].toString());
				global.insert_transcript.execute();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			global.closeDBconnection();
		}
	}
	
	public static void main(String[] args) {
		MySQLLoader loader = new MySQLLoader();
		loader.dataToSQL();
	}
}
