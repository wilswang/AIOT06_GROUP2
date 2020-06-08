package com.utility;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dbc.DatabaseConnection;


@WebServlet("/bpminsert")
public class bpminsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SQL =
			"select date from dailymeasure WHERE date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";

	private static final String SQL1 =
			"UPDATE dailymeasure SET Pulse_Rate=? WHERE Patno=? AND date=?";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		 
		String Patno = request.getParameter("Patno") ;
		System.out.println("Patno: "+Patno);
//		String Patno = "20" ;
//		String pName = request.getParameter("pName") ;		
//		String Gender = request.getParameter("Gender") ;
//		String date = request.getParameter("date") ;
//		String SBP = request.getParameter("SBP") ;
//		String DBP = request.getParameter("DBP") ;
//		String glucose = request.getParameter("glucose") ;
		String Pulse_Rate = request.getParameter("Pulse_Rate") ;
		System.out.println("Pulse_Rate: "+Pulse_Rate);
//		String Pulse_Rate = "100" ;
//		String SpO2 = request.getParameter("SpO2") ;
		
		try (Connection conn = DatabaseConnection.getConnection()) {
	    System.out.println(conn.isClosed());
	    PreparedStatement stmt = conn.prepareStatement(SQL);
		ResultSet rs = stmt.executeQuery();
	    
	    if(rs.next()) {
	    	String date = rs.getString("date");
	        System.out.println(date);
		
		
		stmt = conn.prepareStatement(SQL1);
		stmt.setString(1, Pulse_Rate);
		stmt.setString(2, Patno);
		stmt.setString(3, date);
//		stmt.setString(2, pName);
//		stmt.setString(3, Gender);
//		stmt.setString(4, date);
//		stmt.setString(5, SBP);
//		stmt.setString(6, DBP);
//		stmt.setString(7, glucose);
		
//		stmt.setString(9, SpO2);	
	   
		int rows = stmt.executeUpdate();
		System.out.println(rows);
		System.out.println("luky");
	    
		if(rows!=0) {
			out.append("Success");		
				
		}else {
			
			out.append("Fail");
		}
	    }
	    
	    }catch (NullPointerException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					out.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
