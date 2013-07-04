package com.mysql;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Connectors implements Serializable{
	private static final long serialVersionUID = 1L;
	private Connection con;
	
	public ResultSet execute_query(String query, String context) throws SQLException, NamingException{
		ResultSet rs;
		DataSource ds;
		
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/"+context);
		
		if(ds == null)
			throw new SQLException("Error, could not retrieve data source.");
		
		 if(con == null) //so there is only one connection.
			con = ds.getConnection();
		
		if(con == null)
			throw new SQLException("Error, could not establish connection with database.");
		
		PreparedStatement ps = con.prepareStatement(query);
		
		rs = ps.executeQuery();
		
		return rs;
	}
}
