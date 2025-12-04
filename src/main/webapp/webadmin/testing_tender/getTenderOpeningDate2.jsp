<%@ include file="../../dbConn/dbInit.jsp" %>
<%
	String id=request.getParameter("id");
	
	String	doc_strDate ="";
	String	doc_strDate_time ="";
	String	doc_endDate ="";
	String	doc_endDate_time ="";
	String	bidsub_strDate ="";
	String	bidsub_strDate_time ="";
	String	bidsub_endDate ="";
	String	bidsub_endDate_time ="";
	String	bidopen_Date ="";
	String	bidopen_Date_time ="";
	
	String sendvalues="";
	
	String n_id="";
	
	if(!id.equals("")){
	
	
		String strNoticeID = "SELECT NOTICE_ID FROM CMS_TENDER_MASTER_NEW WHERE ID="+id+"";
		dbBean.setQuery(strNoticeID);
		String rsGetNoticeID[][] = dbBean.getResultSet();
		if(rsGetNoticeID.length > 0){
		n_id=rsGetNoticeID[0][0];
		}
	
		String strNotice = "SELECT 	DATE_FORMAT(T_BID_OPEN_DATE,'%d-%m-%Y'), DATE_FORMAT(T_BID_OPEN_DATE,'%H:%i'),DATE_FORMAT(T_DOC_START_DATE,'%d-%m-%Y'), DATE_FORMAT(T_DOC_START_DATE,'%H:%i'),DATE_FORMAT(T_DOC_END_DATE,'%d-%m-%Y'), DATE_FORMAT(T_DOC_END_DATE,'%H:%i'),DATE_FORMAT(T_BIDSUB_START_DATE,'%d-%m-%Y'), DATE_FORMAT(T_BIDSUB_START_DATE,'%H:%i'), DATE_FORMAT(T_BIDSUB_END_DATE,'%d-%m-%Y'), DATE_FORMAT(T_BIDSUB_END_DATE,'%H:%i') FROM CMS_NOTICE_MASTER_NEW WHERE T_ID="+n_id+"";
		dbBean.setQuery(strNotice);
		String rsGetNotice[][] = dbBean.getResultSet();
		
		if(rsGetNotice.length > 0){
			
			bidopen_Date = rsGetNotice[0][0]+"&nbsp;&nbsp;"+rsGetNotice[0][1];
			//bidopen_Date_time = rsGetNotice[0][1];
			
			doc_strDate = rsGetNotice[0][2];
			doc_strDate_time = rsGetNotice[0][3];
			doc_endDate = rsGetNotice[0][4];
			doc_endDate_time=rsGetNotice[0][5];
			bidsub_strDate=rsGetNotice[0][6];
			bidsub_strDate_time=rsGetNotice[0][7];
			bidsub_endDate=rsGetNotice[0][8];
			bidsub_endDate_time=rsGetNotice[0][9];
			
			
			sendvalues = bidopen_Date+"\t"+doc_strDate+"\t"+doc_strDate_time+"\t"+doc_endDate+"\t"+doc_endDate_time+"\t"+bidsub_strDate+"\t"+bidsub_strDate_time+"\t"+bidsub_endDate+"\t"+bidsub_endDate_time;
			
			out.print(sendvalues);
		}
		else{
			out.print("");
		}
	}else {
		out.print("");
	}
%>

<%@ include file="../../dbConn/dbClose.jsp" %>
