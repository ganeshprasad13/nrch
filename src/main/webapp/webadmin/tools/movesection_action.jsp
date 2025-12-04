<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%


Vector getleve0 = new Vector();
String query_leve0;
query_leve0 = "SELECT count(*) FROM CMS_SECTION_MANAGEMENT where  DSM_PATH like '%,"+request.getParameter("movethis")+",%' and DSM_ID = "+request.getParameter("under") ;
dbBean.setQuery(query_leve0);
getleve0=(Vector)dbBean.go();

if(!dbBean.getcell(getleve0,0,0).equals("0")){
%>
<br><br>
<div align="center">Can Not Move Parent section inside Child section.<br>Please Go <a href="javascript:history.back();">back</a> and edit</div>

<%@ include file="../../dbConn/dbClose.jsp" %>
<%
}else{
%>


<%


Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_PATH FROM CMS_SECTION_MANAGEMENT where  DSM_ID="+request.getParameter("under") ;
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();

String setrelpacewith = dbBean.getcell(getlevel,0,0);


Vector getleve2 = new Vector();
String query_leve2;
query_leve2 = "SELECT DSM_PATH FROM CMS_SECTION_MANAGEMENT where  DSM_id=(SELECT DSM_PARENT from CMS_SECTION_MANAGEMENT where  DSM_ID = "+request.getParameter("movethis")+")" ;
dbBean.setQuery(query_leve2);
getleve2=(Vector)dbBean.go();

String setreplacethis = dbBean.getcell(getleve2,0,0);


Vector getleve3 = new Vector();
String query_leve3;
query_leve3 = "SELECT DSM_PATH FROM CMS_SECTION_MANAGEMENT where  DSM_ID="+request.getParameter("movethis") ;
dbBean.setQuery(query_leve3);
getleve3=(Vector)dbBean.go();

String setfindwith = dbBean.getcell(getleve3,0,0);

String query1 = "update  CMS_SECTION_MANAGEMENT set DSM_PARENT =  "+request.getParameter("under")+",DSM_PATH='"+setrelpacewith+","+request.getParameter("movethis")+"' where DSM_ID = "+request.getParameter("movethis");
dbBean.setQuery(query1);
dbBean.go1();


query1 = "update  CMS_SECTION_MANAGEMENT set DSM_PATH=REPLACE(DSM_PATH,'"+setreplacethis+"','"+setrelpacewith+"') where DSM_PATH like '"+setfindwith+"%'";
dbBean.setQuery(query1);
dbBean.go1();


%>
<%=setrelpacewith%>
<%=setreplacethis%>
<%=setfindwith%>

<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	String returnurl = "movesection.jsp?msg=Section%20has%20been%20moved.";
	response.sendRedirect(returnurl);
%>

<%}%>