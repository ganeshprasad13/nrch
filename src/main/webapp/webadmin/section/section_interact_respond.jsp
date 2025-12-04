<%@ include file="../header/header1.jsp" %>
<%


String right = "";
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DUR_NAME , DUR_EMAIL, DUR_COMMENTS, DUR_CREATED_DATE, DUR_REPLY_FLAG, DUR_REPLY_BY, DUR_REPLY_DATE, DUR_REPLY_COMMENTS, DUR_ID FROM  CMS_USER_RESPONSE where DUR_ID = "+request.getParameter("rid");

dbBean.setQuery(query_info);
getinfo=(Vector)dbBean.go();

//out.print(query_info);

Vector getlevel = new Vector();
String query_level;
query_level = "SELECT DSM_ID, DLC_LABEL, DSM_PATH FROM CMS_SECTION_MANAGEMENT, CMS_LANGUAGE_CONTENT ";
query_level = query_level + " WHERE DSM_ID = "+request.getParameter("id")+" AND DSM_ID = DLC_DSM_ID AND DLC_LANG_ID =0";
query_level = query_level + " ORDER BY DSM_PATH";
dbBean.setQuery(query_level);
getlevel=(Vector)dbBean.go();

%>

<div align="center">
<% String returnurl ="section_interact.jsp?id="+request.getParameter("id")+"&rid="+request.getParameter("rid")+"&sday="+request.getParameter("sday")+"&smon="+request.getParameter("smon")+"&syear="+request.getParameter("syear")+"&eday="+request.getParameter("eday")+"&emon="+request.getParameter("emon")+"&eyear="+request.getParameter("eyear")+"&right="+request.getParameter("right")+"&msg=Reply%20Message%@20Sent.";%>
<form action="section_interact_respondaction.jsp" method="post" name="RTEDemo" id="RTEDemo">
	<input type="hidden" name="rid" value="<%=request.getParameter("rid")%>">
	<input type="hidden" name="returnurl" name="id" value="<%=returnurl%>">
<br>
<div align="center" class="textn"><b>
Current Level: <!--- <aa href="section_management.jsp?parent=0&path=0">Top level</a> »  --->
<% 
if(getlevel.size()!=0){
for(int i=0;i<getlevel.size();i++){
%>
<aa href="section_management.jsp?parent=<%=dbBean.getcell(getlevel,0,i)%>&path=<%=dbBean.getcell(getlevel,2,i)%>" class="link"><%=dbBean.getcell(getlevel,1,i)%></a> » 
<% 
	}
	}
%>
</b></div>
<br>	
<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Respond to User(s)</b></td>
</tr>
<tr>
	<td align="right" width="50%">
	Name
	</td>
	<td width="50%">
	<%=dbBean.getcell(getinfo,0,0)%>
	</td>
</tr>
<input type="hidden" name="name" id="name" value="<%=dbBean.getcell(getinfo,0,0)%>">
<tr>
	<td align="right">
	Email
	</td>
	
	<td>
	<%=dbBean.getcell(getinfo,1,0)%>
	</td>
	<input type="hidden" name="mailto" id="mailto" value="<%=dbBean.getcell(getinfo,1,0)%>">
</tr>
<tr>
	<td align="right" width="50%">
	Request/Message
	</td>
	<td width="50%">
	<%=dbBean.getcell(getinfo,2,0)%>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Post date
	</td>
	<td width="50%">
	<%=dbBean.getcell(getinfo,3,0)%>
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Your name
	</td>
	<td width="50%">
	<input type="text" name="sendername" id="sendername" class="textbox" size="28" value="<%=session.getAttribute("DBAname")%>">
	</td>
</tr>
<tr>
	<td align="right" width="50%">
	Reply Message
	</td>
	<td width="50%">
	<textarea rows="10" cols="35" name="replymsg"></textarea>
	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Reply"></td>
</tr>
</form> 
</table>


	</td>
</tr>

<br><br>
</div>
<%@ include file="../header/footer.htm" %>