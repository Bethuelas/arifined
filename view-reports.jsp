<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
//java Code
String uname = (String)session.getAttribute("cust_name");
String sql = "SELECT acc_no, operation, amt, balance, time1 FROM tx_details WHERE uname='"+uname+"'";
//System.out.println(sql
ArrayList one = BankCommons.getAccountDetailsByName(sql);


//System.out.println(one);
        
int size = one.size();
 if(size < 1) {
	response.sendRedirect("noAcc.jsp");
 
int dum = (size =one.size());      
}
//String data = "SELECT acc_no, operation, amt, balance, time1 FROM tx_details WHERE time1=>'"+date+"'AND time1<='"+date1+"'";
//ArrayList da = BankCommons.getAccountDetailsByDate(data);
%>  
<SCRIPT LANGUAGE="javascript">

var locate = window.location;
document.formr.formr.value = locate;

var text = document.formr.formr.value;

function delineate(str)
{
theleft = str.indexOf("=") + 1;
theright = str.lastIndexOf("&");
return(str.substring(theleft, theright));
}
document.write("Date from  " +delineate(text));
var locate = window.location;
document.formr.formr.value = locate;
var text = document.formr.formr.value;

function delineate2(str)
{
point = str.lastIndexOf("=");
return(str.substring(point+1,str.length));
}
document.write("To  " +delineate2(text));
</script>
<!--
<script>
    function getParams(){
    var idx = document.URL.indexOf('?');
    var params = new Array();
    if (idx !== -1) {
    var pairs = document.URL.substring(idx+1, document.URL.length).split('&');
    for (var i=0; i<pairs.length; i++){
    nameVal = pairs[i].split('=');
    params[nameVal[0]] = nameVal[1];
    }
    }
    return params;
    }
    params = getParams();
    date = unescape(params["range"]);
    date1 = unescape(params["range2"]);
    </script>
-->
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
   <script>
  $(function() {
    $( "#datepicker" ).datepicker({
      dateFormat: 'M dd, yy'});                 
    $( "#datepicker1" ).datepicker({
        dateFormat: 'dd, yy '});
    });
  </script> 

  <script>
      function report(){
          window.open("datereport.jsp","view-reports.jsp");
      }
  </script>
<script type="text/javascript" >
function printExternal() {
printWindow = window.open(  "report.jsp","view-reports.jsp");
setTimeout('printWindow.print()', 2000);
setTimeout('printWindow.close()', 2000);
}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Jirani Sacco Bank</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
html,body{
    background-image: url(images/img.gif);
}
.style2 {color: #FFFFFF; font-weight: bold; }
</style>
</head>

<body>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
  <tr>
    <th colspan="3" scope="col" style="height:90px; background-color:#2cc5bc;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="900" height="90">
      <param name="movie" value="images/banks.swf" />
      <param name="quality" value="high" />
      <embed src="images/banks.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="900" height="90"></embed>
    </object></th>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
<td width="160" >
<div id="ddblueblockmenu">
  <div class="menutitle">Account Operations</div>
  <ul>
    <li><a href="main.jsp">Welcome,&nbsp;<%= (String)session.getAttribute("cust_name")%></a></li>
    <li><a href="account.jsp">Create Account</a></li>
	<li><a href="deposit.jsp">Deposit</a></li>
    <li><a href="withdraw.jsp">Do Withdraw</a></li>
    <li><a href="get-balance.jsp">Get Balance</a></li>
	<li><a href="transfer.jsp">Transfer Amount</a></li>
	<li><a href="view-reports.jsp">View Report</a></li>
	<li><a href="logOff.jsp">LogOut</a></li>
  </ul>
  <div class="menutitle">&nbsp;</div>
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>	</td>
    <td colspan="2" style="padding:20px;line-height:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Jirani Sacco Bank.</font></h2></marquee>
	</div>
        <br/>
         
	<br/>
        
        <form method="link" action="datereport.jsp">
            <font color="#FF00FF">View Reports By date. </font>
  
        FROM <input name="range" type="text" id="datepicker">
        TO   <input name="range2" type="text" id ="datepicker1">
             <input type="Submit" value="Display">
        </form>
        <form id="form1" name="form1" method="post">
	  <table width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="5" bgcolor="#333333" scope="col"><font color="#FFFFFF">Following are the Reports of Your Account(s). </font></th>
        </tr>
        <tr>
          <td colspan="5">&nbsp;</td>
          </tr>
        <tr>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Acc No. </div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Operation</div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Amount</div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Balance</div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Date - Time </div></td>
        </tr>
		<%
		for(int i=0;i<one.size();i++) {
		ArrayList o = (ArrayList)one.get(i); 
		%>
        <tr>
          <td><div align="center"><%=(String)o.get(0)%></div></td>
          <td><div align="center"><%=(String)o.get(1)%></div></td>
          <td><div align="center"><%=(String)o.get(2)%></div></td>
          <td><div align="center"><%=(String)o.get(3)%></div></td>
          <td><div align="center"><%=(String)o.get(4)%></div></td>
        </tr>
		<% } %>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="14%">&nbsp;</td>
          <td width="14%">&nbsp;</td>
          <td width="15%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="41%">&nbsp;</td>
        </tr>
      </table>
      </form>
        <input type='button' value='print' onclick="printExternal()">

	</td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2cc5bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
