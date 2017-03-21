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
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/githubinfo.css" rel="stylesheet">
</head>
<body>
	<div class="header" float="left">
		<a href="">
		<div class="col-md-1">
			<img class="img-responsive" src="static/image/logo.png" width="45px;">
		</div>
		<div class="col-md-2 github_nav">
			<span style="color:black;">大学生课外项目管理系统</span>
		</div>
		</a>
		<br>
	</div>
	<hr>
	<div class="col-md-6">
		<form action="user/edit" method=POST class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">学号:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="stunum" value="${me.stunum }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="username" value="${me.username }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码:</label>
				<div class="col-sm-10">
					<input class="form-control" type="password" name="password" value="${me.password }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">手机号:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="phone" value="${me.phone }"/>
				</div>
			</div>
						<div class="form-group">
				<label class="col-sm-2 control-label">邮箱:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="email" value="${me.email }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<button class="btn btn-success" type="submit">修改</button>
					<a href="user/me" class="btn btn-danger">返回</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>