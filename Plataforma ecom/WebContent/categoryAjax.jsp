<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page  
		import="com.mysql.Connectors, java.sql.ResultSet"
%>

<% 
	if(request.getParameter("param") != null){ %>

<%	
		int nRows = 0;
		String result = "";
		Connectors con = new Connectors();
		ResultSet realRs, rs = con.
				execute_query("SELECT * FROM category_info WHERE category_parent_node='"+request.getParameter("param")+"'",
																							"database-category");

		
		while(rs.next())
			nRows++;
		
		if(nRows > 0){
			realRs = con.
			execute_query("SELECT * FROM category_info WHERE category_parent_node='"+request.getParameter("param")+"'",
					"database-category");
			result += "<table>";
			 while(realRs.next()){
				result += "<tr><td>"+realRs.getString("category_name")+"</td></tr>";
			}
			result += "</table>";
			
		}else{
			realRs = con.
				execute_query("SELECT * FROM product_info WHERE category_name='"+request.getParameter("param")+"'",
																							"database-category");
			while(realRs.next()){
				result = "<table><td><td><a href='#'><img src='resources/images/products/"+realRs.getString("product_name")+".jpg'>"
					+"</a></tr></td></table>";
			}
		}
		
		out.println(result);
		
	}
%>