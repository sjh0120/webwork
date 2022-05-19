package com.bit.emp.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bit.util.Mysql;

public class EmpDao {
//crud
	private boolean test;
	
	public void setTest(boolean test) {
		this.test=test;
	}
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<EmpDto> getList() throws SQLException {
		List<EmpDto> list=new ArrayList<>();
		String sql="select * from emp order by empno desc";
		try {
			pstmt=Mysql.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				EmpDto dto=new EmpDto();
				dto.setEmpno(rs.getInt("empno"));
				dto.setEname(rs.getString("ename"));
				dto.setSal(rs.getInt("sal"));
				dto.setJob(rs.getString("job"));
				dto.setDeptno(rs.getInt("deptno"));
				dto.setHiredate(rs.getDate("hiredate"));
				
				list.add(dto);
			}
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(Mysql.getConnection()!=null)Mysql.getConnection().close();
		}
		
		return list;
	}
	public EmpDto getOne(int num) throws SQLException {
		EmpDto bean=null;
		String sql="select * from emp where empno=?";
		try {
			pstmt=Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean=new EmpDto();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setSal(rs.getInt("sal"));
				bean.setJob(rs.getString("job"));
				bean.setDeptno(rs.getInt("deptno"));
				bean.setHiredate(rs.getDate("hiredate"));
			}
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(Mysql.getConnection()!=null)Mysql.getConnection().close();
		}
		
		return bean;
	}
	public boolean insertOne(EmpDto bean) throws SQLException {
		String sql="insert into emp (empno,ename,sal, hiredate) values (?,?,?,now())";
		try {
			//0519노션보기!
			//Mysql.getConnection().setAutoCommit(false);
			pstmt=Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bean.getEmpno());
			pstmt.setString(2, bean.getEname());
			pstmt.setInt(3, bean.getSal());
			return pstmt.executeUpdate()>0;
		}finally{
//			if(test)Mysql.getConnection().rollback();
			//else Mysql.getConnection().commit();
			//ㄴ> test가 false 이면 db에 갑 입력
			
			// else Mysql.getConnection().commit(); 가 없으면 mysql은 commit이 안되지만
			// 다른 db에서는 test가 false이면 autocommit이 false 이더라도 commit이 된다!
			// db마다 다르니까 잘 생각하기
			
			// mysql에서는 autoCommit false 하고나서 commit을 명시적으로 해주지 않는다면
			// commit안됨!
			if(pstmt!=null)pstmt.close();
			if(Mysql.getConnection()!=null)Mysql.getConnection().close();
		}
	}
	public int updateOne(EmpDto bean) throws SQLException {
		String sql="update emp set ename=?,sal=?,hiredate=now() where empno=?";
		try {
			pstmt=Mysql.getConnection().prepareStatement(sql);
			pstmt.setString(1, bean.getEname());
			pstmt.setInt(2, bean.getSal());
			pstmt.setInt(3, bean.getEmpno());
			return pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
	}
	public int deleteOne(int num) throws SQLException {
		String sql="delete from emp where empno=?";
		try {
			pstmt=Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
	}
	
}
