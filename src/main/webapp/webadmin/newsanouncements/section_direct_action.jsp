<% 
if(session.getAttribute("DBAusername")== null){
	response.sendRedirect("../index.jsp?msg=Invalid%20Session");
}
%>
<%@ include file="../../dbConn/dbInit.jsp" %>
<%
int fla ;

String id="";
String label0="";
String description0="";
String syear="";
String smon="";
String sday="";
String eyear="";
String emon="";
String eday = "";
String addtoticker = "";
String label1="";
String description1 = "";
String filelabel = "";
String filelabe2 = "";
String strRight="0";

String pubOfficerId = "0";
String pubCity = "";
String pubNewsNo = "";

String fSize = "";
String fContentType = "";
String fFileName = "";
String fSFileName = "";
int status = 0;

String DDC_TENDERNO = "";
String DDC_DIVISIONS_ID = "";
String DDC_DEPARTMENTS_ID = "";

//getting current ts in ms
Calendar calNow = Calendar.getInstance();
long lTime = calNow.getTimeInMillis();
String strTime = Long.toString(lTime);
strTime = strTime + session.getId();

id = request.getParameter("id");
label0 = request.getParameter("label0");
label0 = label0.replaceAll("'", "''");
description0 = request.getParameter("description0").replaceAll("'", "''");
syear = request.getParameter("syear");
smon = request.getParameter("smon");
sday = request.getParameter("sday");
eyear = request.getParameter("eyear");
emon = request.getParameter("emon");
eday = request.getParameter("eday");
addtoticker = request.getParameter("addtoticker");
label1 = request.getParameter("label1").replaceAll("'", "''");
description1 = request.getParameter("description1").replaceAll("'", "''");
strRight = request.getParameter("right");

if(request.getParameter("pubOfficerId") != null && !request.getParameter("pubOfficerId").equals("")){
	pubOfficerId = request.getParameter("pubOfficerId");
}if(request.getParameter("pubCity") != null && !request.getParameter("pubCity").equals("")){
	pubCity = request.getParameter("pubCity").replaceAll("'", "''");
}if(request.getParameter("pubNewsNo") != null && !request.getParameter("pubNewsNo").equals("")){
	pubNewsNo = request.getParameter("pubNewsNo").replaceAll("'", "''");
}

if(request.getParameter("TenderNo")!=null){
DDC_TENDERNO = request.getParameter("TenderNo").replaceAll("'", "''");
DDC_DIVISIONS_ID = request.getParameter("Divisions").replaceAll("'", "''");
DDC_DEPARTMENTS_ID = request.getParameter("Departments");
}else{
DDC_TENDERNO = "";
DDC_DIVISIONS_ID = "0";
DDC_DEPARTMENTS_ID = "0";
}
		
//insert data into table for creating a new section

String updateinfo;

updateinfo = "INSERT INTO CMS_DIRECT_CONTENT (DDC_DSM_ID, DDC_LANG_ID, DDC_LABEL,DDC_RIGHT, DDC_DESCRIPTION, DDC_START_DATE, DDC_END_DATE, DDC_CREATED_BY,DDC_ADDTO_TICKER,DDC_IDENTIFIER,DDC_TENDERNO,DDC_DIVISIONS_ID,DDC_DEPARTMENTS_ID,DDC_CREATED_DATE,DDC_OFFICER_ID,DDC_PRESS_CITY,DDC_PRESS_NEWS_NO) VALUES ("+id+",0,'"+label0+"',"+strRight+ ",'"+description0+"','"+syear+"-"+smon+"-"+sday+"','"+eyear+"-"+emon+"-"+eday+"','"+session.getAttribute("DBAusername")+"',"+addtoticker+",'"+strTime+"','"+DDC_TENDERNO+"',"+DDC_DIVISIONS_ID+","+DDC_DEPARTMENTS_ID+",now(),'"+pubOfficerId+"','"+pubCity+"','"+pubNewsNo+"')";
dbBean.setQuery(updateinfo);
dbBean.go1();
//out.println(updateinfo+"<hr>");
Vector getddc_id = new Vector();
String queryddc_id="0";


//description1 = new  String(description1.getBytes("ISO-8859-1"),"UTF-8"); 
//label1 = new  String(label1.getBytes("ISO-8859-1"),"UTF-8"); 

updateinfo = "INSERT INTO CMS_DIRECT_CONTENT (DDC_DSM_ID, DDC_LANG_ID, DDC_LABEL,DDC_RIGHT, DDC_DESCRIPTION, DDC_START_DATE, DDC_END_DATE, DDC_CREATED_BY,DDC_ADDTO_TICKER,DDC_IDENTIFIER,DDC_TENDERNO,DDC_DIVISIONS_ID,DDC_DEPARTMENTS_ID,DDC_CREATED_DATE,DDC_OFFICER_ID,DDC_PRESS_CITY,DDC_PRESS_NEWS_NO) VALUES ("+id+",1,N'"+label1+"',"+strRight+",N'"+description1+"','"+syear+"-"+smon+"-"+sday+"','"+eyear+"-"+emon+"-"+eday+"','"+session.getAttribute("DBAusername")+"',"+addtoticker+",'"+strTime+"','"+DDC_TENDERNO+"',"+DDC_DIVISIONS_ID+","+DDC_DEPARTMENTS_ID+",now(),'"+pubOfficerId+"','"+pubCity+"','"+pubNewsNo+"')";
dbBean.setQuery(updateinfo);
dbBean.go1();

//out.println(updateinfo+"<hr>");

Vector getddc_idh = new Vector();
String queryddc_idh;

String query;
String query1;
String filefild;
Vector rsfileid = new Vector();

Vector filesUploaded = (Vector)session.getAttribute("fileDirectUploaded");
int count=0;  
//out.print(filesUploaded+"<hr>");
if(filesUploaded!=null) {

//out.print(filesUploaded.size()+"<hr>");
	if (filesUploaded.size()>0) {
	
		for (int i=0;i<filesUploaded.size();i++){	
		//out.print(i+"<hr>");
			Hashtable htFileProps = (Hashtable) filesUploaded.elementAt(i);
			//out.print(htFileProps+"<hr>");
			if(htFileProps!=null) {
				fSize = (String)htFileProps.get("size");
				fContentType = (String)htFileProps.get("contentType");
				fFileName = (String)htFileProps.get("name");
				fSFileName =(String)htFileProps.get("sysName");
				filefild = 	(String)htFileProps.get("lang");
				filelabel = (String)htFileProps.get("label");
				filelabe2 = (String)htFileProps.get("labe2");
				if (filelabel==null) {
					filelabel = "N/A";
				}
				if (filelabe2==null) {
					filelabe2 = "";
				}
				//out.print(filefild+"<hr>");
				if (filefild.equals("0")){
					queryddc_id = "SELECT max(DDC_ID) FROM CMS_DIRECT_CONTENT WHERE DDC_DSM_ID = "+id+" AND DDC_LABEL LIKE '"+label0+"' AND DDC_LANG_ID=0";
					dbBean.setQuery(queryddc_id);
					getddc_id=(Vector)dbBean.go();
					
					query1 = "INSERT INTO CMS_DIRECT_FILE ";
					query1 = query1 + "(DDF_DDC_ID, DDF_USER_FILENAME, DDF_SYS_FILENAME , DDF_FILE_SIZE , DDF_FILE_EXT, DDF_LABEL,DDF_UPLOAD_BY,DDF_DESC,DDF_UPLOAD_DATE) ";
					query1 = query1 + "VALUES ";
					query1 = query1 + "("+ dbBean.getcell(getddc_id,0,0) +",'"+ fFileName +"','"+ fSFileName +"','"+ fSize +"','"+ fContentType +"','"+filelabel+"','"+ session.getAttribute("DBAusername") +"','"+filelabe2+"',now()) ";
						
				}else{
				
					queryddc_idh = "SELECT max(DDC_ID) FROM CMS_DIRECT_CONTENT WHERE DDC_DSM_ID = "+id+" AND DDC_LABEL LIKE '"+label1+"' AND DDC_LANG_ID=1";
					dbBean.setQuery(queryddc_idh);
					getddc_idh=(Vector)dbBean.go();
					
					filelabel = new  String(filelabel.getBytes("ISO-8859-1"),"UTF-8");
					filelabe2 = new  String(filelabe2.getBytes("ISO-8859-1"),"UTF-8");
					query1 = "INSERT INTO CMS_DIRECT_FILE ";
					query1 = query1 + "(DDF_DDC_ID, DDF_USER_FILENAME, DDF_SYS_FILENAME , DDF_FILE_SIZE , DDF_FILE_EXT, DDF_LABEL,DDF_UPLOAD_BY,DDF_DESC,DDF_UPLOAD_DATE) ";
					query1 = query1 + "VALUES ";
					query1 = query1 + "("+ dbBean.getcell(getddc_idh,0,0) +",'"+ fFileName +"','"+ fSFileName +"','"+ fSize +"','"+ fContentType +"',N'"+filelabel+"','"+ session.getAttribute("DBAusername") +"','"+filelabe2+"',now()) ";
				}		
				//out.print("<hr>"+query1);
			dbBean.setQuery(query1);
			dbBean.go1();
			}			
		}
	}
}
session.removeAttribute("fileDirectUploaded");

String returnurl = "section_direct.jsp?id="+id;


String actype = "0";
String acmsg = "DirectContentCreate";
String acdescription = "<hr>"+request.getParameter("description0")+"<hr> direct content created under parent "+request.getParameter("id");
String acSqlQuery = "";
%>
<%@ include file="../createlog.jsp"%>
<%@ include file="../../dbConn/dbClose.jsp" %>

<% 
	response.sendRedirect(returnurl);
%>