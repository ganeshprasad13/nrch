<%int intPageNo =4;%>
<%@ include file="../header/headerInner.jsp" %>
<form name="userLog" action="tenderLog.jsp"  >
<script type="text/javascript" src="js/calendar_us.js"></script>
<script language="javascript" type="text/javascript">    function Validate()
{
var id1=document.getElementById("byDate").value;
var id2=document.getElementById("endDate").value;
if((id1==''&&id2!='')||(id2==''&&id1!='')){
alert("please enter both dates");
return false;
}


}


</script>


<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<link rel="stylesheet" href="../css/thickbox.css" type="text/css" media="screen" />
<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../css/thickbox.js"></script>
<p align="center"><span align="center" class="mgContentTitle"><a href="../reports/report.jsp">Reports</a>&nbsp;&nbsp;&raquo;&nbsp;&nbsp;Tender Download Log</span></p>
<br>
 
 
	<table width="80%" border="1" align="center" class="sample">
		<tr class="tr_bgcolor">
                <td colspan="5" align="center">
                    <b>Search Tender Dowload Log</b>

                </td>
            </tr>
		<tr>
			<td>Notice/Tender No.</td>
			<td> <input type="text" name="tenderNo" value="<%if(request.getParameter("tenderNo") != null){out.print(request.getParameter("tenderNo").replace("`","/").replace("|","&"));}%>"></td>
			<td> Start Date </td>
			<td> <input type="text" name="byDate" id="byDate" value="<%if(request.getParameter("byDate") != null){out.print(request.getParameter("byDate"));}%>"><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'userLog',
                                                 // input name
                                                 'controlname': 'byDate'
                                           });
                    </script>
			</td>
			<td> End Date </td>
			<td> <input type="text" name="endDate" id="endDate" value="<%if(request.getParameter("endDate") != null){out.print(request.getParameter("endDate"));}%>"><script language="JavaScript">
                                            new tcal ({
                                                // form name
                                                'formname': 'userLog',
                                                 // input name
                                                 'controlname': 'endDate'
                                           });
                    </script>
			</td>
			<td><input type="submit" name="sava" value="Search" onclick="javascript:return Validate();"></td>
		</tr>
	</table>
</form>
<br><br> 
<%
	
%>
<%
if(request.getParameter("sava") != null){%>
<%//Anurag
String strten_id="";
String str="";

if(request.getParameter("ten_id") != null ){
strten_id = request.getParameter("ten_id");
str=strten_id;

}


String strGetUserQuery = "select DAU_ID, DAU_LOGIN, DAU_NAME from CMS_ADMIN_USER";
Vector rsGetUser = new Vector();
dbBean.setQuery(strGetUserQuery);
rsGetUser = (Vector)dbBean.go();
String strTenderNo = "";
if(request.getParameter("tenderNo") != null ){
strTenderNo =   request.getParameter("tenderNo").replace("`","/").replace("|","&");

//Anurag Tyagi
	String qry="SELECT ID FROM cms_tender_master_new WHERE TENDER_NO='"+strTenderNo+"'";
	dbBean.setQuery(qry);
	try{
	String rsGetID[][] = dbBean.getResultSet();

	//out.print("Id is"+rsGetID[0][0]);
	strten_id=rsGetID[0][0];
		
	}
	catch(Exception eee){strten_id="";}
	
}

%>
<%
	String strDate = "";
	String lastDate="";
	String condition = "";	
	String strTenderCount="";
	String strTenderDetails="";
	if( request.getParameter("tenderNo").length()==0 ){
		
	 strTenderCount = "SELECT COUNT(*) FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_TENDER_MASTER_NEW as TM,CMS_VENDOR_LOGIN as VL WHERE TM.ID = TDL.TENDER_ID AND VL.VENDOR_ID = TDL.VENDOR_ID AND TENDER_ID IN (SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE TM.ID LIKE '%"+strten_id+"%')";
	 strTenderDetails ="SELECT TM.TENDER_NO,DATE_FORMAT(TDL.DOWNLOAD_DATE,'%d-%m-%Y %H:%i:%s'),VL.VENDOR_NAME,TDL.IP_ADDRESS,TDL.VENDOR_ID FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_TENDER_MASTER_NEW as TM,CMS_VENDOR_LOGIN as VL WHERE TM.ID = TDL.TENDER_ID AND VL.VENDOR_ID = TDL.VENDOR_ID AND TENDER_ID IN (SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE TM.ID LIKE '%"+strten_id+"%')";
	}
	else{
	
	strTenderCount = "SELECT COUNT(*) FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_TENDER_MASTER_NEW as TM,CMS_VENDOR_LOGIN as VL WHERE TM.ID = TDL.TENDER_ID AND VL.VENDOR_ID = TDL.VENDOR_ID AND TENDER_ID IN (SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE TM.ID = '"+strten_id+"')";
	 strTenderDetails ="SELECT TM.TENDER_NO,DATE_FORMAT(TDL.DOWNLOAD_DATE,'%d-%m-%Y %H:%i:%s'),VL.VENDOR_NAME,TDL.IP_ADDRESS,TDL.VENDOR_ID FROM CMS_TENDER_DOWNLOAD_LOG as TDL,CMS_TENDER_MASTER_NEW as TM,CMS_VENDOR_LOGIN as VL WHERE TM.ID = TDL.TENDER_ID AND VL.VENDOR_ID = TDL.VENDOR_ID AND TENDER_ID IN (SELECT ID FROM CMS_TENDER_MASTER_NEW WHERE TM.ID ='"+strten_id+"')";	
	}
	
	
	if(request.getParameter("byDate") != null && !request.getParameter("byDate").equals("")&&request.getParameter("endDate") != null && !request.getParameter("endDate").equals("")){
		strDate = request.getParameter("byDate");
		lastDate=request.getParameter("endDate");
		condition += " AND DATE_FORMAT(TDL.DOWNLOAD_DATE,'%Y-%m-%d') >=str_to_date('"+strDate+"','%d-%m-%Y') AND DATE_FORMAT(TDL.DOWNLOAD_DATE,'%Y-%m-%d')<=str_to_date('"+lastDate+"','%d-%m-%Y')";
	} 
	
	strTenderCount +=condition;
	strTenderDetails +=condition;
	dbBean.setQuery(strTenderCount);
	String rsGetCount[][] = dbBean.getResultSet();
	int TotalCount = 0,TotalPages = 0,Start = 1,Start_Row = 0,displayTo = 0;
	if(rsGetCount.length>0){
		TotalCount = Integer.parseInt(rsGetCount[0][0]);
	}
	TotalPages = TotalCount/10;
	if(TotalCount%10 > 0){
		TotalPages++;
	}
	if(request.getParameter("Start") != null && !request.getParameter("Start").trim().equals("")){
		Start = Integer.parseInt(decrypt(request.getParameter("Start")));
		Start_Row = (Start-1)*10;
	}
	//out.print(strTenderCount);
	//out.print(strTenderDetails);
	strTenderDetails +="ORDER BY TDL.DOWNLOAD_DATE DESC LIMIT "+Start_Row+",10";
	dbBean.setQuery(strTenderDetails);
	String rsGetNoticDetails[][] = dbBean.getResultSet();
	//out.print(strTenderDetails);
%>
<%
if(rsGetNoticDetails.length>0){%>
<table border="1" align="center" class="sample" width="100%">
	
		<tr>
			<th align="center">S.No.</th><th>Notice/Tender Name</th><th>IP Address</th><th>Tender Download Date/Time</th><th>Vendor Name</th><th>Details</th>
		</tr>
		<%for(int l=0;l<rsGetNoticDetails.length;l++){
		displayTo = Start_Row+l+1;%>
		<tr>
		    <td align="center"><%=l+1%></td>
			<td><%=rsGetNoticDetails[l][0]%></td>
			<td><%=rsGetNoticDetails[l][3]%></td>
			<td nowrap="nowrap"><%=rsGetNoticDetails[l][1]%></td>
			<td><%=rsGetNoticDetails[l][2]%></td>
			<td><a href="tenderLogDetails.jsp?id=<%=rsGetNoticDetails[l][4]%>&keepThis=true&TB_iframe=true&height=500&width=600"" class="thickbox"><font color="black">View Details</font></a></td>
			
		</tr>
		<%}%>
	
</table>
<%}else{%>
		<table border="1" align="center" class="sample" width="100%">
			<tr><td align="center">No record found for this search</td></tr>
		</table>
<%}
%>
<table align="center">
	<tr>
<td align="left"><b><%=Start_Row+1%>&nbsp;-&nbsp;<%=displayTo%>&nbsp;&nbsp;Of&nbsp;&nbsp;(<%=TotalCount%>)</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%if(TotalPages > 1){%>
		<%if(Start > 1){%>
		<td><a href="tenderLog.jsp?Start=<%=encrypt("1")%>&byDate=<%=strDate%>&endDate=<%=lastDate%>&ten_id=<%=strten_id%>&sava=<%=request.getParameter("sava")%>&tenderNo=<%=request.getParameter("tenderNo")%>"><font color="black"><b>First</b></font></a>&nbsp;&nbsp;</td>
		<td><a href="tenderLog.jsp?Start=<%=encrypt(Integer.toString(Start-1))%>&byDate=<%=strDate%>&endDate=<%=lastDate%>&ten_id=<%=strten_id%>&sava=<%=request.getParameter("sava")%>&tenderNo=<%=request.getParameter("tenderNo")%>"></P><font color="black"><b>Previous</b></font></a>&nbsp;&nbsp;</td>
		<%}if(TotalPages > 1 && Start < TotalPages){%>
		<td>&nbsp;&nbsp;<a href="tenderLog.jsp?Start=<%=encrypt(Integer.toString(Start+1))%>&byDate=<%=strDate%>&endDate=<%=lastDate%>&ten_id=<%=strten_id%>&sava=<%=request.getParameter("sava")%>&tenderNo=<%=request.getParameter("tenderNo").replace("/","`").replace("&","|")%>"><font color="black"><b>Next</b></font></a></td>
	
		<td>&nbsp;&nbsp;<a href="tenderLog.jsp?Start=<%=encrypt(Integer.toString(TotalPages))%>&byDate=<%=strDate%>&endDate=<%=lastDate%>&ten_id=<%=strten_id%>&sava=<%=request.getParameter("sava")%>&tenderNo=<%=request.getParameter("tenderNo")%>"><font color="black"><b>Last</b></font></a></td>
		<%}%>
<%}%>
</tr>
</table><%}%>
<%@ include file="../header/footerInner.jsp" %>
