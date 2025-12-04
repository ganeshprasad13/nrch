<!--created by karuna singh-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Indian Railway site which helps in enquiry ,travelling,boarding and other railway zonal activities developed by CRIS (Centre For Railway Information).You can get information related to all Zones with their divisions.">

<title>Rwf vedio & document</title>
<style>
.main {
   width: 390px;
   padding: 100px;
   margin: 22px;
   height: 220px;
   background-color: lightblue;
}
.gyaan {
     width: 578px;
	 border: 1px;
	 border-style: solid;
     border-color: #fff;
     padding: 1px;
     margin: -96px;
     height: 25px;
     background-color: pink;
     text-align: center;
     color: DarkBlue;
}
.gyaan2 {
    width: 578px;
    border: 1px;
    border-style: solid;
    border-color: #fff;
    padding: 1px;
    margin: 96px;
    margin-left: 96px;
    height: 25px;
    background-color: pink;
    margin-left: -96px;
    
}
 .radio{
     padding: 1px;
     margin-left: -55px;
     margin-top: -77px;
    
}
table {
    border-collapse: collapse;
	background-color: #fff;
}

table, td, th {
    border: 1px solid black;
}
</style>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		function validate(value)
		{			
			if(value == 1) {				
				$("#doc").hide();
				
				$("#video").show();
			}
			else {				
				$("#video").hide();
				$("#doc").show();
				
			}
			
			
			
		}

function validate1(value)
		{			
			if(value == 3) {				
				$("#faq").hide();
				
				$("#trouble").hide();
				$("#doc").hide();
				
				$("#video").hide();
			}
			else {				
				$("#trouble").hide();
				$("#faq").hide();
				
			}
			
			
			
		}		
	</script>
</head>

<body bgcolor="#FFFAFA">
<div class="main">
<div class="gyaan">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gyaan-Knowledge Bank</div>
<div class="gyaan2"></div>

<div class="radio" > 
<tr>
				
				<td>
					<input type="radio" name="radio" value="1" checked="checked" onclick="validate(this.value)"/> vidio 
					<input type="radio" name="radio" value="2" onclick="validate(this.value)"/> Document
				    <input type="radio" name="radio" value="3" onclick="validate1(this.value)"/> Trouble Shooting 
					<input type="radio" name="radio" value="4" onclick="validate1(this.value)"/> FAQ's
				
				</td>
			</tr>

</div>

<br></br>
<div width="350px" id="video">
<table width="350">


<tr>
    <th bgcolor="#B8860B">S.N</th>
    <th bgcolor="#B8860B">Video</th>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">1</td>
    <td bgcolor="#FFF8DC"><a href="Axle1.mp4" target="_blank">Axle1</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">2</td>
    <td bgcolor="#FFF8DC"><a href="Axle2.mp4" target="_blank">Axle2</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">3</td>
    <td bgcolor="#FFF8DC"><a href="Blue matching.mp4" target="_blank">Blue matching</a></td>
  </tr>



  <tr>
    <td bgcolor="#FFF8DC">4</td>
    <td bgcolor="#FFF8DC"><a href="stn 2 cnc (1) 16092017.mp4" target="_blank">stn 2 cnc (1) 16092017</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">5</td>
    <td bgcolor="#FFF8DC"><a href="stn 2 cnc (2) 16092017.mp4" target="_blank">stn 2 cnc (2) 16092017</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">6</td>
    <td bgcolor="#FFF8DC"><a href="stn 2 cnc (3) 16092017.mp4" target="_blank">stn 2 cnc (3) 16092017</a></td>
  </tr>

  <tr>
    <td bgcolor="#FFF8DC">7</td>
    <td bgcolor="#FFF8DC"><a href="stn 2 cnc (4)16092017.mp4" target="_blank">stn 2 cnc (4)16092017</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">8</td>
    <td bgcolor="#FFF8DC"><a href="stn 2 cnc (3108.2017) 16092017.mp4" target="_blank">stn 2 cnc (31.08.2017) at 10;15 am 16092017</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">9</td>
    <td bgcolor="#FFF8DC"><a href="VID_20170901_141610 16092017.mp4" target="_blank">VID_20170901_141610 16092017</a></td>
  </tr>
  <tr>
    <td bgcolor="#FFF8DC">10</td>
    <td bgcolor="#FFF8DC"><a href="VID_20170901_154826 16092017.mp4" target="_blank">VID_20170901_154826 16092017</a></td>
  </tr>




</table>
</div>
<br></br>
<div width="350px" id="doc" style="display:none">
	<table width="350">
	  <tr>
		<th bgcolor="#B8860B">S.N</th>
		<th bgcolor="#B8860B">Document</th>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">1</td>
		<td bgcolor="#FFF8DC"><a href="SWL PRESENTATION.ppt">SWL PRESENTATION</a></td>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">2</td>
		<td bgcolor="#FFF8DC"><a href="VTL Presentation.ppt">VTL Presentation</a></td>
	  </tr>
	</table>
</div>


<div width="350px" id="trouble" style="display:none">
	<table width="350">
	  <tr>
		<th bgcolor="#B8860B">S.N</th>
		<th bgcolor="#B8860B">Trouble Shooting</th>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">1</td>
		<td bgcolor="#FFF8DC"><a href="SWL PRESENTATION.ppt">SWL PRESENTATION</a></td>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">2</td>
		<td bgcolor="#FFF8DC"><a href="VTL Presentation.ppt">VTL Presentation</a></td>
	  </tr>
	</table>
</div>

<div width="350px" id="faq" style="display:none">
	<table width="350">
	  <tr>
		<th bgcolor="#B8860B">S.N</th>
		<th bgcolor="#B8860B">FAQ's</th>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">1</td>
		<td bgcolor="#FFF8DC"><a href="SWL PRESENTATION.ppt">SWL PRESENTATION</a></td>
	  </tr>
	  <tr>
		<td bgcolor="#FFF8DC">2</td>
		<td bgcolor="#FFF8DC"><a href="VTL Presentation.ppt">VTL Presentation</a></td>
	  </tr>
	</table>
</div>
</div>
</body>
</html>



