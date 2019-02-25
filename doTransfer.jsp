<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
//java Code

String uname = (String)session.getAttribute("cust_name");
String date = (new java.util.Date()).toLocaleString();
//String uname = request.getParameter("uname");
int accno = Integer.parseInt(request.getParameter("accNo"));
int daccno = Integer.parseInt(request.getParameter("daccNo"));
int amt = Integer.parseInt(request.getParameter("Amount"));
String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
int bal = BankCommons.getBalance(bal_sql);
String n = BankCommons.getNameByNo("SELECT uname FROM acc_details WHERE acc_no = "+daccno);
String bal_sql_1 = "SELECT balance FROM tx_details WHERE uname='"+n+"' AND acc_no = "+daccno+" AND isnew = 'YES'";
int bal_2 = BankCommons.getBalance(bal_sql_1);

int bal1=0;

if(bal < amt ){
	//System.out.println("Current Balance : "+bal);
	response.sendRedirect("lowBal.jsp");
}else if(bal == 0){
	response.sendRedirect("noBal.jsp");
}else {
	bal1 = bal - amt;
	String sql_up = "UPDATE tx_details SET isnew = 'NO' WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
	int up = BankCommons.update(sql_up);
	String sql3 = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew ) VALUES ('"+uname+"',"+accno+",'WITHDRAW',"+amt+","+bal1+", '"+date+"', 'YES')";
	int update = BankCommons.update(sql3);
	//deposit into other account
	BankCommons.update("UPDATE tx_details SET isnew = 'NO' WHERE uname='"+n+"' AND acc_no = "+daccno+" AND isnew = 'YES'");
	bal_sql_1 = bal_sql_1 + amt;
	String sql = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew ) VALUES ('"+n+"',"+daccno+",'DEPOSIT',"+amt+","+bal_sql_1+", '"+date+"', 'YES' )";
	int u = BankCommons.update(sql);

}

%>
<script type="text/javascript" >
function printExternal() {
printWindow = window.open(  "Receipt.jsp","doTransfer.jsp");
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
        <input type='button' value='print Receipt' onclick="printExternal()">
	<br/>
	<div class="box2">
            Your Amount <font  color="#FF0000"><%=amt%>&nbsp;KES.</font> is Successfully Transfered to Account <font color="#FF0000"><%=daccno%></font><br/>
	To Deposit Amount in Your Account <a href="deposit.jsp">Click Here</a><br/>
	To Withdraw From Account <a href="withdraw.jsp">Click Here</a>
	</div>
	</td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2cc5bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
