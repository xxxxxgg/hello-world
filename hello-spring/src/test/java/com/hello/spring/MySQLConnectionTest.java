package com.hello.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	// MySQL Driver 6.0 less then "com.mysql.jdbc.Driver";

	private static final String url = "jdbc:mysql://localhost:3306/ppl_db?useSSL=false&serverTimezone=Asia/Seoul";
	// MySQL Driver 6.1 less then
	// "jdbc:mysql://localhost:3306/ppl_db?useSSL=false";

	private static final String user = "ppluser";

	private static final String pw = "ppluser";

	@Test
	public void testConnection() throws Exception {
		Class.forName(driver);

		try (Connection con = DriverManager.getConnection(url, user, pw)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
