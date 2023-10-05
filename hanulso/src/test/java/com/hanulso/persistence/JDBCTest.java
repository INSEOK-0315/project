package com.hanulso.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
	
	@Test
	public void testGetConnection(){
		
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","track210","1234");
			log.info(conn);
			if(conn != null) {
				System.out.println("DB Connection Ok");
			}else {
				System.out.println("DB Connection Fail");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
