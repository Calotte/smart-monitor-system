<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Content-Disposition", "attachment;filename=deviceInfo.xls");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导出到Excel</title>
</head>
<body>
<%
String id= request.getParameter("id");
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/smartMonitor?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="6616"/>
     <sql:query dataSource="${snapshot}" var="result">
     SELECT * from devInfo where DEVICEID=?;
      <sql:param value="${param.id}" />
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
   <form method="post" action="DownloadAsExcel"> 
   </form>
</body>
</html>