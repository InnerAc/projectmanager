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
		<div class="col-md-1">
			<img class="img-responsive" src="static/image/logo.png" width="45px;">
		</div>
		<div class="col-md-6 github_nav">
			<span>大学生课外项目管理系统</span>
		</div>
		<div class="col-md-3">
		<form class="form-inline" style="padding-top:5px;">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
		</div>
		<div class="col-md-2 github_nav" style="float:right;">
			<c:if test="${me==null }">
				<button onclick="login();" class="btn btn-info">登录</button>
				<button class="btn btn-success">注册</button>
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
				<div id="myCarousel" class="carousel slide divCarousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>   
					<div class="carousel-inner">
						<div class="item active">
							<img src="static/image/2.jpg" alt="First slide" class="img-responsive">
						</div>
						<div class="item">
							<img src="static/image/2.jpg" alt="Second slide">
						</div>
						<div class="item">
							<img src="static/image/2.jpg" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control left" href="#myCarousel" 
					   data-slide="prev">&lsaquo;</a>
					<a class="carousel-control right" href="#myCarousel" 
					   data-slide="next">&rsaquo;</a>
				</div> 
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
							<label>活动日期：${project.stdate }</label><br>
							<label>参与方式：
								<c:if test="${project.isjoin }">需要批准</c:if>
								<c:if test="${!project.isjoin }">无需批准</c:if>
							</label><br>
							<label>参与人数：${project.joinnum }/${project.allnum }</label><br>
							<span>
								${project.pdesc }
							</span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			

			<div class="col-md-12">
			<center>
			<ul class="pagination">
				<c:if test="!${page eq 1 }">
				<li><a href="?p=${page-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach var="p" begin="1" end="${pages }" step="1">
					<li
					<c:if test="${p eq page}">
						class="active"
					</c:if>
					><a href="?p=${p }">${p }</a></li>
				</c:forEach>
				<c:if test="!${page eq pages }">
					<li><a href="?p=${page+1 }">&raquo;</a></li>
				</c:if>
			</ul>
			</center>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(".divCarousel").height($(".divCarousel").width()/2);
		$(".divProject").height($(".divProject").width()/2.5);
	</script>
	<script>
		function login(){
			$(".divLoginPop").show();
		}
		function unLogin(){
			$(".divLoginPop").hide();
		}
	</script>
</body>
</html>