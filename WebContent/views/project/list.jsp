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
		<div class="col-md-4"></div>
		<div class="col-md-3">
		</div>
		<div class="col-md-2 github_nav" style="float:right;">
			<c:if test="${me==null }">
				<button onclick="login();" class="btn btn-info">登录</button>
				<a href="user/add" class="btn btn-success">注册</a>
			</c:if>
			<c:if test="${me!=null }">
				<span><a href="user/me">${me.username }</a></span>
				<span><a href="user/logout">登出</a></span>
			</c:if>
		</div>
	</div>
	<br>
	<div class="col-md-4 divLoginPop">
		<div class="panel panel-default">
			<div class="panel-body">
				<form action="user/login" method="post">
					<div class="form-group">
						<label for="username">用户名</label>
						<input type="text" name="userid" class="form-control" laceholder="UserName">
					</div>
					<div class="form-group">
						<label>密码</label>
						<input type="password" name="password" class="form-control" placeholder="Password">
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">记住我
						</label>
					</div>
					<button type="submit" class="btn btn-info">登录</button>
					<a onclick="unLogin();" class="btn btn-success" >取消</a>
				</form>
				</div>
			</div>
			</div>
	<hr>
	
	<div class="main">
		<div class="row">
			<div class="col-md-12">
			<center>
				<form class="form-inline" action="project/search" method="POST">
					<div class="form-group">
						<input name="pname" type="text" class="form-control" placeholder="Search">
					</div>
					<div class="form-group">
						<input type="checkbox" name="isjoin">无需批准
					</div>
					<div class="form-group">
						<input type="radio" name="bynum" value="true">人数不足
						<input type="radio" name="bynum" value="false">按照日期
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</center>
			</div>
		</div>
		<hr>
		<div class="row">
		
			<c:forEach items="${projects }" var="project">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a target="_blank" href="project/info/${project.pid }">${project.pname }</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：${project.manager.username }</label><br>
							<label>活动日期：<time class="time">${project.stdate }</time></label><br>
							<label>参与方式：
								<c:if test="${project.isjoin }">需要批准</c:if>
								<c:if test="${!project.isjoin }">无需批准</c:if>
							</label><br>
							<label>参与人数：${project.joinnum }/${project.allnum }</label><br>
							<label>标签：<c:forEach items="${project.labels }" var="ul">${ul.lname } </c:forEach></label><br>
							<span>
								${project.pdesc }
							</span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/pm.js"></script>
	<script type="text/javascript">
		$(".divCarousel").height($(".divCarousel").width()/2);
		$(".divProject").height($(".divProject").width()/2.5);
	</script>
	<script type="text/javascript">
		timeChange();
	</script>
</body>
</html>