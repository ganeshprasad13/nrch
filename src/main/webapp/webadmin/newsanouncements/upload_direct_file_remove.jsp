<%@ include file="../../../dbConn/dbsettings.jsp" %>
<% 
String lang=(String)session.getAttribute("langid");
if(lang!=null){
	if(lang.equals("")){
		lang = "0";
	}
}else{
	lang = "0";
}
Vector filesUploaded = (Vector)session.getAttribute("fileDirectUploaded");
if (filesUploaded==null) {
	filesUploaded = new Vector();
}
String fileId = request.getParameter("id");
int intFileId = Integer.parseInt(fileId);
filesUploaded.remove(intFileId);
response.sendRedirect("upload_direct_file.jsp?langid="+lang);
%>
