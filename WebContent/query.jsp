<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
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
<title>搜索特定设备</title>
</head>
<body>
  <div align="center">
   <h1><font color="purple">妖童智能查询</font></h1>
    <form method=post name="queryDev">  
    <strong>设备 ID： </strong>  <input type="text" name="id" /><br/><p>
    <input type="submit" value="提交" onClick="return validateInput()" /><p>  
 </form>
 <script language="javascript">
   function validateInput(){
    var devID = document.queryDev.id.value ;
    if (devID ==""){
     alert("请输入设备ID号!");
     return false ;
    }    
   }
  </script>
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
    <a href="success.jsp">返回</a><p>
   <form action="printExcel.jsp" method=post name="queryDev">  
    <strong>请输入要下载的设备ID：</strong><input type="text" name="id" /><br/><p>
    <input type="submit" value="下载Excel格式" onClick="return validateInput()" /><p>  
 </form>
   </div>
</body>
</html>