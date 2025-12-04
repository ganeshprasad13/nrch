<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page language="java" import="javax.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*" %>
<%!
	public String formatDate(String strDate){
		String strReturn = "";
		if(strDate == null || "".equals(strDate.trim())){ 
			return strReturn;
		}
		String strTemp[] = strDate.split("-");
		strReturn = (strTemp[2]+"-"+strTemp[1]+"-"+strTemp[0]);
		return strReturn;
	}
%>
<%!
	public String formatDate1(String strDate,String strDate1){
		String strReturn = "";
		if(strDate == null || "".equals(strDate.trim())){ 
			return strReturn;
		}
		String strTemp[] = strDate.split("-");
		strReturn = (strTemp[2]+"-"+strTemp[1]+"-"+strTemp[0])+" "+strDate1+":00";
		return strReturn;
	}
%>
<%
String User = "";
if(session.getAttribute("DBAusername") != null){
	User = (String)session.getAttribute("DBAusername");
}
String Tender_id ="";
String TenderNo ="" ;
String TenTitleEng ="" ;
String TenTitleHin = "";
String TenDescEng = "";
String TenDescHin = "";
String TenOpenDate = "";
String TenCloseDate = "";
String TenOpenTime = "";
String TenCloseTime = "";
String Amount = "";
String Margin = "";
String TimeLimit = "";
String DocumentColl = "";
String DocumentColl1 = "";
String DocumentSubmi = "";
String DocumentSubmi1 = "";
String strMSG = "Record Added Successfully";
String logCount= "";
int isfileuploaded = 0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
String fContentType = "";
String fFileName[] = new String[11];
String fSFileName = "";
String newFileName[] = new String[11];
long fSize =0;
int count =0;

try {
	System.out.println("CONTENT-LENGHT" +  request.getContentLength());
	String sessId = session.getId();
	DiskFileUpload fu = new DiskFileUpload();
	fu.setSizeMax(999999999);
	fu.setSizeThreshold(4096);
	fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();
	while(i.hasNext()){
		FileItem item = (FileItem)i.next();
		if (item.isFormField()) {
			String name = item.getFieldName();
			String value = item.getString();
			
			if (name.equals("TenderNo")){
				 TenderNo  = value.replaceAll("'","''");
			}
			if (name.equals("TenTitleEng")){
				 TenTitleEng  = value.replaceAll("'","''");
			}
			if (name.equals("TenTitleHin")){
				 TenTitleHin  = value.replaceAll("'","''");
			}
			if (name.equals("TenDescEng")){
				 TenDescEng = value.replaceAll("'","''");
			}
			
			if (name.equals("TenDescHin")){
				 TenDescHin = value.replaceAll("'","''");
			}
			if (name.equals("TenOpenDate")){
				 TenOpenDate = value.replaceAll("'","''");
			}
			if (name.equals("TenCloseDate")){
				 TenCloseDate = value.replaceAll("'","''");
			}
			if (name.equals("TenOpenTime")){
				 TenOpenTime = value.replaceAll("'","''");
			}
			if (name.equals("TenCloseTime")){
				 TenCloseTime = value.replaceAll("'","''");
			}
			if (name.equals("Amount")){
				 Amount = value.replaceAll("'","''");
			}
			if (name.equals("Margin")){
				 Margin = value.replaceAll("'","''");
			}
			if (name.equals("TimeLimit")){
				 TimeLimit = value.replaceAll("'","''");
			}
			if (name.equals("Tender_id")){
				Tender_id  = value.replaceAll("'","''");
			}
			if (name.equals("DocumentColl")){
				 DocumentColl = value.replaceAll("'","''");
			}
			if (name.equals("DocumentColl1")){
				 DocumentColl1 = value.replaceAll("'","''");
			}
			if (name.equals("DocumentSubmi")){
				 DocumentSubmi = value.replaceAll("'","''");
			}
			if (name.equals("DocumentSubmi1")){
				 DocumentSubmi1 = value.replaceAll("'","''");
			}
		}else if (!item.isFormField()){        
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (item.getString()!=null){
				if(item.getString().equals("")){
					count++;
				}else{
					isfileuploaded = 1;
					String fileName = item.getName();
					fContentType = item.getContentType();
					boolean isInMemory = item.isInMemory();
					fSize = item.getSize();
					File tmpFile = new File(fileName);
					String strFileArray[] = tmpFile.getName().split("\\\\");
					fFileName[count] = strTime+strFileArray[strFileArray.length-1];
					newFileName[count] = this.getServletContext().getRealPath(""+Hname+"/tender") + 
					File.separator  +strTime+strFileArray[strFileArray.length-1];
					//out.print(newFileName + "<br/>");
					item.write(new File(newFileName[count]));
					if(fFileName[count]!=null && !fFileName[count].equals("")){
						fFileName[count]=""+fFileName[count];
					}
					count++;
				}
			}
		}
	}                                   // end of While
}catch (Exception ex) {
	ex.printStackTrace();
	out.print(""+"inside"+ex.getMessage());
}
try {
	
	String NoticeQuery="";
	float convertinlaks = 0;
    try
    {
    	if (Amount == null || Amount.equals("")){
                 convertinlaks =0 ;
        }else{
                convertinlaks = Float.parseFloat(Amount);
                convertinlaks = convertinlaks / 100000;
         }
    }
    catch(Exception ex){
		out.println("Found some error : "+ex.getMessage());
    }
 	if (Margin==null || Margin.equals("")){
        Margin = "0";
    }
    if (TimeLimit==null || TimeLimit.equals("")){
        TimeLimit = "0";
    }
	String hindiTempTi = "";
	for(count=0;count<TenTitleHin.length();count++)	{
		hindiTempTi +="&#"+(int)TenTitleHin.charAt(count)+";";
	}TenTitleHin = hindiTempTi;
	
	String hindiTempDesc = "";
	for(count=0;count<TenDescHin.length();count++)	{
		hindiTempDesc +="&#"+(int)TenDescHin.charAt(count)+";";
	}TenDescHin = hindiTempDesc;
	TenOpenDate = formatDate(TenOpenDate);
	TenCloseDate = formatDate(TenCloseDate);
	DocumentColl = formatDate1(DocumentColl,DocumentColl1);
	DocumentSubmi = formatDate1(DocumentSubmi,DocumentSubmi1);
	if(fFileName[0] != null && !fFileName[0].equals("") && fFileName[10] != null && !fFileName[10].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE_ENG='"+fFileName[0]+"', FILE_HINDI='"+fFileName[10]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	else if(fFileName[0] != null && !fFileName[0].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE_ENG='"+fFileName[0]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	else if(fFileName[10] != null && !fFileName[10].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE_HINDI='"+fFileName[10]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[1] != null && !fFileName[1].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE2='"+fFileName[1]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[2] != null && !fFileName[2].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE3='"+fFileName[2]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[3] != null && !fFileName[3].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE4='"+fFileName[3]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[4] != null && !fFileName[4].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE5='"+fFileName[4]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[5] != null && !fFileName[5].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE6='"+fFileName[5]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[6] != null && !fFileName[6].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE7='"+fFileName[6]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[7] != null && !fFileName[7].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE8='"+fFileName[7]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[8] != null && !fFileName[8].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE9='"+fFileName[8]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	if(fFileName[9] != null && !fFileName[9].equals("")){
		NoticeQuery = "UPDATE CMS_TENDER_MASTER_NEW SET FILE10='"+fFileName[9]+"',MODIFIED_BY='"+User+"',MODIFIED_ON=NOW() WHERE ID = "+Tender_id+"";
		dbBean.setQuery(NoticeQuery);
		dbBean.go1();
		logCount +=NoticeQuery+"<hr>";
	}
	out.print(logCount);
	String actype = "0";
	String acmsg = "EditTender";
	String acdescription =  session.getAttribute("DBAUserId") + " login for Edit Tender information ";
	String acSqlQuery = logCount;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Updated Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("searchTender.jsp?strMSG="+strMSG+"");%>




