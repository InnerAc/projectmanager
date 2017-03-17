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
		<a href="">
		<div class="col-md-1">
			<img class="img-responsive" src="static/image/logo.png" width="45px;">
		</div>
		<div class="col-md-6 github_nav">
			<span style="color:black;">大学生课外项目管理系统</span>
		</div>
		</a>
	</div><br>
	<hr>
	<div class="main">
		<h3>${project.pname }(${project.statu })</h3>
		<div class="col-md-6">
			<img class="img-responsive" src="static/poster/${project.poster }">
		</div>
		<div class="col-md-4">
			<label>举办人：${project.manager.username }</label><br>
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
			<button class="btn btn-success">报名</button><br><br>
			<button class="btn btn-warning"  data-toggle="modal" data-target="#posterModal">上传海报</button>
			<button onclick="$('#tagBase').toggle();" class="btn btn-info">添加标签</button><br><br>
		</div>
		<div class="col-md-12">
		<hr>
			<span>
				${project.pdesc }
			</span>
		</div>
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
	<iframe name="hidden_frame" id="hidden_frame" style="display:none;"></iframe>

	<script type="text/javascript" src="static/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="static/comp/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
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
	<script type="text/javascript">
		function upposter(){
			$('#upposter').submit();
			$('#posterModal').modal('hide')
		}
		function addTag(pid,lid,e){
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
	</script>
</body>
</html>