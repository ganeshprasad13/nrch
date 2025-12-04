<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
int done = 0;

//check if specified password is correct
Vector rschkpwd = new Vector();
String chkpwd = "SELECT DAU_ID FROM CMS_ADMIN_USER ";
chkpwd = chkpwd + "WHERE lcase(DAU_PASSWORD) = lcase('"+request.getParameter("ppwd")+"') ";
chkpwd = chkpwd + "AND DAU_LOGIN = '"+session.getAttribute("DBAusername")+"'";
dbBean.setQuery(chkpwd);
rschkpwd = (Vector)dbBean.go();
//out.print(chkpwd);

if(rschkpwd.size()==0){
// specified current password did not match with entry in database 
done = 1;


}else{
// specified current password is correct - change password 

String updatepwd;
updatepwd = "UPDATE CMS_ADMIN_USER SET DAU_PASSWORD = ";
updatepwd = updatepwd + "lcase('"+request.getParameter("npwd")+"') WHERE ";
updatepwd = updatepwd +"DAU_LOGIN = '"+session.getAttribute("DBAusername")+"'";
dbBean.setQuery(updatepwd);
dbBean.go1(); 
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
if(done == 0){
// close database and re-locate  with message
response.sendRedirect("../home.jsp?msg=Password%20updated");
}else{
response.sendRedirect("chgpassword.jsp?msg=Invalid%20password%20specified");
}
}
%>