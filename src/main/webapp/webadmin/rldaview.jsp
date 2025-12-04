<%@ page language="java" import="jakarta.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*,java.text.SimpleDateFormat,java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
	

<%@ include file="../dbConn/dbInit.jsp" %>

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





<%try {%>

<html>
<head>
<script type="text/javascript" src="js/calendar_us.js"></script>

<link rel="stylesheet" href="css/calendar.css" type="text/css" media="screen"></link>
<script type="text/javascript">

 
 
 


	
function submit_self()
	{
			var data = document.form1.Zone_id.value;
document.form1.action='rldaview.jsp?Zone_id='+data;
		document.form1.submit();	
		
	}


	

		
	
</script>

<%
String detail="";
ResultSet rs_new=null;
PreparedStatement ps = null;
String strZone = "";
String railway="-100";
String station="-100";
if(request.getParameter("Zone_id")!=null)
railway=request.getParameter("Zone_id");
if(request.getParameter("STATION_ID")!=null)
station=request.getParameter("STATION_ID");

strZone="SELECT DISTINCT ZN_CODE FROM RLDA_STATIONS";
ps=cn.prepareStatement(strZone);
 rs_new = ps.executeQuery();
 String rsGetZone[][] = getResultSet(rs_new);

String strStation = "";

	String condition="";
	if(!railway.equals("-100")&&!railway.equals("-1")){
		condition+=" AND railway='"+railway+"'";
	}
	if(!station.equals("-100")&& !station.equals("-1")){
		
		condition+=" AND STATION='"+station+"'";
	}
	
strStation = "SELECT CMSSTN_NAME FROM RLDA_STATIONS WHERE ZN_CODE =?";
ps=cn.prepareStatement(strStation);
ps.setString(1,railway);
    

rs_new = ps.executeQuery();
	
String rsGetStation[][] = getResultSet(rs_new);
	
detail="SELECT * FROM commercialsite1 WHERE ID IS NOT NULL";
detail=detail+condition;
ps=cn.prepareStatement(detail);
rs_new = ps.executeQuery();
String rsGetDetail[][] = getResultSet(rs_new);


%>
</head>


<body>
<form id="form1" name="form1" method="post"   >


<table width="100%" style="border-collapse:collapse;font-size:12px;font-family:tahoma" align="center" cellpadding="3" border="1" name="abc" id="abc">
<tr>
<td>Select Zone</td>
				<td>
					<select id="Zone_id" name="Zone_id"  onchange="javascript:submit_self();" >
			  			<option value="">-- Select Zone --</option>
						<option value="-1" <%if(request.getParameter("Zone_id")!=null&&request.getParameter("Zone_id").equals("-1")) {%>selected<%}%>>-- All Zone --</option>
						<%if(rsGetZone.length>0){
							for(int i=0;i<rsGetZone.length;i++){%>
							<option value="<%=rsGetZone[i][0]%>" <%if(request.getParameter("Zone_id")!=null&&request.getParameter("Zone_id").equals(rsGetZone[i][0])){%>selected<%}%>><%=rsGetZone[i][0]%></option>
						<%	}  %>
						
						<%}%>
					</select>
				</td>
				

</tr>
<!--<tr>
                <td width="46%"><font color="red"><b></b></font>Station</td>
                <td width="52%"><select name="STATION_ID" id="STATION_ID"  >
				<option value="-1">--Select Station--</option>
				</%if(rsGetStation.length>0){%>
						</%
							for(int i=0;i<rsGetStation.length;i++){%>
							<option value="</%=rsGetStation[i][0]%>" </%if(station.equals(rsGetStation[i][0])){%>selected</%}%>></%=rsGetStation[i][0]%></option>
						</%	}
						}%>
						
					</select></td>
			</tr>-->
			
			<tr >
                
                
                
                 <td nowrap="nowrap" colspan="2"><input type="submit" name="sub" id="sub" formaction="rldaview.jsp" /></td>
				 
		</tr>	
		<tr><td colspan="2"><table width="100%">
<tr style="border-top: 1px solid #fff;border-left: 1px solid #fff;border-right: 1px solid #fff;">
<td align="center" colspan="7" style="color:black;font-weight:bold;">
View Detail 
</td>
</tr>

<tr>
<td width="5%" style="color:black;font-weight:bold;">SNo.</td>
<td width="15%" style="color:black;font-weight:bold;">State</td>
<td width="15%" style="color:black;font-weight:bold;">Railway</td>
<td width="15%" style="color:black;font-weight:bold;">Site</td>
<!--<td width="10%" style="color:black;font-weight:bold;">Station--></td>
<td width="15%" style="color:black;font-weight:bold;">Area(in Ha)</td>
<td width="15%" style="color:black;font-weight:bold;">Remark</td>
<td width="15%" style="color:black;font-weight:bold;">File Uploaded</td>
</tr>
</table>
</td>
</tr>

<tr><td colspan="2">
<table border="2" align="center"  width="100%" style="font-size:12px;font-family:tahoma;border-collapse:collapse" cellpadding="3">

<%
for(int i=0;i<rsGetDetail.length;i++){


%>
<tr><td width="5%"><%=i+1%></td>
<td width="15%"><%out.print(rsGetDetail[i][1]);%></td>
<td width="15%"><%out.print(rsGetDetail[i][2]);%></td>
<td width="15%"><%out.print(rsGetDetail[i][3]);%></td>
<td width="15%"><%out.print(rsGetDetail[i][4]);%></td>
<td width="15%"><%out.print(rsGetDetail[i][5]);%></td>


<td width="15%"><a href="../uploads/Commercial_Sites/<%=rsGetDetail[i][6]%>"  download><%=rsGetDetail[i][6]%></a></td>





</tr>
	<%
}



%>
</table>

</td></tr></table>


</form>
</body>


</html>
<%
}
catch(Exception e)
{out.print(e);}%>

