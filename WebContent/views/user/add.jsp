<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<base href="<%=basePath%>">
</head>
<body>
	<form action="user/add" method=POST>
		登录ID:<input type="text" name="userid"/>
		学号:<input type="text" name="stunum"/>
		用户名:<input type="text" name="username"/>
		密码:<input type="password" name="password"/>
		性别:<select>
			<option>男</option>
			<option>女</option>
		</select>
		手机号:<input type="text" name="phone"/>
		<button type="submit">添加</button>
	</form>
</body>
</html>