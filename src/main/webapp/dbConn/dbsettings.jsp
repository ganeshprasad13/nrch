<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"  %>
<%@ page import= "java.io.*" %>
<%@ page import="java.text.*"  %>
<%@ page import="java.util.regex.*"  %>
<%@ page import="java.security.InvalidKeyException" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="javax.crypto.*" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>


<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<%! String mailserver = ""; %>



<% 
//out.print(request.getServerName());

String DBname ="cris-nrch";
String Hname ="irpginrch";





%>
<%! String JDBC_DRIVER  = "com.mysql.jdbc.Driver"; %>
<% String JDBC_URL =  "jdbc:mysql://10.64.29.248:3306/"+"cris-nrch"+"?user=mysql&password=03Knight1z991@&useUnicode=true&characterEncoding=UTF8";  %>
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
	Cipher _cipher = getCipher("bb5","1860", "17a74", "213f",true);
  return toHexString(_cipher.doFinal(_text.getBytes()));
 }

public static String decrypt(String _text) throws IllegalBlockSizeException, BadPaddingException, 
InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException{
	Cipher _cipher = getCipher("bb5","1860", "17a74", "213f",false);
	String _st=new String(_cipher.doFinal(hexToByte(_text)));  
 return _st;
}
%>

<% 

String newurl = "http://localhost:8080/nrch/" ; 
String newurl1 = "" ; 
String strAppPath = "http://localhost:8080/nrch/" ; 
String strWebAppURL ="http://localhost:8080/nrch/" ; 
String strAppRealPath = application.getRealPath("/");
java.util.Date timeconn = new java.util.Date() ;
String strLanguage1 = "English";
String strLanguage2 = "Hindi";




/*
newurl = "http://192.168.7.100:8080/IRTS/" ; 
newurl1 = "" ; 
strAppPath = "http://192.168.7.100:8080/IRTS";
strWebAppURL = "http://192.168.7.100:8080/IRTS/";
*/
String strDefaultlangContent1 = "Add English content here";
String strDefaultlangContent2 = "Add Hindi content here";
%>