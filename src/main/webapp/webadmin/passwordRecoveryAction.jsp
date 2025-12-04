<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%@ include file="../dbConn/dbInit.jsp" %>
<%!
  public  String getNext() {
	 java.util.Random r = new java.util.Random();
	char[] goodChar = {'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w','x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K','M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z','2', '3', '4', '5', '6', '7', '8', '9'};

    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < 8; i++) {
      sb.append(goodChar[r.nextInt(goodChar.length)]);
    }
    return sb.toString();
  }
%>
<%
String userquestion=formatSQLInput(request.getParameter("question"));
String useranswer=formatSQLInput(request.getParameter("answer"));
if(userquestion.equals("7")){
userquestion="";
}
String msg = "";
String strGetUserQuery = "select DAU_LOGIN,DAU_PASSWORD,DAU_ID,SECRET_QUESTION,ANSWER,DAU_EMAIL FROM CMS_ADMIN_USER WHERE DAU_EMAIL = '"+formatSQLInput(request.getParameter("email"))+"' AND DAU_LOGIN = '"+formatSQLInput(request.getParameter("userid"))+"'";
//out.print(strGetUserQuery);
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();
String answer="";
String question="";
if(rsGetUser.size()>0){
answer = dbBean.getcell(rsGetUser,4,0);
question = dbBean.getcell(rsGetUser,3,0);
}
String password = "";
String userName = "";
String dau_id ="";
if(rsGetUser.size()>0 && question.equals(userquestion) && answer.equals(useranswer)){
	password = getNext();
	dau_id = dbBean.getcell(rsGetUser,2,0);
	//password = dbBean.getcell(rsGetUser,1,0);
	userName = dbBean.getcell(rsGetUser,0,0);
	
	String strUpdatePass ="";
	strUpdatePass ="UPDATE CMS_ADMIN_USER SET DAU_PASSWORD=lcase(md5('"+password+"')) WHERE DAU_ID="+dau_id;
	out.print(strUpdatePass);
	dbBean.setQuery(strUpdatePass);
	dbBean.go1();
	
	msg = "Username and password will be sent at given Email ID";
	String subject  = "UserName or  Password Recovery";
	String message="Login Name            :"+userName;
			   message+="<br>Password     :"+password;
			   message+="<br>Email        :"+formatSQLInput(request.getParameter("email"));
			   message+="<br>Your Password is reset. Please change your password on first login.";
		boolean bIsSMTPAuth = false;
		String strEmailFrom = "noreply@cris.org.in";
		String strEmailTo = dbBean.getcell(rsGetUser,5,0);
		String strEmailCC = "";
		String strEmailCc = "";
		String strEmailBcc = "";
		String strSubject =subject ;
		String strMessage = message;
%>
		<mt:mail>
			<mt:server>10.64.5.102</mt:server>
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

String actype = "0";
String acmsg = "Password Recover";
String acdescription =  userName + " Recover Password";
String acSqlQuery = strGetUserQuery;

%>
<%@ include file="createlog.jsp" %>
<%}else{
	msg = "Given information is not matched";
}%>
<%@ include file="../dbConn/dbClose.jsp" %>
<% 
response.sendRedirect("index.jsp?msg="+msg+"");

%>