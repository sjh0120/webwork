package com.bit.module01.mysql;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class BitMysqlTest {

	/*
	test case에서 성공과 실패의 case 코드는 직접 작성해야한다! 
	*/
	@Test
	public void testGetConnection() throws ClassNotFoundException,SQLException{
		Connection conn=BitMysql.getConnection();
//		assertNotNull("is null",conn);
		/*
		//코드를 통한 검사 -> 실패
		//실패 => 내가 원하는 결과를 못받을 때
		//throws를 통한 검사 -> 에러
		//에러 => 실행에서의 에러
		//직접적 try catch -> 에러 카운팅 안됨!
		*/
//		if(conn==null) {
//			fail("Not yet implemented");
//			//fail -> junit에서 제공하는 메서드
//		}
//		try {
			if(conn!=null)conn.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}

}
