<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设备管理</title>
</head>
<body>
<div align="center">
   <h1><font color="purple">妖童智能管理</font></h1>
   <form method=post name="updateDev">  
     设备&nbsp;ID：   <input type="text" name="id" /><br/><p>
     设备状态:<select name="dev_status">
    <option value="ON">开启</option>
    <option value="OFF">关闭</option>
  </select>    
     <input type="submit" value="提交" onClick="return validateDevInfo()" /><p>  
 </form>
 <script language="javascript">
   function validateDevInfo(){
    var devID = document.updateDev.id.value ;
    if (devID ==""){
     alert("请输入设备ID号!");
     return false ;
    }    
   }
  </script>
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/smartMonitor?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="6616"/>
    <sql:update dataSource="${snapshot}" var="count">
  UPDATE devInfo SET status = ? WHERE DEVICEID = ?
   <sql:param value="${param.dev_status}" />
  <sql:param value="${param.id}" />
</sql:update>
<a href="success.jsp">返回</a><p>
   </div>
</body>
</html>