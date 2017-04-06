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
<title>${user.username }</title>
<base href="<%=basePath%>">
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/githubinfo.css" rel="stylesheet">
</head>
<body>
	<div class="header" float="left">
		<jsp:include page="../header.jsp"/><div class="col-md-2"></div>
		<div class="col-md-3">
		</div>
		<div class="col-md-3" style="float:right;margin-top:5px;">
			<a style="float:right;" href="user/logout" class="btn">退出</a>
		</div>
	</div><br>
	<div class="col-md-4 divLoginPop">
		<div class="panel panel-default">
			<div class="panel-body">
				<form id="avatarForm" action="user/avatar" enctype="multipart/form-data" method="post" target="hidden_frame">
					<input class="form-control" name="file" type="file">
					<br>
					<a onclick="avatar();" class="btn btn-info">修改</a>
					<a onclick="unLogin();" class="btn btn-success" >取消</a>
				</form>
				</div>
			</div>
			</div>
	<hr>
	<div class="main">
	<div class="col-md-2">
		<a href="#"><img src="static/avatar/${user.avatar }" class="img-rounded" width="100%"></a>
		<h2>${user.username }</h2>
		<span>
			<span style="cursor:pointer;" data-toggle="modal" data-target="#labelModal" class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp <c:forEach items="${user.labels }" var="ul">${ul.lname },</c:forEach>
		</span>
		<hr>
		<div>
			<ul class="info_ul">
				<li>
					<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp ${user.stunum }
				</li>
				<li>
					<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>&nbsp ${user.phone }
				</li>
				<li>
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp ${user.email }
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
				<span>活动日期：<time class="time">${jpro.stdate }</time></span>
				<span class="destr">
					${jpro.pdesc }
				</span>
				<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
				<span>&nbsp <c:forEach items="${jpro.labels }" var="ul">${ul.lname },</c:forEach></span>
			</div>
			</div>
			</c:forEach>
		</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/pm.js"></script>
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