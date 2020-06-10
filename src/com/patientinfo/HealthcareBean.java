package com.patientinfo;

public class HealthcareBean {
	
	/* Count abnormal */
	private Integer glc;
	private Integer SBP_DBP_C;
	private Integer PRc;	
	
	public Integer getGlc() {return glc;}
	public Integer getSBP_DBP_C() {return SBP_DBP_C;}
	public Integer getPRc() {return PRc;}
	
	public void setGlc(Integer glc) {this.glc = glc;}	
	public void setSBP_DBP_C(Integer sBP_DBP_C) {SBP_DBP_C = sBP_DBP_C;}	
	public void setPRc(Integer pRc) {PRc = pRc;}
	
	/* Daily measure */
	private String SBP;
	private String DBP;
	private String glucose;
	private String Pulse_Rate;
	private String date;	
	private String SpO2;
	private String Risk;
	private String Type;
	
	public String getSpO2() {return SpO2;}
	public String getDate() {return date;}
	public String getSBP() {return SBP;}
	public String getDBP() {return DBP;}
	public String getGlucose() {return glucose;}
	public String getPulse_Rate() {return Pulse_Rate;}
	public String getRisk() {return Risk;}	
	public String getType() {return Type;}
	
	
	public void setDate(String date) {this.date = date;}
	public void setSBP(String sBP) {SBP = sBP;}
	public void setDBP(String dBP) {DBP = dBP;}
	public void setGlucose(String glucose) {this.glucose = glucose;}
	public void setPulse_Rate(String pulse_Rate) {Pulse_Rate = pulse_Rate;}
	public void setSpO2(String spO2) {SpO2 = spO2;}
	public void setRisk(String risk) {Risk = risk;}
	public void setType(String type) {Type = type;}
	
	/* Patient */
	private String Patno;
	private String pName;
	private String Gender;
	private String Height;
	private String Weight;
	private String birthday;
	private String m_phone;
	private String e_contact_person;
	private String e_contact_no;
	private String e_contact_relation;
	private String flag;
	
	public String getPatno() {return Patno;}
	public String getpName() {return pName;}
	public String getGender() {return Gender;}
	public String getHeight() {return Height;}
	public String getWeight() {return Weight;}
	public String getBirthday() { return birthday;	}
	public String getM_phone() { return m_phone; }
	public String getE_contact_person() { return e_contact_person; }
	public String getE_contact_no() { return e_contact_no; }
	public String getE_contact_relation() { return e_contact_relation; }
	public String getFlag() { return flag; }
	
	
	public void setPatno(String patno) {Patno = patno;}
	public void setGender(String gender) {Gender = gender;}
	public void setpName(String pName) {this.pName = pName;}
	public void setHeight(String height) {Height = height;}
	public void setWeight(String weight) {Weight = weight;}
	public void setBirthday(String birthday) { this.birthday = birthday; }	
	public void setM_phone(String m_phone) { this.m_phone = m_phone; }	
	public void setE_contact_person(String e_contact_person) { this.e_contact_person = e_contact_person; }	
	public void setE_contact_no(String e_contact_no) { this.e_contact_no = e_contact_no; }	
	public void setE_contact_relation(String e_contact_relation) { this.e_contact_relation = e_contact_relation; }	
	public void setFlag(String flag) { this.flag = flag; }	

	/* ml */
	public String result;

	public String getResult() {return result;}
	
	public void setResult(String result) {this.result = result;}
	
}
