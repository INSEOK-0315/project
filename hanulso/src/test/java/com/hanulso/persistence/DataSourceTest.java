package com.hanulso.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {

	@Setter(onMethod_=@Autowired)
	private DataSource dataSource;
	//DB 연결정보를 저장하고, Connection을 생성하고, Connection Pool에 등록하고
	//관리하는 역할을 하는 것이 DataSource
	
	@Setter(onMethod_=@Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testDBCP() {
		
		try {
			Connection conn = dataSource.getConnection();
			log.info("DBCP Test>> "+conn);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testMyBatis() {
		
		SqlSession session = sqlSessionFactory.openSession();
		Connection conn = session.getConnection();
		
		try{
			log.info("session : "+session);
			log.info("conn : "+conn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
