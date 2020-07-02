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


@WebServlet("/Statistics")
public class Statistics extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String SQL =
			"SELECT * FROM statistics  LIMIT 7";
	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}// end of doGet()

	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		response.setContentType("application/json"); 
		try (Connection conn = DatabaseConnection.getConnection()) {
			System.out.print("Here is Statistics! Is connection closed? ");
			System.out.println(conn.isClosed());
			PreparedStatement stmt = conn.prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			HealthcareBean Stat = null;
			Map<String,Map> data2 = new HashMap<>();
			Integer i = 0;
			while(rs.next()) {
				Stat = new HealthcareBean();
				List<HealthcareBean> Stat_= new ArrayList<>();
				Map<String,List> data = new HashMap<>();
				Stat.setDate(rs.getString("date").substring(0, 11));
				Stat.setSd_bp(rs.getString("SBP_DBP"));
				Stat.setGlucose(rs.getString("glucose"));
				Stat.setPulse_Rate(rs.getString("Pulse_Rate"));
				Stat.setSpO2(rs.getString("SpO2"));
				Stat_.add(Stat);
				data.put("Date", Stat_);
				data2.put(Integer.toString(i),data);
				i++;
			}
			com.google.gson.Gson gson = new com.google.gson.Gson();
			String jsonObject = gson.toJson(data2);
//			System.out.println(jsonObject);
			PrintWriter out = response.getWriter();
	        out.print(jsonObject);			
			
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
	}// end of doPost()

}
