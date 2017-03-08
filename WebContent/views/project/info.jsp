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
<title>${project.pname }</title>
<base href="<%=basePath%>">
</head>
<body>
	<p>${project.pname }</p>
	<p>${project.pdesc }</p>
	<p>${project.manager.username }</p>
	<p><c:forEach items="${project.labels }" var="ul">${ul.lname },</c:forEach></p>
	<hr>
	<c:forEach items="${labels }" var="label">
		<a href="project/adl/${project.pid }/${label.lid}">${label.lname }</a>
	</c:forEach>
	<hr>
</body>
</html>