<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%

String SiteName = request.getParameter("SiteName");
String Byline = request.getParameter("Byline");
String Sitelogo = request.getParameter("Sitelogo");

String publictitle = request.getParameter("publictitle");
String publictitle3 = request.getParameter("publictitle3");
String publictitle4 = request.getParameter("publictitle4");
String publictitle5 = request.getParameter("publictitle5");
String publictitle6 = request.getParameter("publictitle6");
String publicintro = request.getParameter("publicintro");
String publicintroh = request.getParameter("publicintroh");
publicintroh = publicintroh.replaceAll("'s","&rsquo;s");
publicintroh = publicintroh.replaceAll("'","&#0146;");
String userFeedBack = request.getParameter("userFeedBack");
String userCreation = request.getParameter("userCreation");
String strAllSQL = "";
		String query = "update CMS_SITE_CONFIGURATION set CMSSC_FLAG = 0 ";
		dbBean.setQuery(query);
		dbBean.go1();
		strAllSQL += "<hr>"+query;
		
		if(SiteName!=null && !SiteName.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + SiteName + "',1,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}

				if(Byline!=null && !Byline.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + Byline + "',2,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(Sitelogo!=null && !Sitelogo.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + Sitelogo + "',3,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publictitle!=null && !publictitle.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publictitle + "',4,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				if(publictitle3 !=null && !publictitle3.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publictitle3 + "',5,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publictitle4 !=null && !publictitle4.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publictitle4 + "',6,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publictitle5 !=null && !publictitle5.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publictitle5 + "',7,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publictitle6 !=null && !publictitle6.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publictitle6 + "',8,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publicintro !=null && !publicintro.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publicintro + "',9,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				
				if(publicintroh !=null && !publicintroh.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + publicintroh + "',10,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				if(userFeedBack !=null && !userFeedBack.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + userFeedBack + "',11,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
				if(userCreation !=null && !userCreation.equals("")){
					String strACLDetails = "INSERT INTO CMS_SITE_CONFIGURATION (CMSSC_DESC, CMSSC_TYPE, CMSSC_SITE_ID, CMSSC_FLAG, CMSSC_CBY,CMSSC_CDATE) VALUES ('" + userCreation + "',12,1,1,'"+session.getAttribute("DBAusername")+"',now())";
					dbBean.setQuery(strACLDetails);
					dbBean.go1();
					strAllSQL += "<hr>"+strACLDetails;
				}
			String actype = "1";
			String acmsg = "SiteConfiguration";
			String acdescription =  session.getAttribute("DBAusername") + " Site Configuration updated";
			String acSqlQuery = strAllSQL;
			%>
			
		<%@ include file="../createlog.jsp" %>
		<%@ include file="../../dbConn/dbClose.jsp" %>
		<% 
		response.sendRedirect("siteConfig.jsp?msg=Site%20Configuration%20updated");
	}%>