<%@ taglib uri="http://jakarta.apache.org/taglibs/mailer-1.1" prefix="mt" %>
<%

		boolean bIsSMTPAuth = false;
		String strEmailFrom = "customercare@indianrailways.gov.in";
		String strEmailTo = "pavan.yadav@agnicient.com";
		String strEmailCC = "sandeeptomar0@gmail.com";
		String strEmailCc = "";
		String strEmailBcc = "";
		String strSubject ="subject" ;
		String strMessage =request.getServerName();
%>
		<mt:mail>
			<mt:server>203.176.113.172</mt:server>
			<mt:setrecipient type="to"><%=strEmailTo%></mt:setrecipient>		
			<mt:from><%=strEmailFrom%></mt:from>
			<mt:subject><%=strSubject%></mt:subject>
			<mt:message type="html"><%=strMessage%></mt:message>
			<mt:send>
				<p>There was an error while sending the email.<br/><br/>
				<mt:error id="err">
					<jsp:getProperty name="err" property="error"/><br/>
				</mt:error>
				<br/>Please back up a page, fix the error and resubmit.</p>
			</mt:send>
		</mt:mail>
