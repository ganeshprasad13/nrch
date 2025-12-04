<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%!
  public  String getNext() {
	 java.util.Random r = new java.util.Random();
	char[] goodChar = {'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w','x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K','M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z','2', '3', '4', '5', '6', '7', '8', '9', '+', '-'};

    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < 8; i++) {
      sb.append(goodChar[r.nextInt(goodChar.length)]);
    }
    return sb.toString();
  }
%>
<%
int done = 0;
String msg = "";
// Check for user exist
String strQuery = "SELECT DAU_LOGIN FROM CMS_ADMIN_USER WHERE  DAU_LOGIN='"+request.getParameter("username")+"' ";
	//out.println(strQuery);
	dbBean.setQuery(strQuery);
	Vector getinfo = new Vector();
	getinfo = (Vector)dbBean.go();
if(getinfo.size() <= 0){
	
//check if specified password is correct
String pwdDetails = getNext();
String strDept = "";
String []strDeptValues =request.getParameterValues("Department_id");
String strTemp = "";

for(int i=0;i<strDeptValues.length;i++){
	strTemp =strTemp +strDeptValues[i];
	strDept = strTemp;
	strTemp += ",";
}
String strAddUserQuery = "INSERT INTO CMS_ADMIN_USER (DAU_LOGIN,DAU_PASSWORD,DAU_NAME,DAU_EMAIL,DIV_ID,DEPT_ID) values('";
strAddUserQuery = strAddUserQuery + request.getParameter("username") + "',";
strAddUserQuery = strAddUserQuery + "lcase(md5('"+ pwdDetails+ "')),'" ;
strAddUserQuery = strAddUserQuery + request.getParameter("name") + "','";
strAddUserQuery = strAddUserQuery + request.getParameter("email") + "',";
strAddUserQuery = strAddUserQuery + request.getParameter("Division_id") + ",'";
strAddUserQuery = strAddUserQuery + strDept + "')";
//out.print(strAddUserQuery);
dbBean.setQuery(strAddUserQuery);
dbBean.go1();
msg="User%20added  username and password will be send at given Email ID";
String subject  = ""+Hname+" :: Your Login Details";
String message="Dear " + request.getParameter("name") + " ,<br><br>Welcome to "+Hname+" Portal Administration Console.<br>This mail is regarding your account creation , your account has been created successfully and it is ready to use . Find the below your login details: <br><br><br>";
	message+="<b>Login Username</b>            :"+request.getParameter("username");
			   message+="<br><b>Password</b>     :"+pwdDetails;
			   message+="<br>Email        :"+request.getParameter("email")+"<br><br><b><u>Technical Assistance :</u></b> <br>If you are unable to login to the administration console, please contact Administrator  <br><br>Thanks & Regards, <br><br>CRIS Administrator";
		boolean bIsSMTPAuth = false;
		String strEmailFrom = "nr@cris.org.in";
		String strEmailTo = request.getParameter("email");
		String strEmailCC = "sandeeptomar0@gmail.com";
		String strEmailCc = "";
		String strEmailBcc = "";
		String strSubject =subject ;
		String strMessage = message;
%>
		<mt:mail>
			<mt:server>203.176.113.172</mt:server>
			<mt:setrecipient type="to"><%=strEmailTo%></mt:setrecipient>		
			<mt:from><%=strEmailFrom%></mt:from>
			<mt:subject><%=strSubject%></mt:subject>
			<mt:message type="html"><%=message%></mt:message>
			<mt:send>
				<p>There was an error while sending the email.<br/><br/>
				<mt:error id="err">
					<jsp:getProperty name="err" property="error"/><br/>
				</mt:error>
				<br/>Please back up a page, fix the error and resubmit.</p>
			</mt:send>
		</mt:mail>
<%
String strGetUserInfo = "SELECT  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=12 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";
	Vector rsGetUserInfo = new Vector();
	dbBean.setQuery(strGetUserInfo);
	rsGetUserInfo = (Vector)dbBean.go();
	
		if(rsGetUserInfo.size()==1) {
			strEmailTo = dbBean.getcell(rsGetUserInfo,0,0);
			%>
			<mt:mail>
			<mt:server>203.176.113.172</mt:server>
			<mt:setrecipient type="to"><%=strEmailTo%></mt:setrecipient>		
			<mt:from><%=strEmailFrom%></mt:from>
			<mt:subject><%=strSubject%></mt:subject>
			<mt:message type="html"><%=message%></mt:message>
			<mt:send>
				<p>There was an error while sending the email.<br/><br/>
				<mt:error id="err">
					<jsp:getProperty name="err" property="error"/><br/>
				</mt:error>
				<br/>Please back up a page, fix the error and resubmit.</p>
			</mt:send>
		</mt:mail>
			<%
		}
String actype = "0";
String acmsg = "CreateAdminUser";
String acdescription =  request.getParameter("username") + " login for user  " +  request.getParameter("name") + " created";
String acSqlQuery = strAddUserQuery;

%>
<%@ include file="../createlog.jsp" %>
<%}else{
 msg = "User already exist. Please try again.";
}%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
response.sendRedirect("../home.jsp?msg="+msg+"");
}
%>