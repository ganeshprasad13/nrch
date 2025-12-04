<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String query1;
String side = "0";
String strAllQuery = "";

if (request.getParameter("side") != null) {	
	String[] side_t = request.getParameterValues("side");
	String strDeleteOldMapping = "delete from CMS_MAP_BANNER where DMB_DCB_ID = " + request.getParameter("bid");
	dbBean.setQuery(strDeleteOldMapping);
	dbBean.go1();
	strAllQuery = strDeleteOldMapping;
	for (int m=0;m<(side_t.length);m++)  {
		side = side_t[m];
		//query1 = "UPDATE CMS_MAP_BANNER SET DMB_FLAG=0 WHERE DMB_DSM_ID = ("+side+") and DMB_LANG_ID=0 AND DMB_DCB_TYPE = "+request.getParameter("TYPEID");
		//dbBean.setQuery(query1);
		//dbBean.go1();
		
		query1 = "INSERT INTO CMS_MAP_BANNER (DMB_DCB_ID,DMB_DSM_ID,DMB_LANG_ID,DMB_CREATED_BY,DMB_DCB_TYPE,DMB_START_DATE,DMB_END_DATE,DMB_CREATED_DATE) VALUES("+request.getParameter("bid")+","+side+",0,'"+session.getAttribute("DBAusername")+"',"+request.getParameter("TYPEID")+",'"+request.getParameter("syear")+"-"+request.getParameter("smon")+"-"+request.getParameter("sday")+"','"+request.getParameter("eyear")+"-"+request.getParameter("emon")+"-"+request.getParameter("eday")+"',now())";
		dbBean.setQuery(query1);
		dbBean.go1();
		strAllQuery += "<hr>"+query1;
	}
}

String sidh = "0";
if (request.getParameter("sidh") != null) {
	String[] sidh_t = request.getParameterValues("sidh");
	
	for (int m=0;m<(sidh_t.length);m++){
		sidh = sidh_t[m];			
		//query1 = "UPDATE CMS_MAP_BANNER SET DMB_FLAG=0 WHERE DMB_DSM_ID = ("+sidh+") and DMB_LANG_ID=1 AND DMB_DCB_TYPE = "+request.getParameter("TYPEID");
		//dbBean.setQuery(query1);
		//dbBean.go1();	
		query1 = "INSERT INTO CMS_MAP_BANNER (DMB_DCB_ID,DMB_DSM_ID,DMB_LANG_ID,DMB_CREATED_BY,DMB_DCB_TYPE,DMB_START_DATE,DMB_END_DATE,DMB_CREATED_DATE) VALUES("+request.getParameter("bid")+","+sidh+",1,'"+session.getAttribute("DBAusername")+"',"+request.getParameter("TYPEID")+",'"+request.getParameter("syear")+"-"+request.getParameter("smon")+"-"+request.getParameter("sday")+"','"+request.getParameter("eyear")+"-"+request.getParameter("emon")+"-"+request.getParameter("eday")+"',now())";
		dbBean.setQuery(query1);
		dbBean.go1();
		strAllQuery += "<hr>"+query1;
	}
}

	
String returnurl = "map_banner.jsp?id="+request.getParameter("bid")+"&msg=Banner%20mapping%20updated";


String actype = "1";
String acmsg = "BannerMapped";
String acdescription = request.getParameter("bid") +" mapped ";
String acSqlQuery = strAllQuery;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>