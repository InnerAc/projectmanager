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
<title>大学生课外管理系统</title>
<base href="<%=basePath%>">
</head>
<body>
	<c:if test="${me==null }">
		<form action="user/login" method="post">
			<input type="text" name="userid">
			<input type="password" name="password">
			<button type="submit">提交</button>
		</form>
	</c:if>
	<c:if test="${me!=null }">
		<p>${me.userid }</p>
		<p>${me.stunum }</p>
		<p>${me.username }</p>
		<a href="user/logout">登出</a>
	</c:if>
	<form action="upload" enctype="multipart/form-data" method=POST>
		<input type="file" name="file">
		<button type="submit">上传</button>
	</form>
</body>
</html>