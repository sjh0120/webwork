package com.bit.util;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class MysqlTest {

	@Test
	public void testGetConnection() throws SQLException{
		Connection target=Mysql.getConnection();
		assertNotNull(target);
		assertFalse(target.isClosed());
		assertEquals(target,Mysql.getConnection());
		//싱글톤 패턴 디자인이기 때문에 getConnection()을 했을때 같은 객체여야하기 때문!
		//그렇기 때문에 검사한 것
		//if(conn==null || (conn!=null && conn.isClosed())) 주석치면 싱글톤 패턴 디자인이 아니기 때문에 에러남
		target.close();
		assertNotNull(Mysql.getConnection());
		assertFalse(Mysql.getConnection().isClosed());
		assertNotEquals(target, Mysql.getConnection());
		Mysql.getConnection().close();
	}

}
