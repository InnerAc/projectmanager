<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Refresh" content="2; url=<%=basePath%>${url }"/>
<title>出错啦</title>
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div style="margin:5%;">
		<center>
		<div style="margin-bottom:5%;">
			<h1>${info }</h1>
		</div>
		<div >
			<h3>2秒后跳转到目标页面。</h3>
			<a href=""><h3>点此回到主页</h3></a>
			<br>
			<a href="${url}"><h3>点此回到原来页面</h3></a>
		</div>
		</center>
	</div>
</body>
</html>