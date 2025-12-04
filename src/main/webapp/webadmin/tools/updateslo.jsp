<%@ include file="../../dbConn/dbInit.jsp" %>
<%
//To select existing data from the regioncodes
String query="";
String queryupdate="";
Vector vec= new Vector();
query = "select slocode1, brcode from temp_swift";
dbBean.setQuery(query);
vec=(Vector)dbBean.go();

if(vec.size()!=0){
for(int i=0;i<vec.size();i++){
queryupdate = "UPDATE network SET slo_code ='"+dbBean.getcell(vec,0,i)+"' WHERE br_code ="+dbBean.getcell(vec,1,i);
dbBean.setQuery(queryupdate);
dbBean.go1();

out.print(queryupdate+"<br>");
}
}


%>



<div align="center"><a href="../home_new.jsp" class="linkn">Back to home</a></div><br>
<%@ include file="../../dbConn/dbClose.jsp" %>