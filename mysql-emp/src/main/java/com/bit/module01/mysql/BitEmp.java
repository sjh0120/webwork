package com.bit.module01.mysql;

import java.sql.*;
import java.util.ArrayList;
import org.apache.log4j.Logger;


public class BitEmp {
	Logger log=Logger.getLogger(this.getClass());

	public ArrayList<?> getList() throws ClassNotFoundException,SQLException{
		ArrayList<EmpBean> list=new ArrayList<>();
		String sql="select empno,ename,sal from emp order by empno desc";
		
		// auto close();...?
		// 1.8~
		try (
				/*
				close()할 대상이 try 괄호 안에 들어가야만 하며!
				close()할 대상은 꼭 안에서 선언되어야한다.
				즉 try(){}앞에서 선언이 되고 try괄호 안에서
				conn=~~한다면 에러발생!
				
				또한 try()안에는 선언,초기화 만 들어가야 한다!
				실행문은 {}안에 들어가야 한다!
				
				+ auto close()의 대상이 아닌 것은 ()안에 들어가선 안된다!
				ex) int i=0; => ()에 들어가면 안된다!
				*/
				Connection conn=BitMysql.getConnection();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				){
			while(rs.next()){
				EmpBean bean=new EmpBean();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getNString("ename"));
				bean.setSal(rs.getInt("sal"));
				list.add(bean);
				log.debug(bean.toString());
			}
		}
		
		return list;
	}
}
