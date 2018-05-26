<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">  
table{ width:800px; margin:auto; padding: 5px; font-size:12px; border:0px; background:#990099;}  
tr{ background:#fff;}  
td{ padding: 5px;}  
#title{ text-align:center;}  
</style>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>
<script type="text/javascript">

function  ww(){
    $.ajax({
        type: "GET", 
        url: "Medication/Patient/der.json", 
        success: function(data){
        
        $.each($(".test"),function(){
        $(this).text(data)
        })
        console.log(data);
        }
    })
 }

var ss=setInterval("ww()",500);



</script>
</head>
<body>
<%
   String userName = (String)session.getAttribute("username") ; 
  %>
  <div align="center">
   <%=userName %>
   欢迎您，登陆成功！<br />
   <h1><font color="purple">妖童智能监测</font></h1> 
   <%
   // 设置每隔5秒刷新一次
   response.setIntHeader("Refresh", 10);
   %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/smartMonitor?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="6616"/>
     <sql:query dataSource="${snapshot}" var="result">
     SELECT * from devInfo;
</sql:query>
   <table>
   <tr>
   <th>设备ID</th>
   <th>监测数据</th>
   <th>设备状态</th>
   <th>时间</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.deviceid}"/></td>
   <td><c:out value="${row.data}"/></td>
   <td><c:out value="${row.status}"/></td>
   <td><c:out value="${row.time}"/></td>
</tr>
</c:forEach>
   </table>
   <a href="login.jsp">返回重新登录</a>
   <a href="query.jsp">搜索特定设备</a>
   <a href="printAll.jsp">导出到Excel</a>
  <a href="manage.jsp">管理</a>
  <a href="flowmonitoring.jsp">动态信息</a>
  </div>
</body>
</html>