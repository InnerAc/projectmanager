<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>标签展示</title>
</head>
<body>
	<table>
		<c:forEach items="${labels }" var="label">
			<tr>
				<td>${label.lid }</td>
				<td>${label.lname }</td>
				<td>${label.lweight }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>