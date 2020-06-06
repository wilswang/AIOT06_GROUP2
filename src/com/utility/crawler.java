package com.utility;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dbc.DatabaseConnection;


@WebServlet("/crawler")
public class crawler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SQL =
			"INSERT INTO dailymeasure (Patno, pName, Gender, date, SBP, DBP, glucose, Pulse_Rate, SpO2)  VALUES (?,?,?,?,?,?,?,?,?)";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		 
		String Patno = request.getParameter("Patno") ;
		String pName = request.getParameter("pName") ;		
		String Gender = request.getParameter("Gender") ;
		String date = request.getParameter("date") ;
		String SBP = request.getParameter("SBP") ;
		String DBP = request.getParameter("DBP") ;
		String glucose = request.getParameter("glucose") ;
		String Pulse_Rate = request.getParameter("Pulse_Rate") ;
		String SpO2 = request.getParameter("SpO2") ;
		
		try (Connection conn = DatabaseConnection.getConnection()) {
	    System.out.println(conn.isClosed());
		PreparedStatement stmt = conn.prepareStatement(SQL);
		stmt.setString(1, Patno);
		stmt.setString(2, pName);
		stmt.setString(3, Gender);
		stmt.setString(4, date);
		stmt.setString(5, SBP);
		stmt.setString(6, DBP);
		stmt.setString(7, glucose);
		stmt.setString(8, Pulse_Rate);	
		stmt.setString(9, SpO2);	
		int rows = stmt.executeUpdate();	
		if(rows!=0) {
			out.append("Success");		
				
		}else {
			
			out.append("Fail");
		}}catch (NullPointerException e) {
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
