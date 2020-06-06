package com.patientinfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbc.DatabaseConnection;


@WebServlet("/EditPatient")
public class EditPatient extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	private static final String SQL =
			"UPDATE patient SET pName=?, birthday=?, Gender=?, M_phone=?, E_contact_person=?, E_contact_no=?, E_contact_relation=? WHERE Patno=?";
//			"UPDATE patient (pName, birthday, Gender, M_phone, E_contact_person, E_contact_no, E_contact_relation)  VALUES (?,?,?,?,?,?,?) WHERE Patno=?";
	private static final String SQL1 =
			"SELECT * FROM patient WHERE Patno=?";
	Connection conn;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		String Patno = request.getParameter("patno");
		String pName = request.getParameter("pname");
		String birthday = request.getParameter("birthday");
		String Gender = request.getParameter("gender");
		String M_phone = request.getParameter("M_phone");
		String E_contact_person = request.getParameter("E_contact");
		String E_contact_no = request.getParameter("E_phone_no");		
		String E_contact_relation = request.getParameter("E_relationship");
		
		try (Connection conn = DatabaseConnection.getConnection()) {
		        System.out.println(conn.isClosed());
//			update patient info
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, pName);
			stmt.setString(2, birthday);
			stmt.setString(3, Gender);
			stmt.setString(4, M_phone);
			stmt.setString(5, E_contact_person);
			stmt.setString(6, E_contact_no);
			stmt.setString(7, E_contact_relation);
			stmt.setString(8, Patno);			
			int rows = stmt.executeUpdate();
			System.out.println("pat update success, Rows impacted : " + rows );
			
//			select patient info
			
			stmt = conn.prepareStatement(SQL1);
			stmt.setString(1, Patno);	
			ResultSet rs = stmt.executeQuery();
			Patbean pat = new Patbean();
//			System.out.println("SQL done");
			
			if(rs.next()) {		
				pat.setPatno(rs.getString("Patno"));
				pat.setpName(rs.getString("pName"));					
				pat.setBirthday(rs.getString("birthday"));
				pat.setGender(rs.getString("Gender"));
				pat.setM_phone(rs.getString("M_phone"));
				pat.setE_contact_person(rs.getString("E_contact_person"));
				pat.setE_contact_no(rs.getString("E_contact_no"));
				pat.setE_contact_relation(rs.getString("E_contact_relation"));
				pat.setFlag("Edit");
				request.setAttribute("pat", pat);
				request.getRequestDispatcher("./Edit_members_search_suc.jsp").forward(request, response); //�۹���|					
			}else {
				System.out.println("Select failed");
//				System.out.println(rs.getString("Patno"));
				pat.setPatno(Patno);
				request.setAttribute("pat", pat);
				request.getRequestDispatcher("./Edit_members_search.jsp").forward(request, response); //�۹���|
			}
			stmt.close();
			}catch (NullPointerException e) {
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
