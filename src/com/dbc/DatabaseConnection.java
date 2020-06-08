package com.dbc;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DatabaseConnection implements AutoCloseable {

    private static final String DATASOURCENAME = "java:comp/env/jdbc/healthcare";
    private static DataSource ds = null;

    
    @SuppressWarnings("unused")
	private static void initConn() {

        try {

            Context ctx = new InitialContext();

            if (ctx == null) {
                throw new RuntimeException("JNDI Context not found");
            }
            ds = (DataSource) ctx.lookup(DATASOURCENAME);

            if (ds == null) {
                throw new RuntimeException("DataSource could not found");
            }

            //return ds.getConnection();
        } catch (NamingException e) {
            throw new RuntimeException("NamingException : " + e.getMessage());
        }

    }

    public static Connection getConnection() {

        try {
            if (ds == null) {
                initConn();
            }
            return ds.getConnection();

        } catch (Exception ex) {
            System.err.printf("getConnection fail : " + ex.getMessage());
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;

    }

    @Override
    public void close() throws Exception {
        
        
        if (ds != null) {
            try {
                System.err.printf("SQL Connection close ");
                //ds.
            } catch (Exception e) {
                System.err.println(e.getMessage());
            } finally {
                ds = null;
            }
        }

    }

}
