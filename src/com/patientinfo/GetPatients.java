package com.patientinfo;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dbc.DatabaseConnection;
import java.sql.*;
import java.util.*;

@WebServlet("/GetPatients")
public class GetPatients extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SQL =
			"SELECT * FROM dailymeasure where date=(SELECT date FROM dailymeasure ORDER BY date DESC LIMIT 1)";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8") ; 
		try (Connection conn = DatabaseConnection.getConnection()) {
		    System.out.println("Here is GetPatients");		        
			PreparedStatement stmt = conn.prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			List<HealthcareBean> pms =new ArrayList<>();
			HealthcareBean pm = null;
			com.google.gson.Gson gson = new com.google.gson.Gson();
			while (rs.next()) {
				pm = new HealthcareBean();
				pm.setPatno(rs.getString("Patno"));       
				pm.setpName(rs.getString("pName"));
//				pm.setGender(rs.getString("Gender"));
				pm.setDate(rs.getString("date"));
				pm.setSBP(rs.getString("SBP"));
				pm.setDBP(rs.getString("DBP"));
				pm.setGlucose(rs.getString("glucose"));
				pm.setPulse_Rate(rs.getString("Pulse_Rate"));
				pm.setSpO2(rs.getString("SpO2"));
				pms.add(pm);

			}
			String jsonObject = gson.toJson(pms);
			PrintWriter out = response.getWriter();
	        out.print(jsonObject);
			//System.out.println(jsonObject);
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
} // end of class GetPatients