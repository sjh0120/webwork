package com.bit.module01.mysql;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import org.apache.log4j.Logger;
import org.junit.Test;

public class BitEmpTest {
	Logger log=Logger.getLogger(this.getClass());
	
	@Test
	public void test() throws ClassNotFoundException, SQLException{
		BitEmp emp=new BitEmp();
		ArrayList<EmpBean> list=(ArrayList<EmpBean>)emp.getList();
		//옛날버전 루프문
//		for(int i=0; i<list.size(); i++) {
//			log.debug(list.get(i));
//		}
		
		for(EmpBean bean: list) log.debug(bean);
		
//		// 개선된 루프문 1.7~, 제네릭 필수, js의 for(ele of arr) 와 비슷
//		for(EmpBean bean: list) log.debug(bean);
//		// 예시
//		String[] msgs= {"item1", "item2", "item3", "item4", "item5"};
//		for(String msg: msgs) log.debug(msg);
//		// 예시2 HashSet사용 -> 순서 뒤죽박죽
//		HashSet<EmpBean> set=new HashSet<>(list);
//		for(EmpBean bean: set) log.debug(bean);
		
		assertNotNull(list);
		assertTrue(list.size()>0);
		
	}

}
