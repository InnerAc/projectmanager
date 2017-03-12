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
<title>${me.username }</title>
<base href="<%=basePath%>">
</head>
<body>
	<%=basePath %>
	<p>${me.userid }</p>
	<p>${me.stunum }</p>
	<p>${me.username }</p>
	<p>${me.sex }</p>
	<p>${v.phone }</p>
	<p><c:forEach items="${me.labels }" var="ul">${ul.lname },</c:forEach></p>
	<hr>
	<c:forEach items="${labels }" var="label">
		<a href="user/adl/${user.uid }/${label.lid}">${label.lname }</a>
	</c:forEach>
	<hr>
	<a href="project/${me.uid }/add">创建项目</a>
</body>
</html>