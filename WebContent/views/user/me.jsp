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
<title>${me.username }</title>
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
		<div class="col-md-6 github_nav">
			<span style="color:black;">大学生课外项目管理系统</span>
		</div>
		</a>
		<div class="col-md-2"></div>
		<div class="col-md-3" style="float:right;">
		<form class="form-inline" style="padding-top:5px;">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="检索用户项目">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
		</div>
	</div><br>
	<hr>
	<div class="main">
	<div class="col-md-2">
		<a href="#"><img src="static/avatar/${me.avatar }.jpg" class="img-rounded" width="100%"></a>
		<h2>${me.username }</h2>
		<span>
			<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp <c:forEach items="${me.labels }" var="ul">${ul.lname },</c:forEach>
		</span>
		<hr>
		<div>
			<ul class="info_ul">
				<li>
					<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp ${me.stunum }
				</li>
				<li>
					<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>&nbsp ${me.phone }
				</li>
				<li>
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp ${me.email }
				</li>
			</ul>
		</div>
	</div>
	<div class="col-md-9">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#manager" data-toggle="tab">
			管理的项目
			<span class="badge">${mnum }</span>
		</a></li>
		<li><a href="#joined" data-toggle="tab">
			参与的项目
			<span class="badge">${jnum }</span>
		</a></li>
	</ul>
	<div class="tab-content" style="margin-top:24px;">
		<div class="tab-pane fade in active" id="manager">
			<p style="font-size:20px;"><a target="_blank" href="project/${me.uid }/add" class="btn btn-default">申请新项目<span class="glyphicon glyphicon-open-file"></span></a></p>
			
			<c:forEach items="${mpros }" var="mpro">
			<div class="col-md-4 repo_left" style="margin-bottom:0;">
			<div class="panel panel-default panel-body">
				<a href="project/info/${mpro.pid }">${mpro.pname }</a><br>
				<span>项目状态：${mpro.statu }</span><br>
				<span>活动日期：<time class="time">${mpro.stdate }</time></span>
				<span class="destr">
					${mpro.pdesc }
				</span>
				<span class="glyphicon glyphicon-tags" aria-hidden="true" style="font-size:16px;"></span>
				<span>&nbsp <c:forEach items="${mpro.labels }" var="ul">${ul.lname },</c:forEach></span>
			</div>
			</div>
			</c:forEach>
		</div>
		<div class="tab-pane fade" id="joined">
			<c:forEach items="${jpros }" var="jpro">
			<div class="col-md-4 repo_left">
			<div class="panel panel-default panel-body">
				<a href="project/info/${jpro.pid }">${jpro.pname }</a><br>
				<span>项目状态：${jpro.statu }</span><br>
				<span>活动日期：${jpro.stdate }</span>
				<span class="destr">
					${jpro.pdesc }
				</span>
				<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
				<span>&nbsp <c:forEach items="${mpro.labels }" var="ul">${ul.lname },</c:forEach></span>
			</div>
			</div>
			</c:forEach>
		</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script>
		var times = $('time');
		var tn = times.length;
		for(var i=0;i<tn;i++){
			var time = $(times[i]);
			console.log('time = '+time.html());
			var nd = new Date(time.html()*1000).toLocaleString().replace(/:\d{1,2}$/,' ').replace(/..午/,' ');
			console.log(nd);
			time.html(nd);
		}
	</script>
</body>
</html>