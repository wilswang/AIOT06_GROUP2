package com.patientinfo;

public class abnormal_counterBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer glc;
	private Integer SBP_DBP_C;
	private Integer PRc;
	
	
	
	
	public Integer getGlc() {
		return glc;
	}
	public void setGlc(Integer glc) {
		this.glc = glc;
	}
	public Integer getSBP_DBP_C() {
		return SBP_DBP_C;
	}
	public void setSBP_DBP_C(Integer sBP_DBP_C) {
		SBP_DBP_C = sBP_DBP_C;
	}
	public Integer getPRc() {
		return PRc;
	}
	public void setPRc(Integer pRc) {
		PRc = pRc;
	}
	
	
	
}