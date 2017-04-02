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
		<div class="col-md-2 github_nav">
			<span style="color:black;">大学生课外项目管理系统</span>
		</div>
		</a>
		<div class="col-md-6"></div>
		<div class="col-md-3" style="float:right;margin-top:5px;">
			<a onclick="login();" class="btn">修改头像</a>
			<a href="user/edit" class="btn">修改资料</a>
			<a href="user/logout" class="btn">退出</a>
		</div>
	</div><br>
	<hr>
	<div class="main">
		<div class="col-md-12">
			<button data-toggle="modal" data-target="#addModal" class="btn btn-warning">添加教师</button>
		</div>
	<hr>
		<div class="col-md-12">
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th>登录ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${users }" var="user">
					<tr>
						<td>${user.userid }</td>
						<td>${user.username }</td>
						<td>${user.sex }</td>
						<td>${user.phone }</td>
						<td><a>删除</a>&nbsp&nbsp<a>重置密码</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">添加教师</h4>
			</div>
			<div class="modal-body">
				<form action="admin/add" method=POST class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">登录ID:</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="userid"/>
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
	</div>
	<iframe name="hidden_frame" id="hidden_frame" style="display:none;"></iframe>
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function drop(uid,e){
			$.get('user/drop/'+uid,function(data){
				$(e).parent().parent().remove();
			});
		}
	</script>
</body>
</html>