package com.patientinfo;

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



@SuppressWarnings("unused")
@WebServlet("/AddPatient")
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private static final String SQL =
			"INSERT INTO patient (pName, birthday, Gender, Height, Weight, M_phone, E_contact_person, E_contact_no, E_contact_relation)  VALUES (?,?,?,?,?,?,?,?,?)";

	private static final String SQL1 =
			"SELECT * from patient WHERE M_phone=? AND E_contact_no=?";

	Connection conn;  
    
	protected void Ajax(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		response.setContentType("application/json");
		String pName = request.getParameter("pname") ;
		String birthday = request.getParameter("birthday") ;
		String Gender = request.getParameter("gender") ;
		String Height = request.getParameter("Height") ;
		String Weight = request.getParameter("Weight") ;
		String M_phone = request.getParameter("M_phone") ;
		String E_contact_person = request.getParameter("E_contact") ;
		String E_contact_no = request.getParameter("E_phone_no") ;
		String E_contact_relation = request.getParameter("E_relationship") ;
		try (Connection conn = DatabaseConnection.getConnection()) {
//		        System.out.println(conn.isClosed());
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, pName);
			stmt.setString(2, birthday);
			stmt.setString(3, Gender);
			stmt.setString(4, Height);
			stmt.setString(5, Weight);
			stmt.setString(6, M_phone);
			stmt.setString(7, E_contact_person);
			stmt.setString(8, E_contact_no);
			stmt.setString(9, E_contact_relation);			
			
			int rows = stmt.executeUpdate();
//		    System.out.println("Update success, Rows impacted : " + rows );
			HealthcareBean pat = new HealthcareBean();

			stmt = conn.prepareStatement(SQL1);
			stmt.setString(1, M_phone);		
			stmt.setString(2, E_contact_no);	
			ResultSet rs = stmt.executeQuery();
			com.google.gson.Gson gson = new com.google.gson.Gson();
			if(rs.next()) {
				String dbpName=rs.getString("pName");
				String dbE_contact_relation=rs.getString("E_contact_relation");
				if(dbpName.equals(pName) && dbE_contact_relation.equals(E_contact_relation)) {
					
					pat.setFlag("add");
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
					String jsonObject = gson.toJson(pat);
//					System.out.println(jsonObject);
			        PrintWriter out = response.getWriter();
			        out.print(jsonObject);
				}else {
					pat.setFlag("Add_fail");
					String jsonObject = gson.toJson(pat);
					PrintWriter out = response.getWriter();
			        out.print(jsonObject);
				}
					
			}else {
				pat.setFlag("Add_fail");
				String jsonObject = gson.toJson(pat);
				PrintWriter out = response.getWriter();
		        out.print(jsonObject);
			}}catch (NullPointerException e) {
				e.printStackTrace();
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
        out.write("No get");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Ajax(request,response);
	}

}
