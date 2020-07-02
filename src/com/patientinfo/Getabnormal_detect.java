package com.patientinfo;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dbc.DatabaseConnection;

import java.sql.*;
import java.util.*;

@WebServlet("/Getabnormal_detect")
public class Getabnormal_detect extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	private static final String SQL =
			"SELECT * FROM dailymeasure where date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		 try (Connection conn = DatabaseConnection.getConnection()) {
			System.out.print("Is connection closed? ");
			System.out.println(conn.isClosed());
			HttpSession session =  request.getSession() ;	
			PreparedStatement stmt = conn.prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			List<HealthcareBean> adBs = new ArrayList<>();						
			HealthcareBean acB, adB= null;
			acB = new HealthcareBean();
			int glc =0;
			int SBP_DBP_C =0;
			int PRc = 0;			
			while (rs.next()) {
				adB = new HealthcareBean();
				adB.setPatno(rs.getString("Patno"));       
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
			}
			
			acB.setGlc(glc);
			acB.setSBP_DBP_C(SBP_DBP_C);
			acB.setPRc(PRc);
			System.out.println("Foward to Getabnormal");
			System.out.println(request.getAttribute("LogOk"));
			request.setAttribute("adBs", adBs);
			request.setAttribute("acB", acB);
//			request.getRequestDispatcher("./HomePage.jsp").include(request, response);
			if(session.getAttribute("LogOk").equals("yes")) {
				request.getRequestDispatcher("./HomePage.jsp").include(request, response);
			}else {
				request.getRequestDispatcher("./HomePage.jsp").forward(request, response);
			}

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