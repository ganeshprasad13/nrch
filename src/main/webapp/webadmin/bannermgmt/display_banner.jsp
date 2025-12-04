<%@ include file="../header/headerInner.jsp" %>
<%

%>
<div align="center">
<form action="create_banner_action.jsp" method="post" enctype="multipart/form-data" name="bannercreate" onSubmit="return submitForm();">

<table width=750 align=center border=1 style="border-collapse: collapse" bordercolor="#111111" class="textn">
<tr>
	<td bgcolor="EFEFEF" align=center height=23 colspan="2"><b>Map Banner</b></td>
</tr>
<br>
<table width="750" border=1 style="border-collapse: collapse" bordercolor="#111111" class="texts">
<tr bgcolor="#efefef">
	<td align="center"><b>Banner</b></td>
	<td align="center"><b>Type</b></td>
	<td align="center"><b>Link To</b></td>
	<td align="center"><b>Mouse Over Text</b></td>
	<td align="center"><b>File Type</b></td>
	<td align="center"><b>CREATED BY</b></td>
	<td align="center"><b>Map</b></td>
</tr>
<%

Vector getright = new Vector();
String query_right;
query_right = "SELECT DCB_TYPE,DCB_LINK_TYPE,DCB_LINK,DCB_HOVER_ENGLISH,DCB_HOVER_HINDI,DCB_FILE_TYPE,DCB_CREATED_BY,DCB_FILE_NAME,DCB_FILE_SYSNAME,DCB_FILE_SIZE,DCB_FILE_EXT,DCB_ID,DCB_CREATED_DATE, DCB_WIDTH, DCB_HEIGHT FROM CMS_CREATE_BANNER ";
query_right = query_right + " WHERE DCB_FLAG = 1 and DCB_TYPE <> 2 ORDER BY DCB_CREATED_DATE DESC";
dbBean.setQuery(query_right);
getright=(Vector)dbBean.go();
//out.println(query_right);
	if (getright.size()!=0){
		for (int i=0;i<getright.size();i++){%>
			<tr>
				<td>
<%					String strBannerType = dbBean.getcell(getright,5,i); //get file type image or flash
					if (strBannerType.equals("0")) {
						if (dbBean.getcell(getright,1,i).equals("2")){%>
							<a href="<%=dbBean.getcell(getright,2,i)%>" class="linkn" target="_blank"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>"  width=200 border="0" alt=""></a>
<%						}else{%>
							<a href="<%=newurl%><%=dbBean.getcell(getright,2,i)%>&lang=0" class="linkn"><img src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>"  width=200 border="0" alt=""></a>
<%						}
					}else { // banner is flash%>
						<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="<%=dbBean.getcell(getright,13,i)%>" HEIGHT="<%=dbBean.getcell(getright,14,i)%>" ALIGN="">
<PARAM NAME=movie VALUE="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>">
<PARAM NAME=quality VALUE=high> <PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#FFFFFF>
<EMBED src="<%=newurl%>bannerfile/<%=dbBean.getcell(getright,8,i)%>" quality=high wmode=transparent bgcolor=#FFFFFF  WIDTH="<%=dbBean.getcell(getright,13,i)%>" HEIGHT="<%=dbBean.getcell(getright,14,i)%>" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
</EMBED></OBJECT>
<%					}%>
				</td>
				<td>
<%					if (dbBean.getcell(getright,0,i).equals("0")){%>
						Top
<%					}else if(dbBean.getcell(getright,0,i).equals("1")){%>
						Side
<%					}else if(dbBean.getcell(getright,0,i).equals("2")){%>
						HOME
<%					} %>
				</td>
				<td>
<%					if (dbBean.getcell(getright,1,i).equals("0")){%>
						<b>Link to Section</b><br><%=dbBean.getcell(getright,2,i)%>
<%					}else if(dbBean.getcell(getright,1,i).equals("1")){%>
						<b>Link to Direct Content</b><br><%=dbBean.getcell(getright,2,i)%>
<%					}else{%>
						<b>To URL</b><br><%=dbBean.getcell(getright,2,i)%>
<%					}%>
				</td>
				<td>
					<font class="textn"><%=dbBean.getcell(getright,3,i)%></font><br>
					<font class="hinditext"><%=dbBean.getcell(getright,3,i)%></font>
				</td>
				<td align="center"><%=dbBean.getcell(getright,10,i)%>
<%					if(getright.size()!=0){
						String strFileSize=dbBean.getcell(getright,9,i);
						int intFileSize = Integer.parseInt(strFileSize);
						if (intFileSize < 1024) {
							strFileSize = Integer.toString(intFileSize) + " Bytes";
						} else if ((intFileSize >=1024) && (intFileSize < 1048576)) {
							strFileSize = Integer.toString(intFileSize/1024) + " KB";
						} else {
							strFileSize = Integer.toString(intFileSize/1048576) + " MB";	
						}%><br>(<%=strFileSize%>)
<%					}%>
				</td>
				<td align="center">
					<%=dbBean.getcell(getright,6,i)%><br>
					<%=dbBean.getcell(getright,12,i)%>
				</td>
				<td align="center"><a style="color:red;" href="map_banner.jsp?id=<%=dbBean.getcell(getright,11,i)%>">Map</a></td>
			</tr>
<% 		}			//	end of For loop
	}else{
%>
<tr>
	<td colspan="6" align="center">
	No record(s) found
	</td>
</tr>
<% } 			//	end of IF Condition%>
</table>
<br><br>
</div>
<%@ include file="../header/footer.jsp" %>