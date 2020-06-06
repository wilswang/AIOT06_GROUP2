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


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SQL =
			"SELECT empno, Psw FROM userinfo WHERE Empno=?";
	private static final String SQL1 =
			"SELECT eName, title FROM employee WHERE Empno=?";
	Connection conn;
        
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8") ;
		 String empno = request.getParameter("empno") ;
		 String psw = request.getParameter("psw") ;
		 
		 
		 try (Connection conn = DatabaseConnection.getConnection()) {
	        System.out.println(conn.isClosed());
	            
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, empno);
			ResultSet rs = stmt.executeQuery();
			HttpSession session =  request.getSession() ;

			session.setMaxInactiveInterval(15*60); // 嚙踝蕭嚙踝蕭嚙�: 60*15嚙踝蕭
//			String sesid=session.getId();
			Empbean emp = new Empbean();
			int count=0;
			if(session.getAttribute("count")!=null && empno.equals(session.getAttribute("lastuser"))) {
				count=(Integer)session.getAttribute("count");
			}
			if(count<3) {
				if(rs.next()) {
					String dbname=rs.getString("Empno");
					String dbpsw=rs.getString("Psw");							
					if(dbname.equals(empno) && dbpsw.equals(psw)) {
						stmt = conn.prepareStatement(SQL1);
						stmt.setString(1, empno);
						rs = stmt.executeQuery();
						if (rs.next()) {
							emp.setEmpno(empno);
							emp.setEname(rs.getString("eName"));
							emp.setTitle(rs.getString("title"));
						}
						session.setAttribute("emp", emp);
						session.setAttribute("LogOk","yes");
						request.getRequestDispatcher("/Getabnormal_detect").forward(request, response); //嚙諛對蕭嚙踝蕭|
												
					}
					else {
						count+=1;						
						session.setAttribute("count", count);
						session.setAttribute("lastuser", empno);
						response.sendRedirect("./Login_page.jsp") ;						
					}						
				}
				else {
					count+=1;						
					session.setAttribute("count", count);
					session.setAttribute("lastuser", empno);
					response.sendRedirect("./Login_page.jsp") ;
				}
			}
			else {
				count+=1;						
				session.setAttribute("count", count);	
				session.setAttribute("lastuser", empno);				
				response.sendRedirect("./login/Fail.jsp") ;
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
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
