<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello</title>
<script type="text/javascript" src="js/comet4j-0.0.2.js"></script>  
<script type="text/javascript">  
function init(){  
    
    var number1 = document.getElementById('number1');  
    var number2 = document.getElementById('number2');  
    // 建立连接，push 即web.xml中 CometServlet的<url-pattern>  
    JS.Engine.start('CometServlet');  
    // 监听后台某个频道  
    JS.Engine.on(  
           {   
               // 对应服务端 “频道1” 的值 channel1  
               channel1 : function(num1){  
                   number1.innerHTML = num1;  
            },  
            // 对应服务端 “频道2” 的值 channel2  
            channel2 : function(num2){  
                   number2.innerHTML = num2;  
            },  
        }  
       );  
}  
</script>  
</head>
<body onload="init()">
  数字1：<span id="number1">...</span><br></br>  
   数字2：<span id="number2">...</span>  
</body>
</html>