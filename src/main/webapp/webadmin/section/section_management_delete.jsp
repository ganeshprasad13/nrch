<%@ include file="../../dbConn/dbInit.jsp" %>


<% // For delete Corrigendum
String strComMess ="";
String id = request.getParameter("id");
String path = request.getParameter("path");
String parent = request.getParameter("parent");
String path1 = path.substring(0,path.lastIndexOf(parent)-1);
String parent1 = path1.substring(path1.lastIndexOf(",")+1);
String forwardUrl = "";
	if(id !=null && path !=null && parent !=null ){
	Vector getInfo = new Vector();
		String strTenderDelete = "SELECT DSM_ID  FROM CMS_SECTION_MANAGEMENT  WHERE DSM_PARENT = "+parent+"";
		dbBean.setQuery(strTenderDelete);
		getInfo =(Vector)dbBean.go();
		if(getInfo.size() > 0){
			forwardUrl = "section_management.jsp?parent="+parent+"&path="+path+"&error=1";
		}else{
			strTenderDelete = "DELETE FROM CMS_SECTION_MANAGEMENT WHERE DSM_ID = "+id+"";
			dbBean.setQuery(strTenderDelete);
			dbBean.go1();
			strComMess = "Record Deleted Successfully";
			forwardUrl = "section_management.jsp?parent="+parent1+"&path="+path1+"&msg=section Deleted Successfully";
			String actype = "0";
			String acmsg = "DeleteSubSection";
			String acdescription =  session.getAttribute("DBAusername") + " login for Delete sub section ";
			String acSqlQuery = strTenderDelete;
	%>
	<%@ include file="../createlog.jsp" %>
<%}
}%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<%response.sendRedirect(forwardUrl);%>