package com.patientinfo;

public class abnormal_detectBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String Patno;
	private String pName;
	private String date;
	private String SBP;
	private String DBP;
	private String glucose;
	private String Pulse_Rate;
	
	
	
	
	public String getPatno() {
		return Patno;
	}
	public void setPatno(String patno) {
		Patno = patno;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSBP() {
		return SBP;
	}
	public void setSBP(String sBP) {
		SBP = sBP;
	}
	public String getDBP() {
		return DBP;
	}
	public void setDBP(String dBP) {
		DBP = dBP;
	}
	public String getGlucose() {
		return glucose;
	}
	public void setGlucose(String glucose) {
		this.glucose = glucose;
	}
	public String getPulse_Rate() {
		return Pulse_Rate;
	}
	public void setPulse_Rate(String pulse_Rate) {
		Pulse_Rate = pulse_Rate;
	}
	
	
	
	
}