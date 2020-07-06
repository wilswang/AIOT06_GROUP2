package com.upload;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.dbc.DatabaseConnection;
import com.patientinfo.HealthcareBean;

@WebServlet("/UploadFile")
@MultipartConfig
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SQLUF =
//			"INSERT INTO health_examination_record2 VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			"INSERT INTO health_examination_record2 VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	Connection conn;
	public static final String CONTENT_TYPE = "Content-type";
	public static final String MULTIPART_FORM_DATA = "multipart/form-data";
	public static final String MULTIPART_MIXED = "multipart/mixed";
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try (Connection conn = DatabaseConnection.getConnection()) {
		        System.out.println(conn.isClosed());		
		PreparedStatement pstmt = conn.prepareStatement(SQLUF);

		Part filePart = request.getPart("healthcheck"); // Retrieves <input type="file" name="file">
		
		String header = filePart.getHeader("Content-Disposition");
		InputStream fileContent = filePart.getInputStream();
		InputStreamReader inputCSV = new InputStreamReader(fileContent);
		BufferedReader br = new BufferedReader(inputCSV);
		HealthcareBean pat = new HealthcareBean();
		String row;
		String[] cols;
		int count=0;
		while ((row = br.readLine()) != null) {
			if(count!=0) {
				cols = row.split(",");
				for (int i = 0; i < cols.length; i++) {
					pstmt.setString(i+1, cols[i]);
					System.out.println(i+" , "+cols[i]);
				}pstmt.execute();
			}
			count++;
		}
		pat.setFlag("Upload");
		com.google.gson.Gson gson = new com.google.gson.Gson();
		String jsonObject = gson.toJson(pat);
		PrintWriter out = response.getWriter();
		System.out.println(jsonObject);
		out.print(jsonObject);
		br.close();
		pstmt.close();
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
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
