<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String strAllQuery = "";
//insert data into table for creating a new section

String userID = (String)session.getAttribute("DBAusername");
String emailFrom = request.getParameter("emailFrom");
String emailTo = request.getParameter("emailTo");
String emailSubject = request.getParameter("emailSubject");
String description = request.getParameter("description0");
String strQueryHistory = "";
	description = description.replaceAll("'s", "&rsquo;s");
	description = description.replaceAll("'","&#0146;");
	strQueryHistory = "INSERT INTO CMS_USER_REQUEST (CUR_USER_ID,CUR_FROM, CUR_TO,CUR_SUBJECT, CUR_CONTENT,CUR_SEND_DATE)";
	strQueryHistory += " VALUES ('"+userID+"','"+emailFrom+"','"+emailTo+"','"+emailSubject+"','"+description+"',NOW())";
	//out.print(strQueryHistory);
	dbBean.setQuery(strQueryHistory);
	dbBean.go1();
	String message = description;
		boolean bIsSMTPAuth = false;
		String strEmailFrom = emailFrom;
		String strEmailTo = emailTo;
		String strEmailCC = "sandeeptomar0@gmail.com";
		String strEmailCc = "";
		String strEmailBcc = "";
		String strSubject =emailSubject;
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
String actype = "1";
String acmsg = "Send Email";
String acdescription = "Send email to administrator";
String acSqlQuery = strQueryHistory;
%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
	response.sendRedirect("userRequest.jsp?strMSG=Email Sent succeessfully");
%>