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
<title>添加项目</title>
<base href="<%=basePath%>">
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/githubinfo.css" rel="stylesheet">
<link href="static/css/flatpickr.min.css" rel="stylesheet">
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
	<form id="projectForm" class="form-horizontal" action="project/${me.uid }/add" method=POST>
		<div class="form-group">
			<label class="col-md-2 control-label">项目名称:</label>
			<div class="col-md-4">
				<input type="text" class="form-control" name="pname" placeholder="项目名">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">管理者:</label>
			<div class="col-md-2">
				
				<input class="form-control" readOnly="true" value="${me.username }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">参与人数:</label>
			<div class="col-md-2">
				<input type="text" class="form-control" name="allnum" placeholder="参与人数">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">活动地点:</label>
			<div class="col-md-4">
				<input type="text" class="form-control" name="local" placeholder="活动地点">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">活动时间:</label>
			<div class="col-md-4">
				<input id="st" class="flatpickr form-control" name="stdate" data-enable-time=true data-time_24hr=true>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">结束时间:</label>
			<div class="col-md-4">
				<input id="en" class="flatpickr form-control" name="endate" data-enable-time=true data-time_24hr=true>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">需要审批:</label>
			<div class="col-md-4">
				<input type="checkbox" name="isjoin">是
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">项目简介:</label>
			<div class="col-md-4">
				<textarea class="form-control" name="pdesc" rows="3"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label"></label>
			<div class="col-md-4">
				<a onclick="commit();" class="btn btn-success">添加</a>
			</div>
		</div>
	</form>
		
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/flatpickr.min.js"></script>
	<script>
		$(".flatpickr").flatpickr();
		var dateFormat = new Flatpickr(document.createElement("input"));
		
		function commit(){
			$('#st').val(dateFormat.formatDate('U',new Date($('#st').val())));
			$('#en').val(dateFormat.formatDate('U',new Date($('#en').val())));
			$('#projectForm').submit();
		}
	</script>
</body>
</html>