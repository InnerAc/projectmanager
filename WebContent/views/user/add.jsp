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
		<form action="user/add" method=POST class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">登录ID:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="userid"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">学号:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="stunum"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="username"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码:</label>
				<div class="col-sm-10">
					<input class="form-control" type="password" name="password"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">性别:</label>
				<div class="col-sm-10">
					<select name="sex" class="form-control">
						<option>男</option>
						<option>女</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">手机号:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="phone"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<button class="btn btn-success" type="submit">添加</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>