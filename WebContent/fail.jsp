<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录失败</title>
</head>
<body>
<%
   String userName = (String)session.getAttribute("username") ;
   String msg  = (String)session.getAttribute("message") ;
  %>
  <div align="center">
   <%=userName %>
   对不起，登陆失败！<br />
   <font color="red">原因： </font>
   <%=msg %>
   <br/>
   <br/>
   即将返回登陆界面。
  </div> 
   <%
     response.setHeader("Refresh","5;URL=login.jsp");  
    %>
</body>
</html>