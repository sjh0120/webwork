package com.sjh0120.cinema;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;

public class DBcrudTest {
	Logger log=Logger.getLogger(this.getClass());
	
	@Test
	public void testGetList() throws ClassNotFoundException, SQLException {
		DBcrud movie=new DBcrud();
		ArrayList<MovieDto> list= movie.getList();
		
		for(MovieDto movies: list) log.debug(movies);
		
		assertNotNull(list);
		assertTrue(list.size()>0);
	}
	

}
