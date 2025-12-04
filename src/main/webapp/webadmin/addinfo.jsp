<%@ include file="../header/headerInner.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.Calendar,java.text.SimpleDateFormat" %>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">


<title>On-Line Application for Apprentice</title>
</head>

<body>

<form id="addform" name="addform" method="post" action="addinfo_action.jsp" onsubmit="return formsubmit();" enctype="multipart/form-data">
	
	<table border="1" width="100%" align="center">
	<tr>
     <td colspan="17" align="center"><font color="blue">
          <%if (request.getParameter("strMSG") != null) {
           out.print(request.getParameter("strMSG"));
           }%>
           </font>
           </td>
      </tr>
		<tr>
			<td colspan="2">
			<p align="center"><b>On-Line Application for Apprentices</b></td>
		</tr>
		<tr>
                    <td width="13%"><b>Name</b><p>(No prefix like 
					Sh./Mr./Km.etc is allowed)</td>
                    <td colspan="16">First:<input name="f_name" type="text" id="f_name">&nbsp;
                        Middle:<input name="m_name" type="text" id="m_name">&nbsp;
                        Last:<input name="l_name" type="text" id="l_name">
                    </td>
                </tr>
		<tr>
                    <td width="13%"><b>Father</b><font size="4"> </font><b>Name</b><p>(No 
					prefix like Sh./Mr./Km.etc is allowed)</td>
                    <td colspan="16">First:<input name="father_f" type="text" id="father_f">&nbsp;
                        Middle:<input name="father_m" type="text" id="father_m">&nbsp;
                        Last:<input name="father_l" type="text" id="father_l">
                    </td>
                </tr>
		<tr>
			<td width="27%"><b>Category</b></td>
			<td width="71%"><select  name="category">
			<option value="">--Select Category--</option>
							<option value="UR">UR</option>
							<option value="OBC">OBC</option>
							<option value="SC">SC</option>
							<option value="ST">ST</option>
							</select></td>
				</tr>		
			
		<tr>
			<td width="27%"><b>Trade for which applied</b></td>
			<td width="71%"><select  name="trade">
			<option value="">-----Select Trade-----</option>
							<option value="MCHDL">Mechanic Diesel</option>
							<option value="ETN">Electricain</option>
							<option value="MCH">Machinist</option>
							<option value="FTR">Fitter</option>
							<option value="WLD">Welder(Gas & Electic)</option>
							</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Date of Birth</b></td>
			<td width="71%">
			
			Day:<select size="1" name="day">
					<option value="">--Select Day--</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
					<option>13</option>
					<option>14</option>
					<option>15</option>
					<option>16</option>
					<option>17</option>
					<option>18</option>
					<option>19</option>
					<option>20</option>
					<option>21</option>
					<option>22</option>
					<option>23</option>
					<option>24</option>
					<option>25</option>
					<option>26</option>
					<option>27</option>
					<option>28</option>
					<option>29</option>
					<option>30</option>
					<option>31</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Month:<select size="1" name="Month">
					<option value="">--Select Month--</option>
					<option>January</option>
					<option>February</option>
					<option>March</option>
					<option>April</option>
					<option>May</option>
					<option>June</option>
					<option>July</option>
					<option>August</option>
					<option>September</option>
					<option>October</option>
					<option>November</option>
					<option>December</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year:<select size="1" name="Year">
					<option value="">--Select Year--</option>
					<option>1982</option>
					<option>1983</option>
					<option>1984</option>
					<option>1985</option>
					<option>1986</option>
					<option>1987</option>
					<option>1988</option>
					<option>1989</option>
					<option>1990</option>
					<option>1991</option>
					<option>1992</option>
					<option>1993</option>
					<option>1994</option>
					<option>1995</option>
					<option>1996</option>
					<option>1997</option>
					<option>1998</option>
					<option>1999</option>
					</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Age as on</b></td>
			<td width="71%">
			
			Years:<input type="text" name="year" size="20">&nbsp; Month:<input type="text" name="month" size="20">&nbsp; Days:<input type="text" name="day" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>Educational Qualification</b></td>
			<td width="71%"><select size="1" name="class">
			<option value="">--Select Class--</option>
			<option>Class VII</option>
			<option>Class VIII</option>
			<option>Class X/Matriculatio</option>
			<option>Class XII or above</option>
			</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Subject in Class X/Matriculation</b><p>(Only for 
			Electrician Trade)</td>
			<td width="71%"><input type="radio" value="sub" checked name="Sub">Yes<p>
			<input type="radio" name="R1" value="V2">No</td>
		</tr>
		<tr>
			<td width="27%"><b>Technical Qualification ITI passed in Trade</b></td>
			<td width="71%"><select size="1" name="tech_qual">
			<option>Mechanical Diesel</option>
			<option>Electrician</option>
			<option>Machinist</option>
			<option>Machinist(Composite)</option>
			<option>Fitter</option>
			<option>Welder(Gas & Electric)</option>
			</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Marks obtained in ITI out of 700</b></td>
			<td width="71%"><input type="text" name="marks" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>ITI passed from institute situated in</b></td>
			<td width="71%"><select size="1" name="institute">
			<option>Punjab</option>
			<option>Other State</option>
			</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Registration No. of Employment Exchange,if any</b></td>
			<td width="71%"><input type="text" name="reg_no" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>Postal Address</b></td>
			<td width="71%">
			
			House No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="house" size="20"><p>Street:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="street" size="20"></p>
			<p>Village/Colony/Locality:<input type="text" name="vill" size="20"></p>
			<p>Tehsil:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="tehsil" size="20"></p>
			<p>City/Distt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="city" size="20"></p>
			<p>PIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="pin" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>Contact Mobile Number</b></td>
			<td width="71%">
			<input type="text" name="mob" size="20" value="+91-"></td>
		</tr>
		<tr>
			<td width="27%"><b>Permanent Identification Marks</b></td>
			<td width="71%">
			
			(I).<textarea rows="2" name="m1" cols="20"></textarea><p>(II).<textarea rows="2" name="m2" cols="20"></textarea></td>
		</tr>
		<tr>
			<td width="27%" rowspan="2"><b>Are you a person with disability</b></td>
			<td width="71%">
			<input type="radio" name="Disab" value="yes" checked>Yes<p>
			<input type="radio" name="Disab" value="no">No</td>
		</tr>
		<tr>
			<td width="71%"><select size="1" name="disablity">
			<option>Orthopedic</option>
			<option>Visual</option>
			<option>Hearing</option>
			</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Are you</b><p>(Click if applicable)</td>
			<td width="71%"><select size="1" name="applicable">
			<option>Child of deceased/disabled EX-serviceman including thode killed/disabled during peacetime
			</option>
			<option>Child of serving officer/jawan</option>
			<option>Ex-serviceman</option>
			<option>Child of Ex-serviceman</option>
			</select></td>
		</tr>
		<tr>
			<td width="27%"><b>Declaration</b></td>
			<td width="71%"><input type="checkbox" name="Decl" value="ON">I 
			hereby declare that I have not been trained earlier in the trade for 
			which I have applied under Apprentice Act 1961.</td>
		</tr>
		<tr>
			<td width="27%"><b>Upload Photograph</b></td>
			<td width="71%"><input type="file" name="photo" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>Upload Signature</b></td>
			<td width="71%"><input type="file" name="sign" size="20"></td>
		</tr>
		<tr>
			<td width="27%"><b>Preview the Application</b></td>
			<td width="71%">
			<p align="center">
			<input type="button" value="Preview" name="preview" style="float: left"></td>
		</tr>
		<tr>
			<td width="27%"><b>Recheck</b></td>
			<td width="71%">Candidate to check the information filled above are 
			correct before submitting the application. An option of Edit to be 
			given editing any field.<p>
			<input type="button" value="Edit" name="edit"></td>
		</tr>
		<tr>
			<td width="27%"><b>Final Submission of the application</b></td>
			<td width="71%">
			<input type="button" value="Submit" name="final_submit"></td>
		</tr>
		<tr>
			<td width="27%"><b>Print the Application</b></td>
			<td width="71%"><input type="button" value="Print" name="print"></td>
		</tr>
	</table>
	<p><input type="submit" value="Submit" name="submit"><input type="reset" value="Reset" name="B2"></p>
</form>

</body>

</html>
<%@ include file="../header/footerInner.jsp" %>