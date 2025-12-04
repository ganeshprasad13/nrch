<%
if(request.getHeader("referer").indexOf(request.getServerName())==-1){
	response.sendRedirect("http://"+request.getServerName());
}
%>
<%
Integer applicationCount = (Integer)session.getAttribute("applicationCount");
java.util.Date minuteCount = null;
long diff=0;
minuteCount = (java.util.Date)session.getAttribute("minuteCount");
if(minuteCount != null){
diff=(new java.util.Date()).getTime()-minuteCount.getTime();
}
int min=(int)diff/(1000*60);
if(applicationCount != null && applicationCount.intValue()>=3 &&  min<=5){
session.setAttribute("minuteCount", new java.util.Date());
response.sendRedirect("../index.jsp?msg=You have done maximum number of attempt to login.  Try after 5 minutes.");
return;
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query;
String strgotoURL = "../index.jsp?msg=Invalid%20Login%20Information";
Vector rs = new Vector();
String strUserName = "";
String strdenaCapKey = "";
String msg = "";
boolean isAllowInsert = false;
String txtShownImage="";
txtShownImage=request.getParameter("txtShownImg");
strdenaCapKey = (String)session.getAttribute("srsCapKey");
if(txtShownImage!=null&&strdenaCapKey!=null&&strdenaCapKey.equals(txtShownImage)){
        isAllowInsert = true;
    }else{
        msg="You have entered wrong verification code."+txtShownImage+"test"+strdenaCapKey+"test";
        isAllowInsert = false;
}
strUserName = request.getParameter("username");
if(strUserName!=null){
	strUserName = formatSQLInput(strUserName);
}else{
	strUserName = "";
}
String strUserPassword = "";
strUserPassword = request.getParameter("password");
if(strUserPassword!=null){
	strUserPassword = formatSQLInput(strUserPassword);
}else{
	strUserPassword = "";
}

query = "SELECT DAU_NAME,DAU_ACCESS_LEVEL,DAU_ID,DEPT_ID,DAU_EMAIL ";
if(Hname.equals("rcf") || Hname.equals("rcfrbl")){
query = query + ",USER_TYPE ";
}
query = query + "FROM CMS_ADMIN_USER ";
query = query + "WHERE DAU_STATUS = 1 AND DAU_LOGIN = '"+ strUserName +"' AND lcase(DAU_PASSWORD)= lcase('"+ strUserPassword +"') ";

dbBean.setQuery(query);
rs=(Vector)dbBean.go();

// check if the username and password returned a match in the database
// if there is a matching entry then go and create the session
// otherwise return the user to login page
if (rs.size()!=0&&isAllowInsert){
	String login = strUserName;
	String name = dbBean.getcell(rs,0,0);
	
	session.setAttribute("DBAusername",login);
	session.setAttribute("DBAname",name);
	session.setAttribute("DBAacc",dbBean.getcell(rs,1,0));
	session.setAttribute("DBAUserId",dbBean.getcell(rs,2,0));
	session.setAttribute("DBAcreate","0");
	session.setAttribute("DEPT_ID",dbBean.getcell(rs,3,0));
	session.setAttribute("DBAEmail",dbBean.getcell(rs,4,0));
	if(Hname.equals("rcf") || Hname.equals("rcfrbl")){
		session.setAttribute("UserType",dbBean.getcell(rs,5,0));
	}
// Login details
	String strLogDetails="INSERT INTO CMS_LOGIN_DETAILS(USER_ID, USER_NAME, LAST_LOGIN, IP_ADDRESS )VALUES("+dbBean.getcell(rs,2,0)+",'"+login+"',NOW(),'"+request.getRemoteAddr()+"')";
	dbBean.setQuery(strLogDetails);
	dbBean.go1();
	String strCreateStatus = "select ACL_ID from CMS_ACL where ACL_USER_ID = " + dbBean.getcell(rs,2,0) + " and ACL_INFO = '999'";
	Vector strCreateStatus_rs = new Vector();
	dbBean.setQuery(strCreateStatus);
	strCreateStatus_rs = (Vector)dbBean.go();
	
	if(strCreateStatus_rs.size()!=0) {
		session.setAttribute("DBAcreate","999");
	}
	strgotoURL = "../home.jsp";
	applicationCount = new Integer(0);
	session.setAttribute("applicationCount", applicationCount);
	session.setAttribute("minuteCount", null);
}else{
	
		applicationCount = (Integer)session.getAttribute("applicationCount");
       if (applicationCount == null) {
           applicationCount = new Integer(1);
       } else {
           applicationCount= new Integer(applicationCount.intValue() + 1);
       }
		session.setAttribute("applicationCount", applicationCount);
		session.setAttribute("minuteCount", new java.util.Date());
		strgotoURL = "../index.jsp?msg=Invalid%20Login%20Information. "+msg+"";
		
	// Failed Login details 30-01-2013
	String strLogFailDetails="INSERT INTO CMS_LOGIN_FAILED_DETAILS(USER_NAME, LAST_LOGIN, IP_ADDRESS )VALUES('"+strUserName+"', NOW(), '"+request.getRemoteAddr()+"')";
	dbBean.setQuery(strLogFailDetails);
	dbBean.go1();
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%	
	response.sendRedirect(strgotoURL);
%>