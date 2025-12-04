<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>
<%@ page import= "java.io.*" %>
<%@ page import="java.text.*"  %>
<%@ page import="java.util.regex.*"  %>
<%@ page import="java.security.InvalidKeyException" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="javax.crypto.BadPaddingException" %>
<%@ page import="javax.crypto.Cipher" %>
<%@ page import="javax.crypto.IllegalBlockSizeException" %>
<%@ page import="javax.crypto.NoSuchPaddingException" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<%! String mailserver = ""; %>



<% 
//out.print(request.getServerName());

String DBname ="";
String Hname ="";

String DBUserName ="";
String DBUserPwd ="";

if(request.getServerName().equals("iritm.indianrailways.gov.in") || request.getServerName().equals("www.iritm.indianrailways.gov.in")){
	DBname = "cris-iritm"; 
	Hname ="iritm";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisiritm327";
	DBUserPwd ="O81ux1o212";
	
	}else{
	//put Public details
	DBUserName ="crisiritm356";
	DBUserPwd ="T128P1G8d3";
	
	}
	
}

if(request.getServerName().equals("irieen.indianrailways.gov.in") || request.getServerName().equals("www.irieen.indianrailways.gov.in")){
	DBname = "cris-irieen"; 
	Hname ="irieen";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisirieen709";
	DBUserPwd ="iwx1MrcuEi";
	
	}else{
	//put Public details
	DBUserName ="crisirieen864";
	DBUserPwd ="4B516r3uRW";
	
	}
	
}
if(request.getServerName().equals("iriset.indianrailways.gov.in") || request.getServerName().equals("www.iriset.indianrailways.gov.in")){
	DBname = "cris-iriset"; 
	Hname ="iriset";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisiriset744";
	DBUserPwd ="n5HBI69I81";
	
	}else{
	//put Public details
	DBUserName ="crisiriset875";
	DBUserPwd ="N23re3lKeD";
	
	}
	
}
if(request.getServerName().equals("rscbrc.indianrailways.gov.in") || request.getServerName().equals("www.rscbrc.indianrailways.gov.in")){

	DBname = "cris-rscbrc"; 
	Hname ="rscbrc";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisrscbrc322";
	DBUserPwd ="DV58j0NuTJ";
	
	}else{
	//put Public details
	DBUserName ="crisrscbrc965";
	DBUserPwd ="Z2m9thyZ9r";
	
	}
	
}
//new entry on feb 2013
if(request.getServerName().equals("nair.indianrailways.gov.in") || request.getServerName().equals("www.nair.indianrailways.gov.in")){
	DBname = "cris-rscbrc"; 
	Hname ="rscbrc";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisrscbrc322";
	DBUserPwd ="DV58j0NuTJ";
	
	}else{
	//put Public details
	DBUserName ="crisrscbrc965";
	DBUserPwd ="Z2m9thyZ9r";
	
	}
	
}


if(request.getServerName().equals("irimee.indianrailways.gov.in") || request.getServerName().equals("www.irimee.indianrailways.gov.in")){
	DBname = "cris-irimee"; 
	Hname ="irimee";
	
	if (request.getRequestURL().indexOf("/webadmin")!=-1){
	//put admin details
	DBUserName ="crisirimme533";
	DBUserPwd ="No9hOy71Hi";
	
	}else{
	//put Public details
	DBUserName ="crisirimme578";
	DBUserPwd ="iRw7wA4sTf";
	
	}
	
}


%>
<%! String JDBC_DRIVER  = "com.mysql.jdbc.Driver"; %>
<% String JDBC_URL =  "jdbc:mysql://10.64.5.66/"+DBname+"?user="+DBUserName+"&password="+DBUserPwd+"&useUnicode=true&characterEncoding=UTF8";  %>
<%!//Format SQL Query function
//Remove malicious characters from links and images

private String formatSQLInput(double dblInputEntry){
	return formatSQLInput(Double.toString(dblInputEntry));
}

private String formatSQLInput(String strInputEntry){
	if(strInputEntry == null || strInputEntry.equals(""))
		strInputEntry= "";
	else
		strInputEntry.trim();
	if(strInputEntry.length()>0)
	{
		strInputEntry = strInputEntry.replaceAll("%", "");
		strInputEntry = strInputEntry.replaceAll("<", "");
		strInputEntry = strInputEntry.replaceAll(">", "");
		strInputEntry = strInputEntry.replaceAll("\\[", "");
		strInputEntry = strInputEntry.replaceAll("]", "");
		strInputEntry = strInputEntry.replaceAll("=", "");
		strInputEntry = strInputEntry.replaceAll(";", "&");
		strInputEntry = strInputEntry.replaceAll("'", "");
		strInputEntry = strInputEntry.replaceAll("--", "");
		strInputEntry = strInputEntry.replaceAll("xp_", "");
		strInputEntry = strInputEntry.replaceAll("(?i)select", "");
		strInputEntry = strInputEntry.replaceAll("(?i)join", "");
		strInputEntry = strInputEntry.replaceAll("(?i)union", "");
		strInputEntry = strInputEntry.replaceAll("(?i)where", "");
		strInputEntry = strInputEntry.replaceAll("(?i)insert", "");
		strInputEntry = strInputEntry.replaceAll("(?i)delete", "");
		strInputEntry = strInputEntry.replaceAll("(?i)update", "");
		strInputEntry = strInputEntry.replaceAll("(?i)like", "");
		strInputEntry = strInputEntry.replaceAll("(?i)drop", "");
		strInputEntry = strInputEntry.replaceAll("(?i)create", "");
		strInputEntry = strInputEntry.replaceAll("(?i)modify", "");
		strInputEntry = strInputEntry.replaceAll("(?i)rename", "");
		strInputEntry = strInputEntry.replaceAll("(?i)alter", "");
		strInputEntry = strInputEntry.replaceAll("(?i)cast", "");
	}
	return strInputEntry;
}
%>
<%! 
public static Cipher getCipher(
String _synchro1, String _synchro2, String _synchro3, String _synchro4,boolean _isEncryptMode)
throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException{
	byte _raw[] = (_synchro1 + _synchro2 + _synchro3 + _synchro4).getBytes();
	SecretKeySpec _skeySpec = new SecretKeySpec(_raw, "AES");
	Cipher _cipher = Cipher.getInstance("AES");
	if(_isEncryptMode){
		_cipher.init(Cipher.ENCRYPT_MODE,_skeySpec);
	}else{
		_cipher.init(Cipher.DECRYPT_MODE,_skeySpec);
	}  
	return _cipher;
} 

public static byte[] hexToByte(String _hex){
	byte _bts[] = new byte[_hex.length() / 2];
	for(int _i = 0; _i < _bts.length; _i++){
		_bts[_i] = (byte)Integer.parseInt(_hex.substring(2 * _i, 2 * _i + 2), 16);
	}
  return _bts;
}

public static String toHexString(byte _bytes[]){
	StringBuffer _retString = new StringBuffer();
	for(int _i = 0; _i < _bytes.length; _i++)
		_retString.append(Integer.toHexString(256 + (_bytes[_i] & 0xff)).substring(1));
  return _retString.toString();
}

public static String encrypt(String _text) throws InvalidKeyException, NoSuchAlgorithmException, 
NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
	javax.crypto.Cipher _cipher = getCipher("bb5","1860", "17a74", "213f",true);
  return toHexString(_cipher.doFinal(_text.getBytes()));
 }

public static String decrypt(String _text) throws IllegalBlockSizeException, BadPaddingException, 
InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException{
	javax.crypto.Cipher _cipher = getCipher("bb5","1860", "17a74", "213f",false);
	String _st=new String(_cipher.doFinal(hexToByte(_text)));  
 return _st;
}
%>
<% 
String newurl = "" ; 
String strAppPath = "";
String strWebAppURL = "";
String newurl1 = "" ; 

if(Hname.equals("rscbrc")){

 newurl = "http://www.nair.indianrailways.gov.in/" ; 
 strAppPath = "http://www.nair.indianrailways.gov.in/instt/";
 strWebAppURL = "http://www.nair.indianrailways.gov.in/";

}
else{

 newurl = "http://www."+Hname+".indianrailways.gov.in/" ; 
 strAppPath = "http://www."+Hname+".indianrailways.gov.in/instt/";
 strWebAppURL = "http://www."+Hname+".indianrailways.gov.in/";

}


String strAppRealPath = this.getServletContext().getRealPath("/");
java.util.Date timeconn = new java.util.Date() ;
String strLanguage1 = "English";
String strLanguage2 = "Hindi";

/*
newurl = "http://192.168.7.100:8080/CRIS/" ; 
newurl1 = "" ; 
strAppPath = "http://192.168.7.100:8080/CRIS";
strWebAppURL = "http://192.168.7.100:8080/CRIS/";
*/
String strDefaultlangContent1 = "Add English content here";
String strDefaultlangContent2 = "Add Hindi content here";


%>
