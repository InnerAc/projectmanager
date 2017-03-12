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
<title>${user.username }</title>
<base href="<%=basePath%>">
</head>
<body>
	<%=basePath %>
	<p>${user.userid }</p>
	<p>${user.stunum }</p>
	<p>${user.username }</p>
	<p>${user.sex }</p>
	<p>${user.phone }</p>
	<p><c:forEach items="${user.labels }" var="ul">${ul.lname },</c:forEach></p>
</body>
</html>