<%@ page language="java" import="javax.servlet.*,java.io.*,org.apache.commons.fileupload.*,java.util.*,java.text.SimpleDateFormat,java.util.Date" %>
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
document.form1.action='rldaviewMFC.jsp?Zone_id='+data;
		document.form1.submit();	
		
	}


	

		
	
</script>

<%
String detail="";
ResultSet rs_new=null;
PreparedStatement ps = null;
String strZone = "";
String zone="-100";
String Division="-100";
if(request.getParameter("Zone_id")!=null)
zone=request.getParameter("Zone_id");
if(request.getParameter("DIV_ID")!=null)
Division=request.getParameter("DIV_ID");

strZone="SELECT DISTINCT ZN_CODE FROM RLDA_STATIONS";
ps=cn.prepareStatement(strZone);
 rs_new = ps.executeQuery();
 String rsGetZone[][] = getResultSet(rs_new);

String strDivision = "";

	String condition="";
	if(!zone.equals("-100")&&!zone.equals("-1")){
		condition+=" AND ZONE='"+zone+"'";
	}
	if(!Division.equals("-100")&& !Division.equals("-1")){
		
		condition+=" AND Division='"+Division+"'";
	}
	
strDivision = "SELECT DISTINCT DIV_NAME FROM RLDA_STATIONS WHERE ZN_CODE =?";
ps=cn.prepareStatement(strDivision);
ps.setString(1,zone);
    

rs_new = ps.executeQuery();
	
String rsGetDivision[][] = getResultSet(rs_new);
	
detail="SELECT * FROM mfcstatus1 WHERE ID IS NOT NULL";
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
<tr>
                <td width="46%"><font color="red"><b></b></font>Division</td>
                <td width="52%"><select name="DIV_ID" id="DIV_ID"  >
				<option value="-1">--Select Division--</option>
				<%if(rsGetDivision.length>0){%>
						<%
							for(int i=0;i<rsGetDivision.length;i++){%>
							<option value="<%=rsGetDivision[i][0]%>" <%if(Division.equals(rsGetDivision[i][0])){%>selected<%}%>><%=rsGetDivision[i][0]%></option>
						<%	}
						}%>
						
					</select></td>
			</tr>
			
			<tr >
                
                
                
                 <td nowrap="nowrap" colspan="2"><input type="submit" name="sub" id="sub" formaction="rldaviewMFC.jsp" /></td>
				 
		</tr>	
		<tr><td colspan="2"><table width="100%">
<tr style="border-top: 1px solid #fff;border-left: 1px solid #fff;border-right: 1px solid #fff;">
<td align="center" colspan="7" style="color:black;font-weight:bold;">
View Detail 
</td>
</tr>

<tr>
<td width="5%" style="color:black;font-weight:bold;">SNo.</td>
<td width="10%" style="color:black;font-weight:bold;">Station</td>
<td width="10%" style="color:black;font-weight:bold;">Railway</td>
<td width="20%" style="color:black;font-weight:bold;">Division</td>
<td width="10%" style="color:black;font-weight:bold;">State</td>
<td width="10%" style="color:black;font-weight:bold;">Area</td>
<td width="25%" style="color:black;font-weight:bold;">Status</td>
<td width="20%" style="color:black;font-weight:bold;">File Uploaded</td>
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
<td width="10%"><%out.print(rsGetDetail[i][1]);%></td>
<td width="10%"><%out.print(rsGetDetail[i][2]);%></td>
<td width="20%"><%out.print(rsGetDetail[i][3]);%></td>
<td width="10%"><%out.print(rsGetDetail[i][4]);%></td>
<td width="25%"><%out.print(rsGetDetail[i][5]);%></td>
<td width="25%"><%out.print(rsGetDetail[i][6]);%></td>
<td width="25%"><%out.print(rsGetDetail[i][7]);%></td>




<td width="20%"><a href="uploads/MFC_Site/<%=rsGetDetail[i][6]%>"  download><%=rsGetDetail[i][6]%></a></td>





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

