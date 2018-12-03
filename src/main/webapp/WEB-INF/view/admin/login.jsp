<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	java.util.Random random = new java.util.Random();
	int cssVer = random.nextInt(100);
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/lykj/static/css/admin/bootstrap.min.css?v=<%=cssVer%>" rel="stylesheet">
<!-- Font Awesome -->
<link href="/lykj/static/css/admin/font-awesome.min.css?v=<%=cssVer%>" rel="stylesheet">
<!-- NProgress -->
<link href="/lykj/static/css/admin/nprogress.css?v=<%=cssVer%>" rel="stylesheet">
<!-- Animate.css -->
<link href="/lykj/static/css/admin/animate.min.css?v=<%=cssVer%>" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/lykj/static/css/admin/custom.min.css?v=<%=cssVer%>" rel="stylesheet">

<script src="/lykj/static/js/admin/libs/flexible.js"	type="text/javascript" charset="utf-8"></script>
<script	src="/lykj/static/js/public/jquery-1.8.3.min.js"	type="text/javascript" charset="utf-8"></script>
<script	src="/lykj/static/js/admin/modules/managelogin.js?v=<%=cssVer%>"	type="text/javascript" charset="utf-8"></script>
<title>梨语科技</title>
<script type="text/javascript">
	var contextName = "lykj";
	//alert(contextName);
	function switchCode() {
		var timenow = new Date();
		var url = "/" + contextName + "/login/imageCode?d=" + timenow;
		$("#codeNum").attr("src", url);
	}
	document.onkeydown = function(e) {
        e = e || window.event;
        if(e.keyCode == 13) {
            this.forms["form1"].submit();
            return false;
        }
    }
	
</script>
</head>
<body class="login">
	<div>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form id="form1" action="/lykj/login/login" method="post">
						<h1>梨语科技-后台管理</h1>
						<div>
							<input type="text" name="username" class="form-control" placeholder="登录账号" required="required" value="" />
						</div>
						<div>
							<input type="password" name="password" class="form-control" placeholder="管理员密码" required="required" value=""/>
						</div>
						<div>
							<input type="text" name="code" class="form-control" placeholder="验证码" style="width:160px;float: left;" onkeydown='if(event.keyCode==13){form1.submit();}'/>
							<img src="/lykj/login/imageCode" title="点击更换验证码"
							 id="codeNum" onclick="javascript:switchCode()"></img>
						</div>
						<div style="margin-top: 20px;">
							&nbsp;<span style="color: red;">${errmsg}</span>
						</div>
						<div>
							<a class="btn btn-default submit" href="#" onclick="document.getElementById('form1').submit();return false">登陆</a>
							<a class="reset_pass" href="#" onclick="javascript:alert('功能开发中');">忘记密码?</a>
						</div>
						<div class="clearfix"></div>
						<div class="separator">
							<p class="change_link">
								没有用户? <a href="/lykj/login/getPassword" class="to_register"> 注册用户 </a>
							</p>
							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<!--<i class="fa fa-paw"></i>   -->
								</h1>
								<p>©2018 All Rights Reserved. LIYU KEJI!</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>