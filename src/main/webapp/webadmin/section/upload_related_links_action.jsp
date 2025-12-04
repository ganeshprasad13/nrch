<%@ page language="java" import="jakarta.servlet.*,java.util.*,java.io.*,org.apache.commons.fileupload.*" %>

<%@ include file="../../dbConn/dbInit.jsp" %>
<% 
String lang=(String)session.getAttribute("langid");
if(lang!=null){
	if(lang.equals("")){
		lang = "0";
	}
}else{
	lang = "0";
}
%>

<%

String DSM_RELATED_LINKS_other = "-1";
if (request.getParameter("DSM_RELATED_LINKS_other")!=null){
if (!request.getParameter("DSM_RELATED_LINKS_other").equals("")){

String[] col10_t = request.getParameterValues("DSM_RELATED_LINKS_other");

	for (int m=0;m<(col10_t.length);m++)  {
	if (m == 0) 
	{
	DSM_RELATED_LINKS_other = col10_t[m];
	}
	else
	{DSM_RELATED_LINKS_other = DSM_RELATED_LINKS_other + ',' + col10_t[m];}
	}

}
}

String DSM_RELATED_LINKS = "-1";
if (request.getParameter("DSM_RELATED_LINKS")!=null){
if (!request.getParameter("DSM_RELATED_LINKS").equals("")){

String[] col10_t = request.getParameterValues("DSM_RELATED_LINKS");

	for (int m=0;m<(col10_t.length);m++)  {
	if (m == 0) 
	{
	DSM_RELATED_LINKS = col10_t[m];
	}
	else
	{DSM_RELATED_LINKS = DSM_RELATED_LINKS + ',' + col10_t[m];}
	}

}
}

String section = "UPDATE CMS_SECTION_MANAGEMENT set DSM_RELATED_LINKS = '"+DSM_RELATED_LINKS+"', DSM_RELATED_LINKS2='"+DSM_RELATED_LINKS_other+"'";
section = section + " WHERE DSM_ID = "+request.getParameter("id");
dbBean.setQuery(section);
dbBean.go1();


%>


<%//=htFileProps.toString()%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%response.sendRedirect("upload_related_links_msg.jsp?lang="+lang+"&secRel="+DSM_RELATED_LINKS+"&secRel2="+DSM_RELATED_LINKS_other);%>
</body>
</html>




