<%@page language="java" import="java.sql.*"%>
<%@ page import="com.ideActive.dbUtils.*"%>
<jsp:useBean id="dbBean" class="com.ideActive.dbUtils.JDBCBean" scope="page">	
</jsp:useBean>
<jsp:useBean id="dataFormatter" class="com.ideActive.utils.DataFormatter" scope="page">	
</jsp:useBean>
<%
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver"); 
            String jdbcUri = "jdbc:mysql://localhost:3306/cris-scr"; 
            cn= DriverManager.getConnection(jdbcUri, "root", "root@123");
%>