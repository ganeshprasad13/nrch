<%@ include file="../header/header1.jsp" %>
<%

java.util.Date today = new java.util.Date();
java.util.Calendar c = new GregorianCalendar();
c.set(1970,1,1);
int day   = c.get(Calendar.DATE);
int month = c.get(Calendar.MONTH);
int year  = c.get(Calendar.YEAR);
c = new GregorianCalendar();
int eday   = today.getDate();
int emonth = today.getMonth()+1;
int eyear  = c.get(Calendar.YEAR);

if (request.getParameter("sday")!=null){
day   = Integer.parseInt(request.getParameter("sday"));
month = Integer.parseInt(request.getParameter("smon"));
year  = Integer.parseInt(request.getParameter("syear"));
eday   = Integer.parseInt(request.getParameter("eday"));
emonth = Integer.parseInt(request.getParameter("emon"));
eyear  = Integer.parseInt(request.getParameter("eyear"));

}

String right = "";
Vector getinfo = new Vector();
String query_info;
query_info = "SELECT DUR_NAME, DUR_EMAIL, DUR_COMMENTS, DUR_CREATED_DATE, DUR_REPLY_FLAG, DUR_REPLY_BY, DUR_REPLY_DATE, DUR_REPLY_COMMENTS, DUR_ID, DUR_DRD_ID FROM  CMS_USER_RESPONSE,CMS_RESPONSE_DEPT where DUR_DRD_ID = "+request.getParameter("id")+" and DUR_DRD_ID = DRD_ID and DUR_CREATED_DATE BETWEEN CONVERT(datetime,'"+year+"/"+month+"/"+day+"',111) and DATEADD (d,1,CONVERT(datetime,'"+eyear+"/"+emonth+"/"+eday+"',111)) ";

//out.println(query_info);

if (request.getParameter("right")!=null){
right = request.getParameter("right");
if (request.getParameter("right").equals("1")){
query_info = query_info + " and DUR_REPLY_FLAG = 0";
}else if(request.getParameter("right").equals("2")){
query_info = query_info + " and DUR_REPLY_FLAG = 1";
}
}else{
right = "0";
}
query_info = query_info + " order by DUR_ID desc";

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
<form action="section_interact.jsp" method="post" name="RTEDemo" id="RTEDemo">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
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
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Manage Interactions from User(s)</b></td>
</tr>
<tr>
	<td align="right" width="50%">
	From: 
	<select name="sday">
<option value="01" <%if(day==01){%>selected<%}%>>1</option>
<option value="02" <%if(day==02){%>selected<%}%>>2</option>
<option value="03" <%if(day==03){%>selected<%}%>>3</option>
<option value="04" <%if(day==04){%>selected<%}%>>4</option>
<option value="05" <%if(day==05){%>selected<%}%>>5</option>
<option value="06" <%if(day==06){%>selected<%}%>>6</option>
<option value="07" <%if(day==07){%>selected<%}%>>7</option>
<option value="08" <%if(day==8){%>selected<%}%>>8</option>
<option value="09" <%if(day==9){%>selected<%}%>>9</option>
<option value="10" <%if(day==10){%>selected<%}%>>10</option>
<option value="11" <%if(day==11){%>selected<%}%>>11</option>
<option value="12" <%if(day==12){%>selected<%}%>>12</option>
<option value="13" <%if(day==13){%>selected<%}%>>13</option>
<option value="14" <%if(day==14){%>selected<%}%>>14</option>
<option value="15" <%if(day==15){%>selected<%}%>>15</option>
<option value="16" <%if(day==16){%>selected<%}%>>16</option>
<option value="17" <%if(day==17){%>selected<%}%>>17</option>
<option value="18" <%if(day==18){%>selected<%}%>>18</option>
<option value="19" <%if(day==19){%>selected<%}%>>19</option>
<option value="20" <%if(day==20){%>selected<%}%>>20</option>
<option value="21" <%if(day==21){%>selected<%}%>>21</option>
<option value="22" <%if(day==22){%>selected<%}%>>22</option>
<option value="23" <%if(day==23){%>selected<%}%>>23</option>
<option value="24" <%if(day==24){%>selected<%}%>>24</option>
<option value="25" <%if(day==25){%>selected<%}%>>25</option>
<option value="26" <%if(day==26){%>selected<%}%>>26</option>
<option value="27" <%if(day==27){%>selected<%}%>>27</option>
<option value="28" <%if(day==28){%>selected<%}%>>28</option>
<option value="29" <%if(day==29){%>selected<%}%>>29</option>
<option value="30" <%if(day==30){%>selected<%}%>>30</option>
<option value="31" <%if(day==31){%>selected<%}%>>31</option>
</select>
<select name="smon">
<option value="01" <%if(month==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(month==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(month==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(month==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(month==05){%>selected<%}%>> May </option>
<option value="06" <%if(month==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(month==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(month==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(month==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(month==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(month==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(month==12){%>selected<%}%>> Dec </option>
</select>

<select name="syear">
<option value="2003" <%if(year==2003){%>selected<%}%>>2003</option>
<option value="2004" <%if(year==2004){%>selected<%}%>>2004</option>
<option value="2005" <%if(year==2005){%>selected<%}%>>2005</option>
<option value="2006" <%if(year==2006){%>selected<%}%>>2006</option>
<option value="2007" <%if(year==2007){%>selected<%}%>>2007</option>
</select>
	</td>
	<td width="50%">
&nbsp;  To 
<select name="eday">
<option value="01" <%if(eday==01){%>selected<%}%>>1</option>
<option value="02" <%if(eday==02){%>selected<%}%>>2</option>
<option value="03" <%if(eday==03){%>selected<%}%>>3</option>
<option value="04" <%if(eday==04){%>selected<%}%>>4</option>
<option value="05" <%if(eday==05){%>selected<%}%>>5</option>
<option value="06" <%if(eday==06){%>selected<%}%>>6</option>
<option value="07" <%if(eday==07){%>selected<%}%>>7</option>
<option value="08" <%if(eday==8){%>selected<%}%>>8</option>
<option value="09" <%if(eday==9){%>selected<%}%>>9</option>
<option value="10" <%if(eday==10){%>selected<%}%>>10</option>
<option value="11" <%if(eday==11){%>selected<%}%>>11</option>
<option value="12" <%if(eday==12){%>selected<%}%>>12</option>
<option value="13" <%if(eday==13){%>selected<%}%>>13</option>
<option value="14" <%if(eday==14){%>selected<%}%>>14</option>
<option value="15" <%if(eday==15){%>selected<%}%>>15</option>
<option value="16" <%if(eday==16){%>selected<%}%>>16</option>
<option value="17" <%if(eday==17){%>selected<%}%>>17</option>
<option value="18" <%if(eday==18){%>selected<%}%>>18</option>
<option value="19" <%if(eday==19){%>selected<%}%>>19</option>
<option value="20" <%if(eday==20){%>selected<%}%>>20</option>
<option value="21" <%if(eday==21){%>selected<%}%>>21</option>
<option value="22" <%if(eday==22){%>selected<%}%>>22</option>
<option value="23" <%if(eday==23){%>selected<%}%>>23</option>
<option value="24" <%if(eday==24){%>selected<%}%>>24</option>
<option value="25" <%if(eday==25){%>selected<%}%>>25</option>
<option value="26" <%if(eday==26){%>selected<%}%>>26</option>
<option value="27" <%if(eday==27){%>selected<%}%>>27</option>
<option value="28" <%if(eday==28){%>selected<%}%>>28</option>
<option value="29" <%if(eday==29){%>selected<%}%>>29</option>
<option value="30" <%if(eday==30){%>selected<%}%>>30</option>
<option value="31" <%if(eday==31){%>selected<%}%>>31</option>
</select>
<select name="emon">
<option value="01" <%if(emonth==01){%>selected<%}%>> Jan </option>
<option value="02" <%if(emonth==02){%>selected<%}%>> Feb </option>
<option value="03" <%if(emonth==03){%>selected<%}%>> Mar </option>
<option value="04" <%if(emonth==04){%>selected<%}%>> Apr </option>
<option value="05" <%if(emonth==05){%>selected<%}%>> May </option>
<option value="06" <%if(emonth==06){%>selected<%}%>> Jun </option>
<option value="07" <%if(emonth==07){%>selected<%}%>> Jul </option>
<option value="08" <%if(emonth==8){%>selected<%}%>> Aug </option>
<option value="09" <%if(emonth==9){%>selected<%}%>> Sep </option>
<option value="10" <%if(emonth==10){%>selected<%}%>> Oct </option>
<option value="11" <%if(emonth==11){%>selected<%}%>> Nov </option>
<option value="12" <%if(emonth==12){%>selected<%}%>> Dec </option>
</select>

<select name="eyear">
<option value="2003" <%if(eyear==2003){%>selected<%}%>>2003</option>
<option value="2004" <%if(eyear==2004){%>selected<%}%>>2004</option>
<option value="2005" <%if(eyear==2005){%>selected<%}%>>2005</option>
<option value="2006" <%if(eyear==2006){%>selected<%}%>>2006</option>
<option value="2007" <%if(eyear==2007){%>selected<%}%>>2007</option>
</select>

	</td>
</tr>
<tr>
	<td align="center" align="center" colspan="2">
	<input type=submit name="submit" class="textbox" value="Search"></td>
</tr>
</form> 
</table>

<br>

<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts">
<tr bgcolor="#efefef">
	<td align="center"><b>Name</b></td>
	<td align="center"><b>Email</b></td>
	<td align="center"><b>Request/Message</b></td>
	<td align="center"><b>Post date</b></td>
	<td align="center"><b>ResponseBy/Message</b></td>
	<td align="center"><b>Response date</b></td>
	<td align="center"><b>Action</b></td>
</tr>
<%
if (getinfo.size()!=0){
for (int i=0;i<getinfo.size();i++){
%>

<tr>
	<td>
	<%=dbBean.getcell(getinfo,0,i)%>
	</td>
	<td>
	<%=dbBean.getcell(getinfo,1,i)%>
	</td>
	<td>
	<%=dbBean.getcell(getinfo,2,i)%>
	</td>
	<td>
	<%=dbBean.getcell(getinfo,3,i)%>
	</td>
	<td align="center">
	<% if(!dbBean.getcell(getinfo,5,i).equals("")){%>
	<b><%=dbBean.getcell(getinfo,5,i)%></b><br><%=dbBean.getcell(getinfo,7,i)%>
	<%}%>
	</td>
	<td align="center">
	<% if(!dbBean.getcell(getinfo,6,i).equals("")){%>
	<%=dbBean.getcell(getinfo,6,i)%>
	<%}%>
	</td>
	<td align="center">
	<% if(!dbBean.getcell(getinfo,4,i).equals("")){
		if(dbBean.getcell(getinfo,4,i).equals("1")){
	%>
	Responded
	<%}else{%>
	<a href="section_interact_respond.jsp?id=<%=request.getParameter("id")%>&rid=<%=dbBean.getcell(getinfo,8,i)%>&sday=<%=day%>&smon=<%=month%>&syear=<%=year%>&eday=<%=eday%>&emon=<%=emonth%>&eyear=<%=eyear%>&right=<%=right%>">Respond</a>
	
	<%}}else{%>
	<a href="section_interact_respond.jsp?id=<%=request.getParameter("id")%>&rid=<%=dbBean.getcell(getinfo,8,i)%>&sday=<%=day%>&smon=<%=month%>&syear=<%=year%>&eday=<%=eday%>&emon=<%=emonth%>&eyear=<%=eyear%>&right=<%=right%>">Respond</a>
	<%}%>
	</td>
</tr>
<% 
	}
	}else{
%>
<tr>
	<td colspan="6" align="center">
	No record(s) found
	</td>
</tr>
<% } %>
</table>
<br><br>
</div>
<%@ include file="../header/footer.htm" %>