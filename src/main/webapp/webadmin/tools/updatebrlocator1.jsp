<%@ include file="../../dbConn/dbInit.jsp" %>
<br><br><br>
<div align="center">
Updating br details table
</div>
<br><br><br>

<%
//To select existing data from the regioncodes
String query = "";
String queryupdate = "";
Vector vec= new Vector();
query = "select code, BR_NAME, BR_CATEG, MAIL_ADD1, MAIL_ADD2, MAIL_ADD3, MAIL_CITY, DISTRICT, STATE, CIRCLE, ZONAL_OFF, FOREX__CA, FOREX__TYP, SLO_CODE, NM_BR_MGR, DESIGNATIO, STD_CODE, TEL_NO1, TEL_NO2, FAX, E_MAIL_ID, BR_BUS_HR, SUN_BKG_Y_, SUN_BUS_HR, NETATM, CORE, INB from brlocatorinfo where code not in (select br_code from branchdetails)";
dbBean.setQuery(query);
vec=(Vector)dbBean.go();


if(vec.size()!=0){
for(int i=0;i<vec.size();i++){
queryupdate = "Insert into branchdetails (BR_CODE, BR_NAME, BR_BUS_HR, SUN_BKG_Y_N, SUN_BUS_HR) VALUES  ('"+dbBean.getcell(vec,0,i)+"','"+dbBean.getcell(vec,1,i)+"','"+dbBean.getcell(vec,21,i)+"','"+dbBean.getcell(vec,22,i)+"','"+dbBean.getcell(vec,23,i)+"')";
dbBean.setQuery(queryupdate);
dbBean.go1();



out.print(queryupdate+"<hr>");
	}
}

%>
<%@ include file="../../dbConn/dbClose.jsp" %>
