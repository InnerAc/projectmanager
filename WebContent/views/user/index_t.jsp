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
			<img class="img-responsive" src="image/logo.gif" width="45px;">
		</div>
		<div class="col-md-6 github_nav">
			<span><a href="#">Personal</a></span>
			<span><a href="#">Open Source</a></span>
			<span><a href="#">Business</a></span>
		</div>
		<div class="col-md-3">
		<form class="form-inline" style="padding-top:5px;">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
		</div>
		<div class="col-md-2 github_nav">
			<span><a>Sign In</a></span>
			<span> or</span>
			<span><a>Sign Up</a></span>
		</div>
	</div><br>
	<hr>
	<div class="main">
	<div class="col-md-2">
		<a href="#"><img src="image/avatar.jpg" class="img-rounded" width="100%"></a>
		<h2>InnerAc</h2>
		<span>Don't fear the unknow</span>
		<hr>
		<div>
			<ul class="info_ul">
				<li>
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span> HHU
				</li>
				<li>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> JiangSu NanJing HoHai University
				</li>
				<li>
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> innerac@hhu.edu.cn
				</li>
				<li>
					<span class="glyphicon glyphicon-link" aria-hidden="true"></span> <a href="http://innerac.github.io">http://innerac.github.io</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="col-md-9">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#overview" data-toggle="tab">
			Overview
		</a></li>
		<li><a href="#repositories" data-toggle="tab">
			Repositories 
			<span class="badge">42</span>
		</a></li>
		<li><a href="#stars" data-toggle="tab">
			Stars 
			<span class="badge">16</span>
		</a></li>
		<li><a href="#follower" data-toggle="tab">
			Follower 
			<span class="badge">25</span>
		</a></li>
		<li><a href="#following" data-toggle="tab">
			Following 
			<span class="badge">10</span>
		</a></li>
	</ul>
	<div class="tab-content" style="margin-top:24px;">
		<div class="tab-pane fade in active" id="overview">
			<p style="font-size:20px;">Popular repositories </p>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="#">GradeQuery</a><br>
				<span class="destr">
					This is a django project for grade point query,
					This is a django project for grade point query,
					This is a django project for grade point query
				</span>
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Java &nbsp&nbsp&nbsp&nbsp
				<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 4
			</div>
			</div>
		</div>
		<div class="tab-pane fade" id="repositories">
    	</div>
		<div class="tab-pane fade" id="stars">
		</div>
		<div class="tab-pane fade" id="follower">
		</div>
	</div>
	</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>