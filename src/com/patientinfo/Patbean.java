package com.patientinfo;

public class Patbean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private String patno;
	private String pName;
	private String birthday;
	private String gender;
	private String m_phone;
	private String e_contact_person;
	private String e_contact_no;
	private String e_contact_relation;
	private String flag;
	
	public String getPatno() { return patno; }
	public String getpName() {	return pName; }
	public String getBirthday() { return birthday;	}
	public String getGender() { return gender; }
	public String getM_phone() { return m_phone; }
	public String getE_contact_person() { return e_contact_person; }
	public String getE_contact_no() { return e_contact_no; }
	public String getE_contact_relation() { return e_contact_relation; }
	public String getFlag() { return flag; }
	
	public void setPatno(String patno) { this.patno = patno; }	
	public void setpName(String pName) { this.pName = pName; }	
	public void setBirthday(String birthday) { this.birthday = birthday; }	
	public void setGender(String gender) { this.gender = gender; }	
	public void setM_phone(String m_phone) { this.m_phone = m_phone; }	
	public void setE_contact_person(String e_contact_person) { this.e_contact_person = e_contact_person; }	
	public void setE_contact_no(String e_contact_no) { this.e_contact_no = e_contact_no; }	
	public void setE_contact_relation(String e_contact_relation) { this.e_contact_relation = e_contact_relation; }	
	public void setFlag(String flag) { this.flag = flag; }	
}
