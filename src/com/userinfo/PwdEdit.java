package com.userinfo;

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
import javax.servlet.http.HttpSession;

import com.dbc.DatabaseConnection;


@WebServlet("/PwdEdit")
public class PwdEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SQL =
			"UPDATE userinfo SET Psw=? WHERE Empno=?";

	private static final String SQL1 =
			"SELECT Psw FROM userinfo WHERE Empno=?";
	Connection conn;  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		String Empno = request.getParameter("Empno") ;
		String Psw = request.getParameter("psw") ;
		
		 try (Connection conn = DatabaseConnection.getConnection()) {
		   System.out.println(conn.isClosed());
		        
//			update the new password
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(2, Empno);
			stmt.setString(1, Psw);
			HttpSession session =  request.getSession() ;
			int rows = stmt.executeUpdate();
		    System.out.println("pwd update success, Rows impacted : " + rows );
			
//			check if update successfully or not
			stmt = conn.prepareStatement(SQL1);
			stmt.setString(1, Empno);			
			ResultSet rs = stmt.executeQuery();		
		    
			if (rs.next()) {				
				System.out.println("Select finished");
				if(rs.getString("Psw").equals(Psw)) {
//					if succeed
//					request.setAttribute("psw_edit", "T");
//					System.out.println("Success");
					
					request.getRequestDispatcher("/Getabnormal_detect").forward(request, response); //�۹���|
//					response.sendRedirect("/FinalProject/HTML/index_homepage.jsp");
				}
			}else {
//				System.out.println("Fail");
				session.setAttribute("psw_edit", "F");				
				response.sendRedirect("/FinalProject/HTML/user_account.jsp");
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
