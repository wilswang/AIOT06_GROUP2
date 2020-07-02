package com.patientinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dbc.DatabaseConnection;
import com.patientinfo.HealthcareBean;


@WebServlet("/PatientsDetails")
public class PatientsDetails extends HttpServlet {
private static final long serialVersionUID = 1L;

	private static final String SQLml =
			"SELECT result FROM ml WHERE Patno = ?";

	private static final String SQLDM =
			"SELECT * FROM dailymeasure WHERE Patno = ? ORDER BY date ASC";
	
	private static final String SQLDMLatest =
			"SELECT * FROM dailymeasure WHERE Patno = ? LIMIT 1";
	
	private static final String SQLCrts =
			"SELECT * FROM dailymeasure WHERE Patno = ? ORDER BY date ASC LIMIT 14";
	
	private static final String SQLPatient =
			"SELECT * FROM patient WHERE Patno = ?";
	
	private static final String SQLhe =
			"SELECT * FROM health_examination_record2 WHERE Patno = ? LIMIT 1";
	
	Connection conn;
	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		

		 try (Connection conn = DatabaseConnection.getConnection()) {
		    
			String Patno = request.getParameter("patno");
			
			// execute the SQLDM
			PreparedStatement stmt = conn.prepareStatement(SQLDM);
			stmt.setString(1, Patno);
			ResultSet rs = stmt.executeQuery();
			List<HealthcareBean> DMs = new ArrayList<>();
			HealthcareBean DM = null;
			while (rs.next()) {
				DM = new HealthcareBean();
				DM.setPatno(rs.getString("patno"));
				DM.setDate(rs.getString("date"));
				DM.setSBP(rs.getString("sBP"));
				DM.setDBP(rs.getString("dBP"));
				DM.setGlucose(rs.getString("glucose"));
				DM.setPulse_Rate(rs.getString("pulse_Rate"));
				DM.setSpO2(rs.getString("spO2"));
				DMs.add(DM);
			};
			
			// execute the SQLDMLatest
			stmt = conn.prepareStatement(SQLDMLatest);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean DMLatest = null;
			List<HealthcareBean> DMLatest_ = new ArrayList<>();
			while (rs.next()) {
				DMLatest = new HealthcareBean();
				DMLatest.setSBP(rs.getString("sBP"));
				DMLatest.setDBP(rs.getString("dBP"));
				DMLatest.setGlucose(rs.getString("glucose"));
				DMLatest.setPulse_Rate(rs.getString("pulse_Rate"));
				DMLatest.setSpO2(rs.getString("spO2"));
				DMLatest_.add(DMLatest);
			}
			
			// execute the SQLCrts
			stmt = conn.prepareStatement(SQLCrts);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			
			List<HealthcareBean> DMCrts = new ArrayList<>();
			HealthcareBean DMCrt = null;
			while (rs.next()) {
				DMCrt = new HealthcareBean();
				DMCrt.setDate(rs.getString("date").substring(0, 11));
				DMCrt.setSBP(rs.getString("sBP"));
				DMCrt.setDBP(rs.getString("dBP"));
				DMCrt.setGlucose(rs.getString("glucose"));
				DMCrt.setPulse_Rate(rs.getString("pulse_Rate"));
				DMCrt.setSpO2(rs.getString("spO2"));
				DMCrts.add(DMCrt);
			};
			
			// execute the SQLPatient
			stmt = conn.prepareStatement(SQLPatient);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean pat = null;
			List<HealthcareBean> pat_= new ArrayList<>();
			while (rs.next()) {
				pat = new HealthcareBean();
				pat.setpName(rs.getString("pName"));
				pat.setGender(rs.getString("gender"));
				pat.setHeight(rs.getString("height"));
				pat.setWeight(rs.getString("weight"));
				pat_.add(pat);
			}
			
			/*call python to run machine learning*/
			String[] cmd = {
					"python",
					"C:/Users/user/FinalProject/Predict.py",
					Patno,
					};
			try {
				 Process pr = Runtime.getRuntime().exec(cmd);
				 pr.waitFor();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// execute the SQLml
			stmt = conn.prepareStatement(SQLml);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean ml = null;
			List<HealthcareBean> ml_= new ArrayList<>();
			while (rs.next()) {
				ml = new HealthcareBean();
				ml.setResult(rs.getString("result"));
				ml_.add(ml);
			};
			
			// execute the SQLhe
			stmt = conn.prepareStatement(SQLhe);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean HealthExam = null;
			List<HealthcareBean> HealthExam_= new ArrayList<>();
			while (rs.next()) {
				HealthExam = new HealthcareBean();
				HealthExam.setPatno(rs.getString("Patno"));
				HealthExam.setWeight(rs.getString("Weight"));
				HealthExam.setHeight(rs.getString("height"));
				HealthExam.setWasistline(rs.getString("wasistline"));
				HealthExam.setNaked_eye_R(rs.getString("Naked_eye_R"));
				HealthExam.setNaked_eye_L(rs.getString("Naked_eye_L"));
				HealthExam.setCorrected_R(rs.getString("Corrected_R"));
				HealthExam.setCorrected_L(rs.getString("Corrected_L"));
				HealthExam.setColor_Blindness(rs.getString("Color_Blindness"));
				HealthExam.setHearing_Test(rs.getString("Hearing_Test_"));
				HealthExam.setSBP(rs.getString("SBP"));
				HealthExam.setDBP(rs.getString("DBP"));
				HealthExam.setPRO(rs.getString("PRO"));
				HealthExam.setOB(rs.getString("OB"));
				HealthExam.setWBC(rs.getString("WBC"));
				HealthExam.setHb(rs.getString("Hb"));
				HealthExam.setGPT(rs.getString("GPT"));
				HealthExam.setCrea(rs.getString("Crea"));
				HealthExam.setT_CHO(rs.getString("T_CHO"));
				HealthExam.setTG(rs.getString("TG"));
				HealthExam.setHDL(rs.getString("HDL"));
				HealthExam.setLDL(rs.getString("LDL"));
				HealthExam.setAC(rs.getString("AC"));
				HealthExam_.add(HealthExam);
			}
			// put all above result into map, and transfer date type to json
			com.google.gson.Gson gson = new com.google.gson.Gson();
			Map<String,List> data = new HashMap<>();
			data.put("ml",ml_);
			data.put("DMs",DMs);
			data.put("DMCrts",DMCrts);
			data.put("DMLatest",DMLatest_);
			data.put("Pat",pat_);
			data.put("HealthExam",HealthExam_);
			String jsonObject = gson.toJson(data);
			System.out.println(jsonObject);
			PrintWriter out = response.getWriter();
	        out.print(jsonObject);
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // end of doGet()
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
