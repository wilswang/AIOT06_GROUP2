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
		        System.out.println(conn.isClosed());
			PreparedStatement stmt = conn.prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			List<membersBean> adBs = new ArrayList<>();
			membersBean adB = null;
			
			abnormal_counterBean acB= null;    //�p��T���ƾڭȤ����`Bean
			acB = new abnormal_counterBean();
			int glc =0;
			int SBP_DBP_C =0;
			int PRc = 0;
			
			while (rs.next()) {
				adB = new membersBean();
				adB.setPatno(rs.getString("Patno"));       
				adB.setpName(rs.getString("pName"));
				
				adB.setDate(rs.getString("date"));
				adB.setSBP(rs.getString("SBP"));
				adB.setDBP(rs.getString("DBP"));
				
				if(Integer.parseInt(rs.getString("SBP"))>=140 || Integer.parseInt(rs.getString("DBP"))>=90) {     					
//					System.out.println("SBP_DBP_C");		
					SBP_DBP_C++;}      //�p�⤣���`����   (SBP�j��140,DBP�j��90),�i�H�A�Ӥ����C���϶�
				
				adB.setGlucose(rs.getString("glucose"));
				if(Integer.parseInt(rs.getString("glucose"))>100) {    
//					System.out.println("glc");		
					glc++;}  //�p���}�����`(�Ÿ�����j��100)
				
				
				adB.setPulse_Rate(rs.getString("Pulse_Rate"));
				if(Integer.parseInt(rs.getString("Pulse_Rate"))>100 || Integer.parseInt(rs.getString("Pulse_Rate"))<60){     //�p��s�������`(�Ÿ�����j��100)
//					System.out.println("PRc");		
					PRc++;}  //�p��߫ߤ����`(����j��100�ΧC��60)
				
				adB.setSpO2(rs.getString("SpO2"));
	
				adBs.add(adB);
//				System.out.println("adBs out");
			}
			
			acB.setGlc(glc);
			acB.setSBP_DBP_C(SBP_DBP_C);
			acB.setPRc(PRc);
			
			request.setAttribute("adBs", adBs);
			request.setAttribute("acB", acB);
			stmt.close();
//			System.out.println(glc);
			
			request.getRequestDispatcher("./index_homepage.jsp")
				.forward(request, response);
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