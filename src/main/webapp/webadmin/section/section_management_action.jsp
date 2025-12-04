<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
String strAllQuery = "";
//insert data into table for creating a new section
String acmore = "";
String section = "";
String query_info = "";
String updateinfo = "";


String strLbl0 = request.getParameter("label0");
String strDesc0 = request.getParameter("description0");

	strDesc0 = strDesc0.replaceAll("'s","&rsquo;s");
	strDesc0 = strDesc0.replaceAll("'","&#0146;");


	strLbl0 = strLbl0.replaceAll("'s","&rsquo;s");
	strLbl0 = strLbl0.replaceAll("'","&#0146;");


	section = "INSERT INTO CMS_SECTION_MANAGEMENT ";
	section = section + "(DSM_TYPE, DSM_PRIORITY, DSM_RIGHT,";
	section = section + "DSM_PARENT, DSM_CREATED_BY,DSM_THEME,DSM_OPEN_NEW,DSM_CREATED_DATE) VALUES ";
	section = section + "( ?, ?,?, ";
	section = section + " ?, ?, ?,?,now())";
	PreparedStatement ps = cn.prepareStatement(section);
	ps.setString(1,request.getParameter("type"));
	ps.setString(2,request.getParameter("selpriority"));
	ps.setString(3,request.getParameter("right"));
	ps.setString(4,request.getParameter("parent"));
	ps.setString(5,(String)session.getAttribute("DBAusername"));
	ps.setString(6,request.getParameter("theme"));
	ps.setString(7,request.getParameter("openinnewwindow"));
	ps.executeUpdate();
	
	strAllQuery += section;	
	
	query_info = "SELECT MAX(DSM_ID) FROM CMS_SECTION_MANAGEMENT WHERE ";
	query_info = query_info + " DSM_PARENT = ?";
	PreparedStatement ps1 = cn.prepareStatement(query_info);
	ps1.setString(1,request.getParameter("parent"));
	ResultSet rs1 = ps1.executeQuery();
	strAllQuery += "<hr>"+ query_info;
	String maxDsmId = "";
if(rs1.next()){
	maxDsmId=rs1.getString(1);
}
// added for giving edit rigets for this new section.
	if(!session.getAttribute("DBAacc").equals("100")){
		String strInsertQuery = "insert into CMS_ACL (ACL_USER_ID, ACL_SECTION_ID, ACL_SECTION_TYPE, ACL_INFO,ACL_CREATION_DATE) values (?,?,0,'999',now())";
		PreparedStatement ps2 = cn.prepareStatement(strInsertQuery);
		ps2.setString(1,(String)session.getAttribute("DBAusername"));
		ps2.setString(2,maxDsmId);
		ps2.executeUpdate();
		strAllQuery += "<hr>"+ strInsertQuery;
	}

	updateinfo = "UPDATE CMS_SECTION_MANAGEMENT SET DSM_PATH = ";
	updateinfo = updateinfo + " ? ";
	updateinfo = updateinfo + " WHERE DSM_ID = ?";
	PreparedStatement ps3 = cn.prepareStatement(updateinfo);
	ps3.setString(1,request.getParameter("path")+","+maxDsmId);
	ps3.setString(2,maxDsmId);
	ps3.executeUpdate();

	strAllQuery += "<hr>"+ updateinfo;

	updateinfo = "INSERT INTO CMS_LANGUAGE_CONTENT (DLC_DSM_ID, DLC_LANG_ID, DLC_LABEL, DLC_DESCRIPTION,DLC_CREATED_BY,DLC_CREATED_DATE) VALUES (?,0,?,?,?,now())";
	PreparedStatement ps4 = cn.prepareStatement(updateinfo);
	ps4.setString(1,maxDsmId);
	ps4.setString(2,strLbl0);
	ps4.setString(3,strDesc0);
	ps4.setString(4,(String)session.getAttribute("DBAusername"));
	ps4.executeUpdate();
	
	strAllQuery += "<hr>"+ updateinfo;

	String returnurl = "section_management.jsp?path="+request.getParameter("path")+"&parent="+request.getParameter("parent")+"&msg=Section%20created";

String actype = "0";
String acmsg = "SectionCreate";
String acdescription = strLbl0 +" created under parent "+strDesc0 ;
String acSqlQuery = strAllQuery;
%>
<%@ include file="../createlog.jsp" %>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% 
	response.sendRedirect(returnurl);
%>