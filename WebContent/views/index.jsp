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
			<a href=""><img class="img-responsive" src="static/image/logo.png" width="45px;"></a>
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
		<div class="col-md-2">
			<c:if test="${me==null }">
				<button onclick="login();" class="btn btn-info">登录</button>
				<button class="btn btn-success">注册</button>
			</c:if>
			<c:if test="${me!=null }">
				<span><a href="user/me">${me.username }</a></span>
				<span><a href="user/logout">登出</a></span>
			</c:if>
		</div>
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
	</div><br>
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
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="#">计算机设计大赛</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：张三</label><br>
							<label>活动日期：2017-05-01 12:00:00</label><br>
							<label>参与方式：需要批准</label><br>
							<label>参与人数：12/50</label><br>
							<span>
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="#">计算机设计大赛</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：张三</label><br>
							<label>活动日期：2017-05-01 12:00:00</label><br>
							<label>参与方式：需要批准</label><br>
							<label>参与人数：12/50</label><br>
							<span>
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="#">计算机设计大赛</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：张三</label><br>
							<label>活动日期：2017-05-01 12:00:00</label><br>
							<label>参与方式：需要批准</label><br>
							<label>参与人数：12/50</label><br>
							<span>
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="#">计算机设计大赛</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：张三</label><br>
							<label>活动日期：2017-05-01 12:00:00</label><br>
							<label>参与方式：需要批准</label><br>
							<label>参与人数：12/50</label><br>
							<span>
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="#">计算机设计大赛</a>
					</div>
					<div class="panel-body divProject">
						<div class="col-md-6">
							<img class="img-responsive" src="static/image/2.jpg">
						</div>
						<div class="col-md-6">
							<label>举办人：张三</label><br>
							<label>活动日期：2017-05-01 12:00:00</label><br>
							<label>参与方式：需要批准</label><br>
							<label>参与人数：12/50</label><br>
							<span>
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
								河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介，河海大学计算机设计大赛是一个非常有意义的活动，大赛简介，大赛简介，大赛简介
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
			<center>
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
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