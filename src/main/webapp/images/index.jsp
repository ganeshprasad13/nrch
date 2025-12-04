<%@ include file="header/header.jsp" %>
<!-- HEADER ENDS HERE -->

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
function popUp(theURL,name,w,h,t,m,st,sc,r,X,Y){

if ( X == -1) {
X = screen.availWidth - w ;
X = X/2;
}
if (Y == -1) {
Y = screen.availHeight -h ;
Y = Y/2;
}
p="width=" + w + ",height=" + h + ",toolbar=" + t + ",menubar=" + m + ",status=" + st + ",scrollbars=" + sc + ",resizable=" + r + "directories=0,screenX=" + X + ",screenY=" + Y + ",left=" + X + ",top=" + Y + ",header=0";
share=window.open(theURL,name,p);
}

//popUp('message1.htm','message',425,200,0,0,0,0,0,25,0);

</script>
<script language="javascript" type="text/javascript">
	function showTender(id){
			if(id == 1){
				document.getElementById("idTender1").style.display="";
				document.getElementById("idTender2").style.display="none";
				alert('idTender1 ---'+idTender1);
			}else if(id == 2){
				document.getElementById("idTender1").style.display="none";
				document.getElementById("idTender2").style.display="";
				document.getElementById("idTender2").style.width="195";
				document.getElementById("idTender2").style.height="100";
				document.getElementById("idTender2").style.overflow="scroll";
			}
	}
	function showNew(id){
			if(id == 1){
				document.getElementById("idNew1").style.display="";
				document.getElementById("idNew2").style.display="none";
			}else if(id == 2){
				document.getElementById("idNew1").style.display="none";
				document.getElementById("idNew2").style.display="";
				document.getElementById("idNew2").style.width="195";
				document.getElementById("idNew2").style.height="100";
				document.getElementById("idNew2").style.overflow="scroll";
			}
	}
	
</script>

<table width="900" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
  <td width="100" style="font-size:11px;font-family:tahoma;font-weight:bold;background-color:#D42716;color:white;">&nbsp;What's New&nbsp;&raquo;</td>
	<td style="font-size:11px;font-family:tahoma;">
		<iframe  src="scrollFont.jsp?lang=<%=request.getParameter("lang")%>" width="794" height="19" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"></iframe>
	</td>
  </tr>
 

  
  </table>
 <table width="900" border="0" align="center" bgcolor="#FFFFFF">
 	<tr>
		<td width="680" valign="top">
		<%
	String banner1 ="5",banner2 ="6",banner3 ="7";
	if(lang != null && lang.equals("1")){
		banner1 = "14";
		banner2 = "15";
		banner3 = "16";
	}
	%>
    <div id="slider1" class="sliderwrapper"> 
        <div class="contentdiv"> 
		<% Vector rsGetUser5 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE="+banner1+" and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID  limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser5 = (Vector)dbBean.go(); %><img src="template/site1/images/<% if(rsGetUser5.size()>0){ out.print(dbBean.getcell(rsGetUser5,0,0)); } %>" border="0" width="680" alt="Banner 1">   
        </div> 
        <div class="contentdiv"> 		
            <% Vector rsGetUser6 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE="+banner2+" and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser6 = (Vector)dbBean.go(); %><img src="template/site1/images/<% if(rsGetUser5.size()>0){ out.print(dbBean.getcell(rsGetUser6,0,0)); } %>" border="0"  width="680" alt="Banner 2">   
        </div> 
        <div class="contentdiv"> 
		<% Vector rsGetUser7 = new Vector();
strGetUserQuery = "select CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE="+banner3+" and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";

dbBean.setQuery(strGetUserQuery);
rsGetUser7 = (Vector)dbBean.go(); %><img src="template/site1/images/<% if(rsGetUser7.size()>0){ out.print(dbBean.getcell(rsGetUser7,0,0)); } %>" border="0"  width="680" alt="Banner 3">             
        </div> 		
    </div> 	
    <div id="paginate-slider1" class="pagination"> 
    </div> 
	
	
	 <script type="text/javascript" src="contentslider.js"></script> 
	 <script type="text/javascript"> 
	
	
	function brotarefx(){
        featuredcontentslider.init({
            id: "slider1",  //id of main slider DIV
            contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
            toc: "#increment",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
            nextprev: ["<", ">"],  //labels for "prev" and "next" links. Set to "" to hide.
            revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
            enablefade: [true, 0.1],  //[true/false, fadedegree]
            autorotate: [true, 4000],  //[true/false, pausetime]
            onChange: function(previndex, curindex) {  //event handler fired whenever script changes slide
                //previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
                //curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
            }
        })
		}
        function goTurl(loc) {
            window.top.location = loc;
        }
		
		 function refreshpage() {
           // window.location.reload();
			
        }
		
		//setTimeout("brotarefx()",2);
		setTimeout("brotarefx()",0);
		
		//setTimeout("refreshpage()",27000);
    </script> 
	<table width="100%" border="0">
	<%if(Hname.equals("icf")){%>
							<tr>
								<td><p style="font-family:tahoma;font-size:12px;" align="justify"><% Vector rsGetUser9 = new Vector();
						if(request.getParameter("lang")!=null && request.getParameter("lang").equals("1")){
							strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=10 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
						}else{
							strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=9 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
						}
dbBean.setQuery(strGetUserQuery);
rsGetUser9 = (Vector)dbBean.go(); %><% if(rsGetUser9.size()>0){ out.print(dbBean.getcell(rsGetUser9,0,0)); } %>
						
						</p></td>
						<td width="150" valign="top"><p style="font-family:tahoma;font-size:12px;" align="justify">
					
					
						&nbsp;<img border="1" align="center" src="images/icf_gm.jpg" width="132" height="162">
									<p style="margin-top: 0; margin-bottom: 0" align="center"><b>
			<font color="#0000FF" size="2">Shri Ashok K. Agarwal</font></b></p>
			<p style="margin-top: 0; margin-bottom: 0" align="center"><b>
			
			<font color="#999999" size="2">General Manager/ICF</font></b></p>
			
			<p style="margin-top: 0; margin-bottom: 0" align="center"><b>
			<a href="upload/about_gm.pdf" target="_blank"><font color="#009933" size="2">About our G.M.</font></a></b></div>
                   
						</td>
							</tr>	
														
<%}else{%>
                          <tr>
								<td><p style="font-family:tahoma;font-size:12px;" align="justify"><% Vector rsGetUser9 = new Vector();
						if(request.getParameter("lang")!=null && request.getParameter("lang").equals("1")){
							strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=10 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
						}else{
							strGetUserQuery = "select  CMSSC_DESC from CMS_SITE_CONFIGURATION where CMSSC_TYPE=9 and  CMSSC_SITE_ID=1 and CMSSC_FLAG=1 order by CMSSC_ID limit 0,1";
						}
dbBean.setQuery(strGetUserQuery);
rsGetUser9 = (Vector)dbBean.go(); %><% if(rsGetUser9.size()>0){ out.print(dbBean.getcell(rsGetUser9,0,0)); } %>
						
						</p></td>
							</tr>
							<//%}if(Hname.equals("dmw")){%>
				<!--<tr align="center">
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<//%=Hname%>.indianrailways.gov.in/FlipBook.exe"><b>Click here for view Annual Report 2011-2012</a></td>
						</tr>-->

							<tr>

								<td><p align="right">
						<%if(request.getParameter("lang")!=null && request.getParameter("lang").equals("0")){%>
										
							<%if(Hname.equals("rdso")){%>
							<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
							href="view_section.jsp?lang=0&amp;id=0,1">
							<%}else{%>
							<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
							href="view_section.jsp?lang=0&amp;id=0,294">
							<%}%>
							<img src="images/more_img.gif" border="0"></a>
						
						<%}else if(request.getParameter("lang")!=null && request.getParameter("lang").equals("1")){%>
							<%if(Hname.equals("rdso")){%>
							<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
							href="view_section.jsp?lang=1&amp;id=0,1">
							<%}else{%>
							<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
							href="view_section.jsp?lang=1&amp;id=0,294">
							<%}%>
							<img src="images/more_img.gif" border="0"></a>
						
						<%}else{%>
							<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" href="view_section.jsp?lang=0&amp;id=0,294"><img src="images/more_img.gif" border="0"></a>
						<%}%></p></td>
							</tr>
							
			<%}if(Hname.equals("rlda")){%>				
															<tr>
								
								  <td>
								  <br/>
								   <table cellpadding="0" cellspacing="0" border="0" width="auto">
					  <tbody><tr>
						<td align="center" bgcolor="#EFEFEF" valign="middle" width="74%"><table cellpadding="0" cellspacing="0" border="0" width="100%">
						  <tbody><tr>
							  <td align="center" width="63%"><span class="content">Download NIT/PIM without 
								registration 
								click on</span><br>
								
							  <a href="http://www.rlda.indianrailways.gov.in/view_section.jsp?lang=0&id=0,296,307,495"><img src="<%=strAppPath%>/images/statusofmfca.jpg" height="145" width="150">&nbsp;</a><a href="http://www.rlda.indianrailways.gov.in/view_section.jsp?lang=0&id=0,296,306,502"><img src="<%=strAppPath%>/images/statusofmfc.jpg" height="145" width="150"></a></td>
							<td align="center" valign="middle" width="37%"><table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							 
						  <tbody><tr>
									<td style="border:2px solid #a65d27;" align="center" height="49" valign="middle"><a href="http://www.rlda.indianrailways.gov.in/uploads/File/part1.pdf" target="_blank"><img src="<%=strAppPath%>/images/part1.gif"></a></td>
						  </tr>
								  <tr>
									<td style="border:2px solid #a65d27; border-top:none;" align="center" height="49" valign="middle"><a href="http://www.rlda.indianrailways.gov.in/uploads/File/Part-2.pdf" target="_blank"><img src="<%=strAppPath%>/images/part2.gif"></a></td>
							  </tr>
														
							  </tbody></table>
							  
							</td>
						  </tr>
						</tbody></table></td>
						<td align="center" bgcolor="#EFEFEF" height="202" valign="top" width="26%"><table cellpadding="0" cellspacing="0" align="center" border="0" width="95%">
						  <tbody><tr>
							<td style="padding-top:5px; color:#FFFFFF; background-color:#A65D27;" align="center" height="25" valign="middle">&nbsp;&nbsp;<span class="cm_word" style="border-bottom: 1px solid #0000FF !important;text-decoration:underline !important;color:#0000FF !important">Mission</span></td>
						  </tr>
						  <tr>
							<td class="content" style="padding-top:5px;">	<div align="justify">Development
	 of Land/Air Space entrusted to the Authority on sound commercial 
	principles for generation of non-tariff revenue and creation of assets 
	for Indian Railways.</div></td>
						  </tr>
						  <tr>
							<td class="content" style="padding-top:5px;" align="center" valign="middle"><table cellpadding="0" cellspacing="0" align="center" border="0" width="95%">
							  <tbody><tr>
								<td style="padding-top:5px; color:#FFFFFF; background-color:#A65D27;" align="center" height="25" valign="middle">&nbsp;&nbsp;<span class="cm_word" style="border-bottom: 1px solid #0000FF !important;text-decoration:underline !important;color:#0000FF !important">Vision</span></td>
							  </tr>
							  <tr>
								<td class="content" style="padding-top:5px;"><div align="justify">To emerge as India's leading Public Land Development Authority.</div></td>
							  </tr>
							</tbody></table></td>
						  </tr>
						  
						</tbody></table></td>
					  </tr>
					  <tr>
					  <td></td>
					  <td align="right"><p align="right">
							<%if(request.getParameter("lang")!=null && request.getParameter("lang").equals("0")){%>
											
								<%if(Hname.equals("rdso")){%>
								<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
								href="view_section.jsp?lang=0&amp;id=0,1">
								<%}else{%>
								<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
								href="view_section.jsp?lang=0&amp;id=0,294">
								<%}%>
								
							
							 
								<%if(Hname.equals("rdso")){%>
								<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
								href="view_section.jsp?lang=1&amp;id=0,1">
								<%}else{%>
								<a class="morelink" style="color:red;text-decoration:none;font-family:tahoma;font-size:11px;" 
								href="view_section.jsp?lang=1&amp;id=0,294">
								<%}%>
								
							
							
								
							<%}%></p></td> </tr>
					 
					</tbody></table>
									
								  </td>

									
								</tr>
							
							<tr>
							
							  <td>
							  
							   <table cellpadding="0" cellspacing="0" border="0" width="auto">
                  <tbody><tr>
                    <td align="center" bgcolor="#EFEFEF" valign="middle" width="74%"><table cellpadding="0" cellspacing="0" border="0" width="100%">
                      <tbody><tr>
                          <td align="center" width="45%"><span class="content ">Multiple Documents can be downloaded with one time registration after repeated submission of registration details in active registration window for Tenders. </span><br>
                        </td>
                      </tr>
					  <br>
					  <tr>
					  <td style="padding-top:5px; color:#FFFFFF; background-color:#A65D27;" align="left" height="25" valign="middle">&nbsp;&nbsp;<span class="cm_word" style="border-bottom: 1px solid #0000FF !important;text-decoration:underline !important;color:#0000FF !important">Corporate Objectives:</span></td>
					  </tr>
					  <tr>

    <td valign="top" style="padding-top:10px;">
        <marquee height="100px;" onmouseout="this.start();" scrollamount="2" onmouseover="this.stop();" direction="up" behavior="scroll">
            <ul>
                <li class="content">

                     Total dedication and commitment to the Corporate Mission

                </li>
                <li class="content">

                    Redevelopment of Railway Station buildings, staff

                </li>
                <li class="content">

                    Develop expertise in consultancy, construction and management services in the field of real estate.

                </li>
                <li class="content">

                    Developing sound commercial models of development and implementing projects on the model that assures highest revenue return with adequate safeguards.

                </li>
                <li class="content">

                    Constantly striving to standardize the development process and the financial and legal documentations.

                </li>
                <li class="content">

                     To develop the Railway land/air space following sound architectural principles in synergy with existing surroundings and State urban development norms.

                </li>
                <li class="content">

                    Involving private sector, PSUs and other Central/State Government bodies as partners towards achieving its Corporate Mission.

                </li>
                <li class="content">

                   Maintaining full transparency in all decisions and transactions.

                </li>
                <li class="content">

                   To have a lean, efficient, accountable and effective organization. 

                </li>
            </ul>
        </marquee>
    </td>

</tr>
					  </br>
                    </tbody></table></td>
                    
                  </tr>
				                   
                </tbody></table>
							    
							  </td>

								
							</tr>
							
							
							
<%}%>
						</table>
	
	</td>
		<td width="220" valign="top">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr><td style="background-color:#463409;color:white;font-family:tahoma;font-size:12px;"><a onclick="showNew('1')">&nbsp;<img src="images/start.gif" title="start" alt="start"></a></td>
									<td style="background-color:#463409;color:white;font-family:tahoma;font-size:12px;" height="27" align="center" width="90%">
									<%if(request.getParameter("lang") != null && request.getParameter("lang").equals("1")){%>
										&#2346;&#2381;&#2352;&#2375;&#2360; &#2357;&#2367;&#2332;&#2381;&#2334;&#2346;&#2381;&#2340;&#2367;&#2351;&#2366;&#2306; 
										<%}else{%>	
										News &amp; Announcements<%}%>&nbsp;</td><td style="background-color:#463409;color:white;font-family:tahoma;">
											<a onclick="showNew('2')"><img src="images/stop.gif" title="stop" alt="stop"></a>&nbsp;</td>
								</tr>
								<%
									Vector getDirectContent1 = new Vector();
									String query_DirectContent1 = "";
									if(lang != null && lang.equals("0")){
										query_DirectContent1 = "SELECT DDC_LABEL, DSM_PATH, DDC_IDENTIFIER,DDC_ID FROM CMS_DIRECT_CONTENT, CMS_SECTION_MANAGEMENT WHERE DDC_DSM_ID = DSM_ID AND DSM_ID = 310 AND DDC_LANG_ID = 0 AND DDC_END_DATE >= adddate(now(),-1) AND DDC_STATUS <> 3 ORDER BY CMS_DIRECT_CONTENT.DDC_CREATED_DATE DESC"; 
									}else{
										query_DirectContent1 = "SELECT DDC_LABEL, DSM_PATH, DDC_IDENTIFIER,DDC_ID FROM CMS_DIRECT_CONTENT, CMS_SECTION_MANAGEMENT WHERE DDC_DSM_ID = DSM_ID AND DSM_ID = 310 AND DDC_LANG_ID = 1 AND DDC_END_DATE >= adddate(now(),-1) AND DDC_STATUS <> 3 ORDER BY CMS_DIRECT_CONTENT.DDC_CREATED_DATE DESC"; 
									}
									dbBean.setQuery(query_DirectContent1);
									getDirectContent1=(Vector)dbBean.go();
									//out.print(query_DirectContent1);
								%>
								<tr>
									<td style="font-family:tahoma;font-size:11px;border:1px solid gray;" colspan="3">
										<div id="idNew1" >
											<iframe id="datamain" src="scrollNew.jsp?lang=<%if(request.getParameter("lang") == null){out.print("0");}else{out.print(request.getParameter("lang"));}%>" width="170px" height="<%if(!Hname.equals("rdso")){out.print("100px");}else{out.print("185px");}%>" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"></iframe>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="font-family:tahoma;font-size:11px;">
										<div id="idNew2" style="display:none"><ul>
										<%
											if(getDirectContent1.size()!=0){
															for(int i=0;i<getDirectContent1.size();i++){%>
																<li><a class="marquee_top" href='view_detail.jsp?lang=0&amp;dcd=<%=dbBean.getcell(getDirectContent1,3,i)%>&amp;id=<%=dbBean.getcell(getDirectContent1,1,i)%>' target='_parent' ><%=dbBean.getcell(getDirectContent1,0,i)%></a></li>
				<%											}
														}
														else%> <li>Currently there are no active Press Releases</li>
										</ul></div>
									</td>
								</tr>	
							</table>
						
							<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
								<tr><td style="background-color:#463409;color:white;font-family:tahoma;font-size:12px;"><a onclick="showTender('1')">&nbsp;<img src="images/start.gif" title="start" alt="start"></a></td>
									<td style="background-color:#463409;color:white;font-family:tahoma;font-size:12px;" height="27" align="center" width="90%">
									<%if(request.getParameter("lang") != null && request.getParameter("lang").equals("1")){%>
										&#2360;&#2325;&#2381;&#2352;&#2367;&#2351; &#2344;&#2367;&#2357;&#2367;&#2342;&#2366;&#2351;&#2375;&#2306;
										<%}else{%>	
										Active Tenders<%}%>&nbsp;</td><td style="background-color:#463409;color:white;font-family:tahoma;">
											<a onclick="showTender('2')"><img src="images/stop.gif" title="stop" alt="stop"></a>&nbsp;</td>
								</tr>
								<%
									Vector getDirectContent2 = new Vector();
									String query_DirectContent2 = "";
									if(lang != null && lang.equals("1")){
										query_DirectContent2 = "SELECT ID,DESCRIPTION_HINDI FROM CMS_NOTICE_MASTER WHERE   DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= VALID_FROM ORDER BY VALID_FROM"; 
									}else{
										query_DirectContent2 = "SELECT ID,DESCRIPTION FROM CMS_NOTICE_MASTER WHERE   DATE_FORMAT(NOW(),'%Y-%m-%d 00:00:00') <= VALID_FROM ORDER BY VALID_FROM"; 
									}
									dbBean.setQuery(query_DirectContent2);
									getDirectContent2=(Vector)dbBean.go();
								%>
								<tr>
									<td style="font-family:tahoma;font-size:11px;border:1px solid gray;" colspan="3">
										<div id="idTender1" >
											<iframe  src="scrollTender.jsp?lang=<%if(request.getParameter("lang") == null){out.print("0");}else{out.print(request.getParameter("lang"));}%>" width="170px" height="100px" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"></iframe>
										</div>
									</td>
								</tr>
								<tr>							
									<td  style="font-family:tahoma;font-size:11px;" colspan="3">
									<div id="idTender2" style="display:none">
										
										<%
										if(getDirectContent2.size()!=0){
													for(int i=0;i<getDirectContent2.size();i++){%>
														<ul><li><a href='TenderDetails.jsp?T_ID=<%=dbBean.getcell(getDirectContent2,0,i)%>&lang=0&amp;id=0,299' target='_parent' class="linkmarquee1"><%=dbBean.getcell(getDirectContent2,1,i)%></a></li></ul>
													
										<%}}else%><ul><li>Currently there are no active Tenders.</li></ul>
									</div>
									</td>
								</tr>
							</table>
					
							<br>
							
							
							
							
							<table width="100%" border="0">
							
							
								<%if(Hname.equals("rlda") && lang.equals("0")){%>
								 <tr>
			<td>
				<table>
              
                <tr>
                  <td valign="top"><div style="padding-top:5px;"><a href="http://rlda.indianrailways.gov.in/uploads/File/public-notice.jpg" target="_blank" ><img width="190" height="18" src="<%=strAppPath%>/images/sarairohhila.gif" usemap="#Map2Map" border="0"></a></div>
                                       
				</td>
                </tr>
				<tr>
                  <td valign="top"><div style="padding-top:5px;"><a href="http://rlda.indianrailways.gov.in/uploads/File/PessngrAmenities.pdf" target="_blank"><img width="190" height="50" src="<%=strAppPath%>/images/revised.png" usemap="#Map2Map" border="0"></div></a>
                                       
				</td>
                </tr>
				
               <!-- <tr>
                <td align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" height="60" width="10">
				  <param name="movie" value="PessngrAmenities1.swf">
				  <param name="quality" value="high">
				  <embed src="Rail%20Land%20Development%20Authority_files/PessngrAmenities1.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" height="60" width="10">
				</object> 
				</td>
                </tr> -->
                <tr>
                  <td align="center" bgcolor="#D5FFFF" height="50" valign="middle" ><a href="http://rlda.indianrailways.gov.in/uploads/File/Circular1.pdf" target="_blank" class="text_side_link">Circular for MFCs- 
for bringing utilities</a></td>
                </tr>
               
                <tr>
                  <td align="center" bgcolor="#E2FEFD" height="50" valign="middle"><a href="http://rlda.indianrailways.gov.in/uploads/File/Circular2.pdf" target="_blank" class="text_side_link">Circular for MFCs- MFCs are 
                      operational buildings of railway 
                      and role duties in 
                      development of MFCs</a></td>
                </tr>
               <!-- <tr>
                  <td valign="top">
                    <a href="http://rlda.in/general-pim.pdf" target="_blank"><img height="180" width="190" src="<%=strAppPath%>/images/imag_27.jpg" height="100" width=""></a></td>
                </tr> -->
                <tr>
                <td valign="top"><map name="Map" id="Map">
                      <area shape="rect" coords="0,3,243,78" href="http://rlda.in/gallery.html">
                    </map></td>
                </tr>
               <!-- <tr>
                  <td valign="top"><img width="190" height="100" src="<%=strAppPath%>/images/gal.jpg" usemap="#Map" border="0" height="81" width="100"></td>
                </tr> -->
                	<tr>
					<td valign="top">
					<a target="_blank" href="general-pim.pdf">
					<img width="194" height="180" src="images/imag_27.jpg"></img></a></td>
					</tr>
					<tr>
					<td valign="right">
					<img src="<%=strAppPath%>/images/gallery.jpg" width="195" border="0"/></td>
		</tr> 
            </table></td>
          </tr>
								<%}%>
							
							    <%if(Hname.equals("rcf") && lang.equals("0")){%>
								<tr>
								<td>
								<b>Total Visitors:</b><%@ include file="HHIT/hit.jsp" %>
								</td></tr>
								<%}%>
				                <%if(Hname.equals("rcf") && lang.equals("1")){%>
								<tr>
								<td>
								<b>Total Visitors:</b><%@ include file="HHIT1/hit.jsp" %>
								</td></tr>
								<%}%>
								<tr>
                        <!--- added by Prabhat-->
                         <%if(Hname.equals("dlw")){%>
								<tr>
									<td><a href="http://dlw.indianrailways.gov.in/view_section.jsp?lang=0&id=0,299,427" target="_blank"><img src="http://www.dlw.indianrailways.gov.in/bannerfile/mm.jpg" width="196" height="28" border="0"></a></td>
								</tr>
								<%}%>
                         <!------End-->


									<td align="center" >
									
									<%if (lang.equals("1")){%>
									<a href="http://pgportal.gov.in/" target="_blank"><img src="images/Public_greivance1.jpg" border="0" alt="Public Grievances, External link opens in new window"></a>
									<%}else{%>
									<a href="http://pgportal.gov.in/" target="_blank"><img src="images/public_grievances.jpg" border="0" alt="Public Grievances, External link opens in new window"></a>
									<%}%>
									</td>
								</tr>
								<tr>
									<td><a href="http://india.gov.in/" target="_blank"><img src="images/banner1.gif" width="196" border="0" alt="National Portal of India, External link opens in new window"></a></td>
								</tr>
								
								<tr>
									<td><a href="http://coms.indianrailways.gov.in/criscm/cmsHome.html#" target="_blank"><img src="images/coms.jpg" border=0 alt="COMS"></a></td>
								</tr>
						<!--- added by Kailash-->
                         <%if(Hname.equals("icf")){%>
								<tr>
									<td><a href="https://www.facebook.com/pages/Integral-coach-factory-Ministry-of-Railways-India/666240680151162" target="_blank"><img src="images/fbicf.png" width="196" border="0" alt="facebook link of ICF"></a></td>
								</tr>
								<%}%>
                         <!------End-->
								
								
							</table>
							
		
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<table width="100%" border="0" class="bottom_table1" cellpadding="1">
			<%if(request.getParameter("lang") != null && request.getParameter("lang").equals("1")){
				if(Hname.equals("rdso")){
				%>

					<tr align="center">
								<td width="15%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,284"><img src="images/specs_for_comments1.jpg" height="30" width="170" border="0" alt="Recruitments"></a></td>
								<td width="15%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,4,281" ><img src="images/for_retired_employees1.jpg" height="30" width="150" border="0" alt="Holidays"></a></td>
								<td width="15%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,283"><img src="images/epayment_to_RDSO1.jpg" border="0" alt="FAQs"><img src="new12.gif"></a></td>
								<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1093"><img src="images/Importent_Achivement.jpg" border="0" alt="Importent Achivement"></a><sup><font color="red">New</font></sup></td>
						<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,975"><img src="images/Immovable_Property_returns1.jpg" border="0" alt="Immovable_Property_returns"></a></td>
						<td width="15%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,975"><img src="images/Immovable_Property_returns11.jpg" border="0" alt="IPRs"></a></td>
						<td width="15%" style="border-right:1px dotted white;"><a href="http://wmail.railnet.gov.in/src/login.php" target="_blank"><img src="images/rmail.jpg" border="0" alt="R-Mail"></a></td>
						<td width="15%"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,7,329"><img border="0" src="images/feedback11.jpg" alt="Feedbacks"></a></td>
							</tr>
			<%
			}else  if(Hname.equals("icf")){%>
				<tr align="center">
				        <!--
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/recruit/recruitment.html"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
						-->
						<td width="25%" style="border-right:1px dotted white;"><a href="#"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/holiday.pdf" ><img src="images/holidays.jpg" border="0" alt="Holidays"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,370"><img src="images/faq.jpg" border="0" alt="FAQs"></a></td>-->
						<td width="25%"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,318"><img border="0" src="images/feedbacks.jpg" alt="Feedbacks"></a></td>
					</tr>	
			<%}
			else if(Hname.equals("core")){%>
				<tr align="center">
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,297,381"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,294,303" ><img src="images/holidays.jpg" border="0" alt="Holidays"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,370"><img src="images/faq.jpg" border="0" alt="FAQs"></a></td>
						<td width="25%"><a href="http://cris-<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,318"><img border="0" src="images/feedbacks.jpg" alt="Feedbacks"></a></td>
					</tr>	
			<%}
			}else{
					if(Hname.equals("rdso")){
					%>
							<!--	<tr>
								<td colspan="4"><marquee scrollamount="3"><a href="/view_section.jsp?lang=0&id=0,1,1055" target="_blank">Proposed Methodology for Vendor Rating for Comments</a></marquee></td>
								</tr>
							-->	
								<tr align="center">
								<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,284"><img src="images/specs_for_comments1.jpg" height="30" width="170" border="0" alt="Recruitments"></a></td>
								<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,4,281" ><img src="images/for_retired_employees1.jpg" height="30" width="150" border="0" alt="Holidays"></a></td>
								<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,283"><img src="images/epayment_to_RDSO1.jpg" border="0" alt="FAQs"><img src="new12.gif"></a></td>
						<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1093"><img src="images/Importent_Achivement.jpg" border="0" alt="Importent Achivement"></a></td>
						<td width="20%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,975"><img src="images/Immovable_Property_returns1.jpg" border="0" alt="Immovable_Property_returns"></a></td>
							<td width="15%" style="border-right:1px dotted white;"><a href="http://wmail.railnet.gov.in/src/login.php" target="_blank"><img src="images/rmail.jpg" border="0" alt="R-Mail"></a></td>
							<td width="20%"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,7,329"><img border="0" src="images/feedback11.jpg" alt="Feedbacks"></a></td>
							</tr>
							
							
							
							
					<%}if(Hname.equals("icf")){%>
				<tr align="center">
				        <!--
				        <td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/recruit/recruitment.html"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
						-->
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/icfRecruitment.pdf"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/holiday.pdf" ><img src="images/holidays.jpg" border="0" alt="Holidays"></a></td>
						<td width="25%" style="border-right:1px dotted white;"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,370"><img src="images/faq.jpg" border="0" alt="FAQs"></a></td>
						<td width="25%"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,318"><img border="0" src="images/feedbacks.jpg" alt="Feedbacks"></a></td>
					</tr>
					<%}if(Hname.equals("core")){%>
						<tr align="center">
								<td width="25%" style="border-right:1px dotted white;"><a href="#"><img src="images/button1.jpg" border="0" alt="Recruitments"></a></td>
								<td width="25%" style="border-right:1px dotted white;"><a href="#" ><img src="images/holidays.jpg" border="0" alt="Holidays"></a></td>
								<td width="25%" style="border-right:1px dotted white;"><a href="#"><img src="images/faq.jpg" border="0" alt="FAQs"></a></td>
								<td width="25%"><a href="http://www.<%=Hname%>.indianrailways.gov.in/view_section.jsp?lang=0&id=0,300,318"><img border="0" src="images/feedbacks.jpg" alt="Feedbacks"></a></td>
							</tr>
					<%}%>
					
					<%
			}%>
				</table>
		
		</td>
	</tr>
 </table>


  




  





<!-- FOOTER STARTS HERE -->
<%@ include file="header/footer.jsp" %>