package com.bit.emp.model;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.bit.util.Mysql;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmpDaoTest {
	Logger log=Logger.getLogger(EmpDaoTest.class);
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//	}
//
//	@AfterClass
//	public static void tearDownAfterClass() throws Exception {
//	}
//
//	@Before
//	public void setUp() throws Exception {
//	}
//
//	@After
//	public void tearDown() throws Exception {
//	}
	static EmpDto target;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		target=new EmpDto();
		target.setEmpno(51);
		target.setEname("test51");
		target.setSal(51);
	}
	
	@Test
	public void test1GetList() throws SQLException {
		EmpDao dao=new EmpDao();
		assertNotNull(dao.getList());
		assertTrue(dao.getList().size()>0);
		for(EmpDto bean: dao.getList()) log.debug(bean);
	}
	
	@Test
	public void test4GetOne() throws SQLException{
		EmpDao dao=new EmpDao();
		assertNotNull(dao.getOne(target.getEmpno()));
		assertEquals(target.getEname(), dao.getOne(target.getEmpno()).getEname());
		assertTrue(target.getSal()==dao.getOne(target.getEmpno()).getSal());
	}
	
	@Test
	public void test2InsertOne() throws SQLException {
		//0519노션보기!
		EmpDao dao=new EmpDao();
//		dao.setTest(true);
		assertTrue(dao.insertOne(target));
		//dao.setTest(true);가 true이면 테스트로 판단 실제로 데이터 입력
		//dao.setTest(false); -> 테스트 x 실제로 데이터 삽입
	}
	
	@Test
	public void test3UpdateOne() throws SQLException {
		target.setEname("test55");
		target.setSal(5);
		EmpDao dao=new EmpDao();
		assertTrue(dao.updateOne(target)>0);
	}
	
	@Test
	public void test5DeleteOne() throws SQLException {
		
		EmpDao dao=new EmpDao();
		assertTrue(dao.deleteOne(target.getEmpno())>0);
	}

}
