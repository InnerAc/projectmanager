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
	<hr>
	
	<div class="main">
		<div class="row">
			<c:forEach items="${projects }" var="project">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a target="_blank" href="project/info/${project.pid }">${project.pname }</a>
						<div style="float:right;margin-top: -7px;">
							<button onclick="pass(this,${project.pid})" class="btn btn-info">批准</button>&nbsp;&nbsp;<button  onclick="deny(this,${project.pid})" class="btn btn-danger">驳回</button>
						</div>
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
	<script>
		function pass(e,pid){
			$.get("project/pass/"+pid,function(data){
				$(e).parent().html("已批准");
			});
		}
		function deny(e,pid){
			$.get("project/deny/"+pid,function(data){
				$(e).parent().html("已驳回");
			});
		}
	</script>
</body>
</html>