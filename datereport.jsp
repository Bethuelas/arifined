 <%@ ge contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>

<%
//java Code

String uname = (String)session.getAttribute("cust_name");
String date0 = request.getParameter("range");
String date1 = request.getParameter("range2");
String data = "SELECT acc_no, operation, amt, balance, time1 FROM tx_details WHERE time1 < '"+date1+"'AND time1 > '"+date0+"' AND uname='"+uname+"'";
System.out.println(data);
ArrayList one = BankCommons.getAccountDetailsByDate(data);

System.out.println(one);
%>
<script>
function delineate(str)
{
theleft = str.indexOf("=") + 1;
theright = str.lastIndexOf("&");
return(str.substring(theleft, theright));
}
var locate = window.location;
document.formr.formr.value = locate;
var text = document.formr.formr.value;

function delineate2(str)
{
point = str.lastIndexOf("=");
return(str.substring(point+1,str.length));
}
</script>
<input type='button' value='print out' onclick="window.print()">
        <form id="form1" name="form1" method="post">
            <input type="hidden" name="formr">
	  <table width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="5" bgcolor="#333333" scope="col"><font color="#FFFFFF">Following are the Reports of Your Account(s).<%=uname%> </font></th>
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
