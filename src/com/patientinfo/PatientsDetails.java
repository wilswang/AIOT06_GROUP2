package com.patientinfo;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbc.DatabaseConnection;


@WebServlet("/PatientsDetails")
public class PatientsDetails extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	private static final String SQLDM =
			"SELECT * FROM dailymeasure WHERE Patno = ?";
	
	private static final String SQLDMLatest =
			"SELECT * FROM dailymeasure WHERE Patno = ? LIMIT 1";
	
	private static final String SQLCrts =
			"SELECT * FROM dailymeasure WHERE Patno = ? LIMIT 14";
	
	private static final String SQLPatient =
			"SELECT * FROM patient WHERE Patno = ?";
	

	
	Connection conn;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		

		 try (Connection conn = DatabaseConnection.getConnection()) {
		        System.out.println(conn.isClosed());
			/*Select Patient all Dailymeasure*/
			
			
			
			String Patno = request.getParameter("patno");
			
			PreparedStatement stmt = conn.prepareStatement(SQLDM);
//			stmt.setString(parameterIndex, x); 
			
			
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

			}
			/*Select Patient latest Dailymeasure*/
			stmt = conn.prepareStatement(SQLDMLatest);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean DMLatest = null;
			while (rs.next()) {
				DMLatest = new HealthcareBean();
				DMLatest.setSBP(rs.getString("sBP"));
				DMLatest.setDBP(rs.getString("dBP"));
				DMLatest.setGlucose(rs.getString("glucose"));
				DMLatest.setPulse_Rate(rs.getString("pulse_Rate"));
				DMLatest.setSpO2(rs.getString("spO2"));
			}
			/*Select Patient 14 days Dailymeasure*/
			stmt = conn.prepareStatement(SQLCrts);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			List<HealthcareBean> DMCrts = new ArrayList<>();
			HealthcareBean DMCrt = null;
			while (rs.next()) {
				DMCrt = new HealthcareBean();
				DMCrt.setSBP(rs.getString("sBP"));
				DMCrt.setDBP(rs.getString("dBP"));
				DMCrt.setGlucose(rs.getString("glucose"));
				DMCrt.setPulse_Rate(rs.getString("pulse_Rate"));
				DMCrt.setSpO2(rs.getString("spO2"));
				DMCrts.add(DMCrt);
			}
			/*Select Patient Name and Gender*/
			stmt = conn.prepareStatement(SQLPatient);
			stmt.setString(1, Patno);
			rs = stmt.executeQuery();
			HealthcareBean pat = null;
			while (rs.next()) {
				pat = new HealthcareBean();
				pat.setpName(rs.getString("pName"));
				pat.setGender(rs.getString("gender"));
				pat.setHeight(rs.getString("height"));
				pat.setWeight(rs.getString("weight"));
			}
			request.setAttribute("DM", DM);
			request.setAttribute("DMs", DMs);
			request.setAttribute("DMCrts", DMCrts);
			request.setAttribute("DMLatest", DMLatest);
			request.setAttribute("pat", pat);
			stmt.close();
			request.getRequestDispatcher("./PatientsDetails.jsp")
				.forward(request, response);
//			System.out.println("123");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}