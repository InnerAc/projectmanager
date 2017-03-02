<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>403</title>
<base href="<%=basePath%>">
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div style="margin:5%;">
		<center>
		<div style="margin-bottom:5%;">
			<img alt="403" class="img-responsive" src="static/image/403.png">
		</div>
		<div >
			<h2>你来到了本不该你访问的页面，请回吧！！</h2>
			<a href=""><h3>点此回到主页</h3></a>
			<br>
			<form class="form-inline">
				<input type="text" class="form-control" placeholder="查找其他项目吧"/>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
		</center>
	</div>
</body>
</html>