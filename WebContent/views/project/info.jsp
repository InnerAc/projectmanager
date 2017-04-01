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
<title>${project.pname }</title>
<base href="<%=basePath%>">
<link href="static/comp/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/githubinfo.css" rel="stylesheet">
</head>
<body>
	<div class="header" float="left">
		<jsp:include page="../header.jsp"/><div class="col-md-3"></div>
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
			<h3>${project.pname }(${project.statu })</h3>
			<div class="col-md-6">
				<img class="img-responsive" src="static/poster/${project.poster }">
			</div>
			<div class="col-md-4">
				<label>举办人：<a href="user/info/${project.manager.userid }">${project.manager.username }</a></label><br>
				<label>活动日期：<time class="time">${project.stdate }</time></label><br>
				<label>结束日期：<time class="time">${project.endate }</time></label><br>
				<label>参与方式：
					<c:if test="${project.isjoin }">需要批准</c:if>
					<c:if test="${!project.isjoin }">无需批准</c:if>
				</label><br>
				<label>参与人数：${project.joinnum }/${project.allnum }</label><br>
				<label>标签：</label><p id="tagP"><c:forEach items="${project.labels }" var="ul"><a class="btn btn-default">${ul.lname }</a></c:forEach></p>
				<hr>
				<div id="tagBase" style="display:none;">
				<c:forEach items="${labels }" var="label">
					<a class="btn btn-default" onclick="addTag(${project.pid },${label.lid},this)">${label.lname }</a>
				</c:forEach>
				</div>
			</div>
			<div class="col-md-2">
				<c:if test="${me!=null }">
				<c:if test="${project.statu eq '准备中...' }">
				<button id="joinBtn" onclick="joinIt(${project.pid});" class="btn btn-success">报名</button><br><br>
				</c:if>
				<c:if test="${me.uid == project.manager.uid }">
				<button class="btn btn-warning"  data-toggle="modal" data-target="#posterModal">上传海报</button><br><br>
				<button onclick="$('#tagBase').toggle();" class="btn btn-info">添加标签</button><br><br>
				</c:if>
				</c:if>
			</div>
			<div class="col-md-12">
			<hr>
				<span>
					${project.pdesc }
				</span>
			</div>
		</div>
		<hr>
		<div class="row" id="joinUser">
			<h4>参与人员</h4>
			<c:forEach items="${jusers }" var="juser">
				<div class="col-md-2">
					<div class="col-sm-6">
						<a target="_blank" href="user/info/${juser.userid }">
						<img class="img-responsive img-circle" src="static/avatar/${juser.avatar }">
						</a>
					</div>
					<div class="col-sm-6">
						${juser.username }
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${me.uid == project.manager.uid }">
		<hr>
		<div class="row">
			<h4>待批准人员</h4>
			<c:forEach items="${users }" var="user">
				<div class="col-md-2">
					<div class="col-sm-6">
						<a target="_blank" href="user/info/${user.userid }">
						<img class="img-responsive img-circle" src="static/avatar/${user.avatar }">
						</a>
					</div>
					<div class="col-sm-6">
						${user.username }<br>
						<span onclick="agree(${project.pid},${user.uid },this);" style="cursor:pointer;" class="glyphicon glyphicon-ok" aria-hidden="true">批准</span>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
	<div class="modal fade" id="posterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">上传宣传图片（1张）</h4>
			</div>
			<div class="modal-body">
				<form id="upposter" action="project/${project.pid }/poster" enctype="multipart/form-data" method="POST" target="hidden_frame">
					<input class="form-control" name="file" type="file">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="upposter();" type="button" class="btn btn-primary">提交更改</button>
			</div>
		</div>
	</div>
	</div>
	<div id="labelIds" style="display:none"><c:forEach items="${project.labels }" var="ul">${ul.lid },</c:forEach></div>
	<iframe name="hidden_frame" id="hidden_frame" style="display:none;"></iframe>
	
	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/pm.js"></script>
	<script type="text/javascript">
		timeChange();
	</script>
	<script type="text/javascript">
		function upposter(){
			$('#upposter').submit();
			$('#posterModal').modal('hide');
		}
		function addTag(pid,lid,e){
			lides = $('#labelIds').html().split(',');
			for(var i=0;i<lides.length;i++){
				if(lides[i] == lid){
					alert("请不要重复添加！！");
					$(e).remove();
					return;
				}
			}
			$.ajax({
				url:'project/adl/'+pid+'/'+lid,
				success:function(data){
					var lname = $(e).html();
					$('#tagP').append('<a class="btn btn-default">'+lname+'</a>');
					$(e).remove();
				},
				error:function(){
					alert("请不要重复添加！！");
				}
			});
		}
		function joinIt(pid){
			$.get('project/apply/'+pid,function(data){
				if(data != '"0"'){
					alert(data);
				}
				$('#joinBtn').attr('disabled','disabled');
				$('#joinBtn').html('已报名');
			});		
		}
		function agree(pid,uid,e){
			$.get('project/join/'+pid+'/'+uid,function(data){
				if(data != '"0"'){
					alert(data);
					$(e).remove();
				}else{
					span = $(e).parent();
					$(e).remove();
					div = $(span).parent();
					$('#joinUser').append($(div).prop('outerHTML'));
					div.remove();
				}
			});	
		}
	</script>
</body>
</html>