<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.username }</title>
</head>
<body>
	<p>${user.userid }</p>
	<p>${user.stunum }</p>
	<p>${user.username }</p>
	<p>${user.sex }</p>
	<p>${user.phone }</p>
	<hr>
	<c:forEach items="${labels }" var="label">
		<a href="adl/${user.uid }/${label.lid}">${label.lname }</a>
	</c:forEach>
</body>
</html>