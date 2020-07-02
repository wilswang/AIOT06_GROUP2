package com.patientinfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbc.DatabaseConnection;


@WebServlet("/Search_one")
public class Search_one extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SQL =
			"SELECT * FROM patient WHERE Patno=?";	
	Connection conn;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String Patno = request.getParameter("patno");
		HealthcareBean pat = new HealthcareBean();
		 try (Connection conn = DatabaseConnection.getConnection()) {
//		        System.out.println(conn.isClosed());
		        
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, Patno);
			ResultSet rs = stmt.executeQuery();
			com.google.gson.Gson gson = new com.google.gson.Gson();
			rs.beforeFirst();
			if(rs.next()) {	
				pat.setPatno(rs.getString("Patno"));
				pat.setpName(rs.getString("pName"));					
				pat.setBirthday(rs.getString("birthday"));
				pat.setGender(rs.getString("Gender"));
				pat.setHeight(rs.getString("Height"));
				pat.setWeight(rs.getString("Weight"));
				pat.setM_phone(rs.getString("M_phone"));
				pat.setE_contact_person(rs.getString("E_contact_person"));
				pat.setE_contact_no(rs.getString("E_contact_no"));
				pat.setE_contact_relation(rs.getString("E_contact_relation"));
				pat.setFlag("Search");
				String jsonObject = gson.toJson(pat);
				System.out.println(jsonObject);
				PrintWriter out = response.getWriter();
		        out.print(jsonObject);
			}
			else {
//				System.out.println("Select failed");
				pat.setFlag("Search_fail");
				pat.setPatno(Patno);
				String jsonObject = gson.toJson(pat);
				PrintWriter out = response.getWriter();
		        out.print(jsonObject);
			}
			stmt.close();
			}catch (NullPointerException e) {
				e.printStackTrace();
			}catch (SQLDataException e) {
				pat.setFlag("Search_fail");
				pat.setPatno(Patno);
				request.setAttribute("pat", pat);
				request.getRequestDispatcher("./Edit_Pats_search.jsp").forward(request, response);
			}catch (Exception e) {
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
	}

}
