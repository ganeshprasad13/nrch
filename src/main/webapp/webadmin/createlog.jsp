<%
acSqlQuery = acSqlQuery.replaceAll("'","&rsquo;");

String adminlogqry = "INSERT INTO CMS_ADMIN_LOG ";
adminlogqry = adminlogqry + "(CAL_TYPE, CAL_TITLE,CAL_DESCRIPTION, CAL_CAU_LOGIN, CAL_CREATED_DATE,CAL_SQLQUERY,CAL_IPADDRESS) ";
adminlogqry = adminlogqry + "VALUES ";
adminlogqry = adminlogqry + "("+actype+",'"+acmsg+"','"+acdescription+"'," ;
adminlogqry = adminlogqry + "'"+session.getAttribute("DBAusername")+"',Now(),'"+acSqlQuery+"','"+request.getRemoteAddr()+"')";
dbBean.setQuery(adminlogqry);
dbBean.go1();
%>
