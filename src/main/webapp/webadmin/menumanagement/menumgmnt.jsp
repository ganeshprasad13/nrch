<%int intPageNo =2;%>
<%@ include file="../header/headerInner.jsp" %>
<script language="JavaScript1.2">
	function fnFormSubmit(){
		var intCounter=0;
		var objForm = document.getElementById("frmhomeMenu");		
		for(i=0;i<frmhomeMenu.elements.length;i++){			
			if(frmhomeMenu.elements[i].type == 'checkbox'){
				if(frmhomeMenu.elements[i].checked){
					intCounter++;
				}
			}
		}
		if(intCounter==0){
			if(!confirm("You havnt selected any section for the menu, do you want to continue?")){
				return false;
			}
		}
		if(intCounter>9){
			alert("You can select only 9 sections for the menu, Please choose the correct ones. ");			
			return false;
		}
	}

</script>
<%
	Vector getinfo = new Vector();
	String query_info;
	query_info = "SELECT DSM_ID, DLC_LABEL, DSM_PATH, IFNULL(DSM_HEADER_FLAG,0), IFNULL(DSM_MENU_SORTING,0) DSM_MENU_SORTING ";
	query_info += " FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT  ";
	query_info += " WHERE DSM_ID=DLC_DSM_ID AND DLC_LANG_ID=0 ";
	query_info += "  AND DSM_PARENT = 0 ";
	query_info += " ORDER BY DSM_PRIORITY"; 
	dbBean.setQuery(query_info);
	getinfo=(Vector)dbBean.go();
%>
<table width="100%" class="mgContentTitle">
	<tr>
		<td align="center">
<span align="center"><span class="mgContentTitle">&nbsp;&nbsp;&nbsp;Manage Header Menu / Links&nbsp;&nbsp;&nbsp;</span></span>


		</td>
	</tr>
</table>
<br>
<div align="center"><br>
<form name="frmhomeMenu" action="menumgmnt_action.jsp" method="post" onsubmit="javascript:return fnFormSubmit()">
<table width=100% align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts1" cellpadding="3" cellspacing="0">
	
	<tr align="center" class="tr_bgcolor">
		<td><strong>Section Name</strong></td>
		<td><strong>Include in Menu</strong></td>
		<td><strong>Priority in Menu</strong></td>
	</tr>
<%	if(getinfo.size()>0){
		for(int i=0;i<getinfo.size();i++){%>
			<tR>
				<td><%=dbBean.getcell(getinfo,1,i)%></td>
				<td align="center"><input name="chkDSMIDs" id="chkDSMIDs" type="Checkbox" value="<%=dbBean.getcell(getinfo,0,i)%>" 
					<%if(Integer.parseInt(dbBean.getcell(getinfo,3,i))>0){out.print(" checked");}%>></td>
				<td align="center">
					<select name="selSort_<%=dbBean.getcell(getinfo,0,i)%>" style="width:50">
						<option <%if(dbBean.getcell(getinfo,4,i).equals("1")){out.print(" selected"); }%> value="1">1</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("2")){out.print(" selected"); }%> value="2">2</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("3")){out.print(" selected"); }%> value="3">3</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("4")){out.print(" selected"); }%> value="4">4</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("5")){out.print(" selected"); }%> value="5">5</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("6")){out.print(" selected"); }%> value="6">6</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("7")){out.print(" selected"); }%> value="7">7</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("8")){out.print(" selected"); }%> value="8">8</option>
						<option <%if(dbBean.getcell(getinfo,4,i).equals("9")){out.print(" selected"); }%> value="8">9</option>
					</select>
				</td>
			</tr>
<%		}%>
	<tr><td colspan="3" align="center"><input type="submit" value="Save">&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset"></td></tr>
<%
	}%>
	
</table>
</form>
<br><Br>
</div>
<%@ include file="../header/footerInner.jsp" %>
