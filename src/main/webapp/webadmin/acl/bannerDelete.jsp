<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" import="javax.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>
<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String strMSG="";
	String refNo="";
	if(request.getParameter("ref")!=null){
		refNo = request.getParameter("ref");
	}
 try{       if(!refNo.trim().equals("")){
        PreparedStatement ps = null;
        ResultSet rs=null;
        String query = "SELECT image_file FROM cms_banner WHERE id=?";
        ps=cn.prepareStatement(query);
        ps.setString(1,refNo);
  	    rs = ps.executeQuery();
  	    if(rs.next()){
  	    	String name_pic = rs.getString(1);
  	    	String p = this.getServletContext().getRealPath("/images")+File.separator+name_pic;
        	File file = new File(p);
        	 if (!file.isDirectory()){
        		file.delete();
        	 }
        	   query = "Update cms_banner SET image_file='', image_name='', mach_name='', mach_desc='', modified_on=now() WHERE id=?";
               ps=cn.prepareStatement(query);
         	   ps.setString(1,refNo);
         	   ps.executeUpdate();
         	   strMSG = "1";
  	    }else{
  	    	
  	    	   strMSG = "2";
         	  
        }
}
 }catch (Exception ex) {
        ex.printStackTrace();
        strMSG = "2";
    }
 %>
 <%@ include file="../../dbConn/dbClose.jsp" %>
 <%response.sendRedirect("siteConfig.jsp?strMSG="+strMSG);
 }%>