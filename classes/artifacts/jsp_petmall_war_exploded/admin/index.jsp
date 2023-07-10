<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid" style=" width: 1381px;height: 680px;background: url(/images/img_2.png) no-repeat ;background-size: cover;">

	




<jsp:include page="header.jsp"></jsp:include>

	<br><br>

		<div class="alert alert-success" role="alert" style=" align-items: center;width: 400px; height:400px;border-radius: 200px; display: flex; margin-left: 20px"><p style="margin: 0 auto; font-size: 20px">亲爱的管理员 ${user.name } 恭喜你! 登录成功了!</p></div>


	
</div>	
</body>
</html>