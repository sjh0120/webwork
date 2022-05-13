package com.sjh0120.cinema;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

public class DBServerTest{

	@Test
	public void testGetConnection() throws SQLException {
		assertNotNull(DBServer.getConnection());
	}

}
