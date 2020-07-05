package com.patientinfo;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dbc.DatabaseConnection;

import java.sql.*;
import java.util.*;

@WebServlet("/DetectAbnormal")
public class DetectAbnormal extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	private static final String SQL =
//			"SELECT * FROM dailymeasure where date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";
			"SELECT d.*, p.Gender FROM patient p JOIN dailymeasure d ON p.Patno = d.Patno where date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";
	private static final String SQL_count =
			"SELECT * FROM statistics where date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8") ;
		response.setContentType("application/json"); 
		try (Connection conn = DatabaseConnection.getConnection()) {
			System.out.print("Here is DetectAbnormal! Is connection closed? ");
			System.out.println(conn.isClosed());
			PreparedStatement stmt = conn.prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			com.google.gson.Gson gson = new com.google.gson.Gson();
			List<HealthcareBean> adBs = new ArrayList<>();						
			HealthcareBean acB, adB= null;
			acB = new HealthcareBean();
			int glc =0;
			int SBP_DBP_C =0;
			int PRc = 0;			
			while (rs.next()) {
				adB = new HealthcareBean();
				adB.setPatno(rs.getString("Patno"));
				adB.setGender(rs.getString("Gender"));
				adB.setpName(rs.getString("pName"));				
				adB.setDate(rs.getString("date"));
				adB.setSBP(rs.getString("SBP"));
				adB.setDBP(rs.getString("DBP"));
				
				if(Integer.parseInt(rs.getString("SBP"))>=140 || Integer.parseInt(rs.getString("DBP"))>=90) {     					
					SBP_DBP_C++;}
				
				adB.setGlucose(rs.getString("glucose"));
				if(Integer.parseInt(rs.getString("glucose"))>100) {glc++;}				
				
				adB.setPulse_Rate(rs.getString("Pulse_Rate"));
				if(Integer.parseInt(rs.getString("Pulse_Rate"))>100 || Integer.parseInt(rs.getString("Pulse_Rate"))<60){PRc++;}
				
				adB.setSpO2(rs.getString("SpO2"));	
				adBs.add(adB);
			};
			
			acB.setGlc(glc);
			acB.setSBP_DBP_C(SBP_DBP_C);
			acB.setPRc(PRc);
			
			stmt = conn.prepareStatement(SQL_count);
			rs = stmt.executeQuery();
			while (rs.next()) {
				acB.setSpo2_count(rs.getString("SpO2"));
			}
			adBs.add(acB);
			String jsonObject = gson.toJson(adBs);
			PrintWriter out = response.getWriter();
	        out.print(jsonObject);
			System.out.println(jsonObject);
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
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
		 doGet(request, response);
	} // end of doPost()
} // end of class 