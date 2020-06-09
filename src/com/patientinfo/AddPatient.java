package com.patientinfo;

import java.io.IOException;
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



@WebServlet("/AddPatient")
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private static final String SQL =
			"INSERT INTO patient (pName, birthday, Gender, M_phone, E_contact_person, E_contact_no, E_contact_relation)  VALUES (?,?,?,?,?,?,?)";

	private static final String SQL1 =
			"SELECT * from patient WHERE M_phone=? AND E_contact_no=?";

	Connection conn;  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		String pName = request.getParameter("pname") ;
		String birthday = request.getParameter("birthday") ;
		String Gender = request.getParameter("gender") ;
		String M_phone = request.getParameter("M_phone") ;
		String E_contact_person = request.getParameter("E_contact") ;
		String E_contact_no = request.getParameter("E_phone_no") ;
		String E_contact_relation = request.getParameter("E_relationship") ;
		 
		try (Connection conn = DatabaseConnection.getConnection()) {
		        System.out.println(conn.isClosed());
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, pName);
			stmt.setString(2, birthday);
			stmt.setString(3, Gender);
			stmt.setString(4, M_phone);
			stmt.setString(5, E_contact_person);
			stmt.setString(6, E_contact_no);
			stmt.setString(7, E_contact_relation);			
			@SuppressWarnings("unused")
			int rows = stmt.executeUpdate();
//		    System.out.println("Update success, Rows impacted : " + rows );
//			HttpSession session =  request.getSession() ;
			HealthcareBean pat = new HealthcareBean();

			stmt = conn.prepareStatement(SQL1);
			stmt.setString(1, M_phone);		
			stmt.setString(2, E_contact_no);	
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String dbpName=rs.getString("pName");
				String dbE_contact_relation=rs.getString("E_contact_relation");
				if(dbpName.equals(pName) && dbE_contact_relation.equals(E_contact_relation)) {
//					System.out.println(rs.getString("Patno"));
					pat.setFlag("add");
					pat.setPatno(rs.getString("Patno"));
					pat.setpName(rs.getString("pName"));					
					pat.setBirthday(rs.getString("birthday"));
					pat.setGender(rs.getString("Gender"));
					pat.setM_phone(rs.getString("M_phone"));
					pat.setE_contact_person(rs.getString("E_contact_person"));
					pat.setE_contact_no(rs.getString("E_contact_no"));
					pat.setE_contact_relation(rs.getString("E_contact_relation"));
					request.setAttribute("pat", pat);
					request.getRequestDispatcher("./Edit_Pats.jsp").forward(request, response); //�۹���|
				}else {
//					System.out.println("Fail");
					response.sendRedirect("./Edit_Pats.jsp") ;
				}
					
			}else {
//				System.out.println("Select failed");
				response.sendRedirect("./Edit_Pats_search.jsp") ;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
