package com.patientinfo;

public class HealthcareBean {

	private String Empno;
	private String eName;
	private String title;
	private String deptno;
	
	public String getEmpno() {return Empno;}
	public String geteName() {return eName;}
	public String getTitle() {return title;}
	public String getDeptno() {return deptno;}
	
	public void setEmpno(String empno) {Empno = empno;}
	public void seteName(String eName) {this.eName = eName;}
	public void setTitle(String title) {this.title = title;}
	public void setDeptno(String deptno) {this.deptno = deptno;}
	
	
	/* Dailymeasure */
	private String SBP;
	private String DBP;
	private String glucose;
	private String Pulse_Rate;
	private String date;
	private String Patno;
	private String SpO2;
	
	public String getSpO2() {return SpO2;}
	public String getDate() {return date;}
	public String getSBP() {return SBP;}
	public String getDBP() {return DBP;}
	public String getGlucose() {return glucose;}
	public String getPulse_Rate() {return Pulse_Rate;}
	public String getPatno() {return Patno;}
	
	public void setDate(String date) {this.date = date;}
	public void setSBP(String sBP) {SBP = sBP;}
	public void setDBP(String dBP) {DBP = dBP;}
	public void setGlucose(String glucose) {this.glucose = glucose;}
	public void setPulse_Rate(String pulse_Rate) {Pulse_Rate = pulse_Rate;}
	public void setPatno(String patno) {Patno = patno;}
	public void setSpO2(String spO2) {SpO2 = spO2;}
	
	/* Patient */
	public String pName;
	public String Gender;
	public String Height;
	public String Weight;
	
	public String getpName() {return pName;}
	public String getGender() {return Gender;}
	public String getHeight() {return Height;}
	public String getWeight() {return Weight;}
	
	public void setGender(String gender) {Gender = gender;}
	public void setpName(String pName) {this.pName = pName;}
	public void setHeight(String height) {Height = height;}
	public void setWeight(String weight) {Weight = weight;}

	
}
