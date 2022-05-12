package com.bit.module01.mysql;

public class EmpBean {
	// javaBean class (DTO, VO, Entry)
	public int empno;
	public String ename;
	public int sal;
	
	// getter & setter
	// get필드(첫 글자를 대문자로
	// set필드(..
	// is필드(..
	public void setEmpno(int empno) {
		this.empno=empno;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEname(String ename) {
		this.ename=ename;
	}
	public String getEname() {
		return ename;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getSal() {
		return sal;
	}
	
	@Override
	public String toString() {
		return "empno:"+empno+",ename:"+ename+",sal:"+sal;
	}
}
