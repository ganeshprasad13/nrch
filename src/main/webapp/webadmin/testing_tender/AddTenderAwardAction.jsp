<%@ include file="../../dbConn/dbInit.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
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
<%
String Division_id="";
String Department_id = "";
String Tender_id="";
String Description_Eng="";
String Description_Hin="";
String Name="";
String Awarded_On="";
String Closed_On ="";
String Cost = "";
String BillStatus = "";
String HVT = "0";
String User = "";
String strMSG = "";
int isfileuploaded = 0;
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = ""+strTime+"_";
String fContentType = "";
String fFileName[] = new String[1];
String fSFileName = "";
String newFileName[] = new String[1];
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
			if (name.equals("HVT")){
				HVT  = value.replaceAll("'","''");
			}
			if (name.equals("Description_Eng")){
				 Description_Eng  = value.replaceAll("'","''");
			}	
			if (name.equals("Description_Hin")){
				 Description_Hin  = value.replaceAll("'","''");
			}
			if (name.equals("Awarded_On")){
				 Awarded_On  = value.replaceAll("'","''");
			}
			if (name.equals("Closed_On")){
				 Closed_On  = value.replaceAll("'","''");
			}
			if (name.equals("Cost")){
				 Cost  = value.replaceAll("'","''");
			}
			if (name.equals("BillStatus")){
				 BillStatus  = value.replaceAll("'","''");
			}
			if (name.equals("Division_id")){
				Division_id  = value.replaceAll("'","''");
			}
			if (name.equals("Department_id")){
				Department_id  = value.replaceAll("'","''");
			}
			if (name.equals("Tender_id")){
				Tender_id  = value.replaceAll("'","''");
			}			
		}else if (!item.isFormField()){        
			String fieldName = item.getFieldName();
			out.println(fieldName+"-----");
			if (!item.getString().equals("") && item.getString()!=null){
				isfileuploaded = 1;
				String fileName = item.getName();
				fContentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				fSize = item.getSize();
				File tmpFile = new File(fileName);
				String strFileArray[] = tmpFile.getName().split("\\\\");
				fFileName[count] = strTime+strFileArray[strFileArray.length-1];
				newFileName[count] = this.getServletContext().getRealPath("/"+Hname+"/award") + 
				File.separator  +strTime+strFileArray[strFileArray.length-1];
				//out.print(newFileName + "<br/>");
				item.write(new File(newFileName[count]));
				if(fFileName[count]!=null && !fFileName[count].equals("")){
					fFileName[count]=""+fFileName[count];
				}
				count++;
			}
		}
	}                                   // end of While
}catch (Exception ex) {
	ex.printStackTrace();
	out.print(""+"inside"+ex.getMessage());
}
try {

	
	String hindiTempDesc = "";
	for(int count1=0;count1<Description_Hin.length();count1++)	{
		hindiTempDesc +="&#"+(int)Description_Hin.charAt(count1)+";";
	}Description_Hin = hindiTempDesc;
	Awarded_On = formatDate(Awarded_On);
	Closed_On = formatDate(Closed_On);
	String AwardQuery = "";
		AwardQuery = "INSERT INTO CMS_TENDER_AWARD_NEW (TENDER_ID,DESCRIPTION_ENG,AWARDED_TO,AWARDED_ON,COST,CREATED_BY, CREATED_ON,DESCRIPTION_HIN,STATUS,DIV_ID,DEPT_ID,CLOSED_ON, BILL_STATUS,HIGH_VALUE_TENDER,FILE_ENG)";
		AwardQuery+= "VALUES("+Tender_id+",'"+Description_Eng+"','"+Name+"','"+Awarded_On+"','"+Cost+"','"+User+"',NOW(),'"+Description_Hin+"','Active',"+Division_id+","+Department_id+",'"+Closed_On+"','"+BillStatus+"',"+HVT+",'"+fFileName[0]+"')";
	
	dbBean.setQuery(AwardQuery);
	dbBean.go1();
	
	String actype = "0";
	String acmsg = "AddNewTenderAwarded";
	String acdescription =  session.getAttribute("DBAUserId") + " login for add New Tender Awarded information ";
	String acSqlQuery = AwardQuery;
	%>
	<%@ include file="../createlog.jsp" %>
<%
	strMSG = "Record Added Successfully";
}catch (Exception ex) {
	out.println("Found some error : "+ex);
}
%>
<%@ include file="../../dbConn/dbClose.jsp" %>
<% response.sendRedirect("TenderAward.jsp?strMSG="+strMSG+"");%>