<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" import="jakarta.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>
<%
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}else{
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String strMSG="";
	String label="";
	String refNo="";
	String des="";
	String fileName ="";
    String fFileName[] = new String[2];
    Calendar calNow = Calendar.getInstance();
    long lTime = calNow.getTimeInMillis();
    String strTime = Long.toString(lTime);
    refNo = strTime;
    strTime = "" + strTime + "_";
    String fContentType = "";
    String fSFileName = "";
    String newFileName[] = new String[2];
    long fSize = 0;
    int count = 0;
    String path = "";
    int isfileuploaded = 0;
    int fileExists = 0;
    try {
        System.out.println("CONTENT-LENGHT123" + request.getContentLength());
        String sessId = session.getId();
        DiskFileUpload fu = new DiskFileUpload();
        fu.setSizeMax(999999999);
        fu.setSizeThreshold(4096);
        fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
        List fileItems = fu.parseRequest(request);
        Iterator i = fileItems.iterator();

        System.out.println("testing111111-LENGHT123" );
        String name_pic= "";
        while (i.hasNext()) {
            FileItem item = (FileItem) i.next();
            if (item.isFormField()) {
                String name = item.getFieldName();
                String value = item.getString();
                if (name.equals("label")) {
					label = value;
				}  
                if(name.equals("des")){
                	des = value;
                }
                if(name.equals("refNo")){
                	refNo = value;
                }
            } else if (!item.isFormField()) {
                String fieldName = item.getFieldName();
                System.out.println(fieldName + "-----");
                String pattern = "^(?=.*[^a-zA-Z0-9_]).{1,50}$";
                fileName = item.getName();
                if(!fileName.equals("")){
                int lastdot = fileName.lastIndexOf(".");
            	int firstdot = fileName.indexOf(".");
            	String file = fileName.substring(0, lastdot);
            	String ext = fileName.substring(firstdot+1);
                fContentType = item.getContentType();
                if (!item.getString().equals("") && item.getString() != null&& (fContentType.equals("image/jpeg")||fContentType.equals("image/png")) && (ext.toLowerCase().equals("jpg")||ext.toLowerCase().equals("jpeg")||ext.toLowerCase().equals("png")) && !Pattern.matches(pattern, file)) {
                	fileExists = 1;
                    isfileuploaded = 1;
                    boolean isInMemory = item.isInMemory();
                    fSize = item.getSize();
                    File tmpFile = new File(fileName);
                    String strFileArray[] = tmpFile.getName().split("\\\\");
                    fFileName[count] = strTime + strFileArray[strFileArray.length - 1];
                    newFileName[count] = application.getRealPath("/images")
                            + File.separator + strTime + strFileArray[strFileArray.length - 1];
                    path = newFileName[0];
                    item.write(new File(newFileName[count]));
                    if (fFileName[count] != null && !fFileName[count].equals("")) {
                        fFileName[count] = "" + fFileName[count];
                     name_pic = fFileName[count];
                    }
                    count++;
                }
            }}
        }
        PreparedStatement ps = null;
        if(!label.equals("")&&!des.equals("")){
        if(fileExists==1){
        	ResultSet rs= null;
        	String query = "SELECT image_file FROM cms_banner WHERE id = ?";
        	ps = cn.prepareStatement(query);
        	ps.setString(1,refNo);
        	rs = ps.executeQuery();
        	query = "UPDATE cms_banner SET mach_name=?, mach_desc=?, image_file=?, image_name=?,modified_on=now() WHERE id = ?";
        	ps = cn.prepareStatement(query);
        	ps.setString(1,label);
        	ps.setString(2,des);
        	ps.setString(3,name_pic);
        	ps.setString(4,fileName);
        	ps.setString(5,refNo);
        	ps.executeUpdate();
        	if(rs.next()){
        		String old_file = rs.getString(1);
        		if(!old_file.trim().equals("")){
       	    	String p = application.getRealPath("/images")+File.separator+old_file;
             	File file = new File(p);
             	 if (!file.isDirectory()){
             		file.delete();
             	 }
        	}
        	}
        	response.getWriter().write("1#"+refNo+"#"+name_pic);
        }else{
        	String query = "UPDATE cms_banner SET mach_name=?, mach_desc=?,modified_on=now() WHERE id = ?";
        	ps = cn.prepareStatement(query);
        	ps.setString(1,label);
        	ps.setString(2,des);
        	ps.setString(3,refNo);
        	ps.executeUpdate();
        	response.getWriter().write("2#");
        }
        }else{
        	response.getWriter().write("3#");
        }
} catch (Exception ex) {
        ex.printStackTrace();
        response.getWriter().write("3#");
    }
    %>
    <%@ include file="../../dbConn/dbClose.jsp" %>
    <%}%>