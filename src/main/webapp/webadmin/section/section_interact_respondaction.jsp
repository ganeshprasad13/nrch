<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%


//insert data into table for creating a new section

String section = "UPDATE CMS_USER_RESPONSE ";
section = section + " SET DUR_REPLY_FLAG=1, DUR_REPLY_COMMENTS='"+request.getParameter("replymsg")+"',DUR_REPLY_BY ='"+session.getAttribute("DBAusername")+"',DUR_REPLY_DATE=now() ";
section = section + " WHERE DUR_ID = "+request.getParameter("rid");
out.println(section);
dbBean.setQuery(section);
dbBean.go1();


String returnurl = request.getParameter("returnurl");
String strMessage = request.getParameter("replymsg");
String strUserName = request.getParameter("name");
String strSenderName = request.getParameter("sendername");
strMessage = "Dear " + strUserName + ",\n\t" + strMessage;
strMessage = strMessage + "\nPlease do not reply to this message. This message was sent from an unmonitored email address. If you feel that you received this message in error or have another question or concern , please click on the link below and go to the feedback section.\n" + strWebAppURL + "\n";
strMessage = strMessage + "\n Regards,\n" + strSenderName + "\nCMS";
%>
<mt:mail>
	<mt:server><%=mailserver%></mt:server>
	<mt:setrecipient type="to"><%=request.getParameter("mailto")%></mt:setrecipient>
	<mt:from>noreply@denabank.com</mt:from>
	<mt:subject>Re: Your feedback/ query to CMS!</mt:subject>
	<mt:message><%=strMessage%></mt:message>
	<mt:send>
		<p>There was an error while sending the email.<br/><br/>
		<mt:error id="err">
			<jsp:getProperty name="err" property="error"/><br/>
		</mt:error>
		<br/>Please back up a page, fix the error and resubmit.</p>
	</mt:send>
</mt:mail>



<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
	response.sendRedirect(returnurl);
%>