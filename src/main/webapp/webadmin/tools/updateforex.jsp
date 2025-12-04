<%@ include file="../../dbConn/dbInit.jsp" %>
<%
//To select existing data from the regioncodes

String ib = "0";
String cb = "0";
String atm = "0";
String query="";
String queryupdate="";
Vector vec= new Vector();
query = "select brcode, br_name from brtemp where CORE = 'Y' order by brcode";
dbBean.setQuery(query);
vec=(Vector)dbBean.go();

if(vec.size()!=0){
for(int i=0;i<vec.size();i++){


queryupdate = "INSERT INTO ProductServices (br_code, br_name, productcode) VALUES ('"+dbBean.getcell(vec,0,i).replaceAll("'","''")+"','"+dbBean.getcell(vec,1,i).replaceAll("'","''")+"',950)";
dbBean.setQuery(queryupdate);
//dbBean.go1();

out.print(dbBean.getcell(vec,0,i)+"<br><br>");
}
}
%>



<div align="center"><a href="../home_new.jsp" class="linkn">Back to home</a></div><br>
<%@ include file="../../dbConn/dbClose.jsp" %>