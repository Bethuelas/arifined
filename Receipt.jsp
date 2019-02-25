<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
String uname = (String)session.getAttribute("cust_name");

String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"'";
//int amt = Integer.parseInt(request.getParameter("Amount"));
int bal = BankCommons.getBalance(bal_sql);
//System.out.println(sql);
%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>Transaction receipt</title>
    </head>
    <body>
        
      
	<h2><font color="#FF0000">Jirani Sacco Bank.</font></h2>
	----------------------------------------------------------
        <br/> 
         
	<br/>
        <%= (String)session.getAttribute("cust_name")%><br/>
        -------------------------------------------------------
	<br/>

        Your Transaction was successful.<br/> 
        
        Your current Balance is:
        <font color="#FF0000"><%=bal%> KES<br/></font>
        ____________________________________
    </body>
</html>
