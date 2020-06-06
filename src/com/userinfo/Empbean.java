package com.userinfo;

public class Empbean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String empno;
	private String ename;	
	private String deptno;
	private String title;
//	private String psw;

	public String getEmpno() {  return empno;  }
	public String getEname() {  return ename;  }	
	public String getDeptno() {  return deptno;  }
	public String getTitle() {  return title;  }
//	public String getPsw() {  return psw;	}
	
	public void setEmpno(String empno) {  this.empno = empno;  }
	public void setEname(String ename) {  this.ename = ename;  }	
	public void setDeptno(String deptno) {  this.deptno= deptno;	}
	public void setTitle(String title) {  this.title= title;	}	
//	public void setPsw(String psw) {  this.psw = psw;	}
	}
