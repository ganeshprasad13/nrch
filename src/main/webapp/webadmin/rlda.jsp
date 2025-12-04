
<%@ include file="../dbConn/dbInit.jsp" %>
<%@page import="java.util.*;" %>
<html>
<head>
<script type="text/javascript" src="../../($Sent)/../cal/js/calendar_us.js"></script>
<link rel="stylesheet" href="../../($Sent)/../cal/css/calendar.css" type="text/css" media="screen"></link>
  <link href="autocomplete.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript">

 
 
 


	
function submit_self()
	{
			var data = document.form1.ZONE_ID.value;
document.form1.action='rlda.jsp?ZONE_ID='+data;
		document.form1.submit();	
		
	}


	

		
	
</script>

<script type="text/javaScript">


		  
function validate(evt){
  /* -------------------Updated By Aman Kumar 09-05-2014 -------------------------------*/
	
var id = evt;
var id1 = evt.value;
var ext = id1.substring(id1.lastIndexOf('.') + 1);
if(ext == "pdf" || ext == "JPEG"||ext == "gif" || ext == "GIF" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "PDF")
{
return true;
} 
else
{
alert("Upload Pdf, Jpg or Doc files only");
evt.value="";
evt="";
return false;
}

}


</script>
<%!
public String[][] getResultSet(ResultSet rs1) throws SQLException {
        Vector rsResults = new Vector();
		
		ResultSetMetaData rsmd = rs1.getMetaData();
		
		
		 while (rs1.next()) {
                String[] s = new String[rsmd.getColumnCount()];
                int i2 = 1;
                while (i2 <= rsmd.getColumnCount()) {
                    s[i2 - 1] = rs1.getString(i2);
                    if (s[i2 - 1] == null) {
                        s[i2 - 1] = "";
                    } else if (s[i2 - 1].equalsIgnoreCase("null")) {
                        s[i2 - 1] = "";
                    }
                    ++i2;
                }
                rsResults.addElement(s);
                
            }
		String[][] resultArray=new String[rsResults.size()][rsmd.getColumnCount()];
		
		
        int i = 0;
		
		 while (i < rsResults.size()) {
            String[] strRowSet = (String[])rsResults.get(i);
            int j = 0;
            while (j < rsmd.getColumnCount()) {
                resultArray[i][j] = strRowSet[j];
                ++j;
            }
            ++i;
        }
        return resultArray;
    }


%>


	<%
try{
ResultSet rs_new=null;

PreparedStatement ps = null;
System.out.print("hello");


String strStationId  = "-100";
if(request.getParameter("STATION_ID")!=null &&  !request.getParameter("STATION_ID").trim().equals("")){
	strStationId = request.getParameter("STATION_ID");
}


String strStateId  = "-100";

if(request.getParameter("STA_CAT")!=null &&  !request.getParameter("STA_CAT").trim().equals("")){
	strStateId = request.getParameter("STA_CAT");
}

String strState = "";
strState="SELECT ST1 FROM CMS_STATES";
ps=cn.prepareStatement(strState);
    
    

    rs_new = ps.executeQuery();
	
	
	String rsGetState[][] = getResultSet(rs_new);

	

String strZoneId  = "-100";
if(request.getParameter("ZONE_ID")!=null &&  !request.getParameter("ZONE_ID").trim().equals("")){
	strZoneId = request.getParameter("ZONE_ID");
}
String strZone = "";
strZone="SELECT DISTINCT ZN_CODE FROM RLDA_STATIONS";
System.out.print("hello2");
ps=cn.prepareStatement(strZone);
    
    

    rs_new = ps.executeQuery();
	
	
	String rsGetZone[][] = getResultSet(rs_new);
System.out.print("hello3");




String strStation = "";

	
	strStation = "SELECT CMSSTN_NAME FROM RLDA_STATIONS WHERE ZN_CODE =?";
	ps=cn.prepareStatement(strStation);
    ps.setString(1,strZoneId);
    

    rs_new = ps.executeQuery();
	
	
	String rsGetStation[][] = getResultSet(rs_new);
System.out.print("hello4");

%>

<script type="text/javascript">






</script>
</head>
<body >
<p align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;<b><font color="#FF0000" size="4">Commercial sites details entry form &nbsp;</font></b>&nbsp;&nbsp;</span></p>

<form name="form1" id="form1" method="post"  ENCTYPE="multipart/form-data" >
  
  
  
  <table width="800" border="1" cellspacing="1" align="center" class="sample" style="font-family:Tahoma; font-size:12px;">
</br>
  
  
     <tr>
                <td colspan="2" align="center"><font color="blue">
                   <%if(request.getParameter("strMSG")!=null){
				   		out.print(request.getParameter("strMSG"));
				   }%>
					</font>
                </td>
            </tr>
    
 
  
    
			
		
			<tr>
                <td width="46%" bgcolor="#DEDEEF">Railway</td>
                <td width="52%" bgcolor="#DEDEEF"><select name="ZONE_ID" onchange="javascript:submit_self();" id="ZONE_ID" >
			  			<option value='-1'>--Select railway--</option>
						<%if(rsGetZone.length>0){
							for(int i=0;i<rsGetZone.length;i++){%>
							<option value="<%=rsGetZone[i][0]%>" <%if(strZoneId.equals(rsGetZone[i][0])){%>selected<%}%>><%=rsGetZone[i][0]%></option>
						<%	}
						}%></select></td>
			 </tr>
			 
			 <tr>
                <td width="46%" bgcolor="#DEDEEF">Name of Site</td>
				<td width="52%" bgcolor="#DEDEEF"><input name="SITE"  type="text" id="SITE"   /></td>
				</tr>
			 
			 <!--<tr>
                <td width="46%" bgcolor="#DEDEEF">Station</td>
                <td width="52%" bgcolor="#DEDEEF"><select name="STATION_ID" id="STATION_ID"  >
				<option value="-1">--Select Station--</option>
				</%if(rsGetStation.length>0){%>
						</%
							for(int i=0;i<rsGetStation.length;i++){%>
							<option value="</%=rsGetStation[i][0]%>" </%if(strStationId.equals(rsGetStation[i][0])){%>selected</%}%>></%=rsGetStation[i][0]%></option>
						</%	}
						}%>
						
					</select></td>
			</tr>-->
			
		<tr>
                <td width="46%" bgcolor="#DEDEEF">State </td>
                <td width="52%" bgcolor="#DEDEEF"><select name="STA_CAT" id="STA_CAT"  >
				<option value="-1">--Select State--</option>
				<%if(rsGetState.length>0){%>
						<%
							for(int i=0;i<rsGetState.length;i++){%>
							<option value="<%=rsGetState[i][0]%>" <%if(strStateId.equals(rsGetState[i][0])){%>selected<%}%>><%=rsGetState[i][0]%></option>
						<%	}
						}%>
						
					</select>
			  		
					</td>
			</tr>
		
  
			
			
			
			<tr>
                <td width="46%" bgcolor="#DEDEEF">Area(in Ha)</td>
				<td width="52%" bgcolor="#DEDEEF"><input name="AREA"  type="text" id="AREA"   /></td>
				</tr>
				
               <tr>
                <td width="46%" bgcolor="#DEDEEF">Remarks/Status</td>
				<td width="52%" bgcolor="#DEDEEF"><input name="remark"  type="text" id="remark"   /></td>
				</tr>
			
			
				
			    
               																
			
				
		
			
		
			
				
		<tr>
                
                <td width="46%" bgcolor="#DEDEEF">Upload files</td>
                
                 <td nowrap="nowrap" bgcolor="#DEDEEF"><input type="file" name="FileUpload" id="FileUpload" onChange="javascript:return validate(this);" /></td>
				 
		</tr>
			<tr >
                
                
                
                 <td nowrap="nowrap" colspan="2" bgcolor="#DEDEEF"><input type="submit" name="sub" id="sub" formaction="rldasubmit.jsp" /></td>
				 
		</tr>	
							
					
  </table>
</form>
<%}catch(Exception e){
	out.print(e);
	
	
}%>
  </body>
</html> 