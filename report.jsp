
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
//java Code

String uname = (String)session.getAttribute("cust_name");
String sql = "SELECT acc_no, operation, amt, balance, time1 FROM tx_details WHERE uname='"+uname+"'";
//System.out.println(sql);
ArrayList one = BankCommons.getAccountDetailsByName(sql);
//System.out.println(one);
int size = one.size();
if(size < 1) {
	response.sendRedirect("noAcc.jsp");
}
%>
<html>
    <head>
        
        <title>Report</title>
    </head>
    <body>
       
	<h2><font color="#FF0000">Jirani Sacco Bank.</font></h2>
	<br/>
	<br/>
	<form id="form1" name="form1" method="post" action="get-balance-fanal.jsp">
	  <table width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
            
          
            <th colspan="5" bgcolor="#333333" scope="col"><font color="#FFFFFF">Following are the Reports of Your Account(s).&nbsp;<%= (String)session.getAttribute("cust_name")%> </font></th>
        </tr>
        <tr>
          <td colspan="5">&nbsp;</td>
          </tr>
        <tr>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Acc No. </div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Operation</div></td>
          <td bgcolor="#2cc5BC"><div align="center" class="style2">Amt</div></td>
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
    </body>
</html>
