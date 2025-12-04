<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String strAllQuery = "";

String section = "";
String strLbl0 = request.getParameter("label0");
String strdescription0 = request.getParameter("description0");

String strQueryHistory = "";

	section = "UPDATE CMS_SECTION_MANAGEMENT ";
	section = section + " SET DSM_PRIORITY=?, DSM_RIGHT=?,DSM_MODIFIED_BY =?,DSM_MODIFIED_DATE=now(),DSM_THEME=?,DSM_OPEN_NEW=?";
	section = section + " WHERE DSM_ID = ?";
	PreparedStatement ps = cn.prepareStatement(section);
	ps.setString(1,request.getParameter("priority"));
	ps.setString(2,request.getParameter("right"));
	ps.setString(3,(String)session.getAttribute("DBAusername"));
	ps.setString(4,request.getParameter("theme"));
	ps.setString(5,request.getParameter("openinnewwindow"));
	ps.setString(6,request.getParameter("id"));
	ps.executeUpdate();
	strAllQuery += "<hr>"+section;
//out.print(section);
	
	strQueryHistory = "INSERT INTO CMS_LANGUAGE_CONTENT_HISTORY (DLCH_DLC_ID, DLCH_DSM_ID, DLCH_LANG_ID, DLCH_LABEL, DLCH_DESCRIPTION, DLCH_CREATED_BY, DLCH_CREATED_DATE, DLCH_MODIFIED_BY, DLCH_MODIFIED_DATE, DLCH_DESCRIPTION1, DLCH_Createby) SELECT DLC_ID, DLC_DSM_ID, DLC_LANG_ID, DLC_LABEL, DLC_DESCRIPTION, DLC_CREATED_BY, DLC_CREATED_DATE, DLC_MODIFIED_BY, DLC_MODIFIED_DATE, DLC_DESCRIPTION1,? AS CREATEUSER FROM CMS_LANGUAGE_CONTENT WHERE DLC_ID = ?";
	PreparedStatement ps1 = cn.prepareStatement(strQueryHistory);
	ps1.setString(1,(String)session.getAttribute("DBAusername"));
	ps1.setString(2,request.getParameter("id0"));
	ps1.executeUpdate();
String updateinfo = "UPDATE CMS_LANGUAGE_CONTENT SET DLC_LABEL = ?,  DLC_DESCRIPTION=?,DLC_MODIFIED_BY=?,DLC_MODIFIED_DATE=now() WHERE DLC_ID = ?";
PreparedStatement ps2 = cn.prepareStatement(updateinfo);
ps2.setString(1,strLbl0);
ps2.setString(2,strdescription0);
ps2.setString(3,(String)session.getAttribute("DBAusername"));
ps2.setString(4,request.getParameter("id0"));
ps2.executeUpdate();	
	strAllQuery += "<hr>"+updateinfo;

	String returnurl = "section_edit.jsp?path="+request.getParameter("path")+"&id="+request.getParameter("id")+"&msg=Section%20Updated%20Successfully";

String actype = "1";
String acmsg = "SectionEdit";
String acdescription = strLbl0+" Modified, <hr> under parent "+request.getParameter("path")+" And section ID ="+request.getParameter("id");
String acSqlQuery = strAllQuery;
%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
	response.sendRedirect(returnurl);
%>