<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>子页面的顶部布局</title>
<style type="text/css">
a {
	text-decoration: none;
}

.header {
	background: #252525;
	width: 100%;
	height: 64px;
	font-size: 14px;
}

.w1200 {
	width: 1200px;
	margin: 0 auto;
}

.header .hdlogo {
	float: left;
	width: 246px;
}

.header .hdlogo .site-logo {
	float: left;
	margin-top: 13px;
}

.header .nav {
	float: left;
	margin: 18px 0 0 17px;
}

.header .nav a.cur {
	color: #fff;
	font-weight: 700;
}

.header .nav a {
	display: inline-block;
	margin: 0 13px;
	line-height: 28px;
	color: #b7b7b7;
}

.arr-trigger {
	padding-right: 15px;
}

.header .login-box {
	position: relative;
	float: right;
	line-height: 64px;
	padding-left: 25px;
	right: 100px;
	background: url(http://i.thsi.cn/images/q/login.jpg) 0 50% no-repeat;
	float: right;
}

.hdlogo img {
	position: relative;
	left: 10px;
	width: 116px;
	height: 35px;
}

.hqzx {
	position: relative;
	float: left;
	width: 125px;
	height: 28px;
	color: white;
	top: -8px;
	left: 20px;
}

.nav a:hover {
	text-decoration: underline;
	cursor: pointer;
}

.login-box a:hover {
	text-decoration: underline;
}

.header .login-box a {
	color: #b7b7b7;
}
</style>

</head>
<body>
	<div class="header fixed">

		<div class="w1200">

			<div class="hdlogo">

				<a target="_blank" class="site-logo" href="index.jsp"> <img
					src="img/sLogo.png" title="股市航海" alt="股市航海">
				</a>

				<h1>
					<a title="行情中心" class="hqzx" href="#">行情中心</a>
				</h1>

			</div>

			<div class="nav">

				<a href="#" data-type="hssc" class="arr-trigger cur">深沪市场</a> <a
					href="#">香港市场</a> <a href="#">美国市场</a> <a href="#">股市资讯</a> <a
					href="#" data-type="sjzx" class="arr-trigger">数据中心</a>
			</div>
			<div class="login-box" style="a: hover:text-decoration: underline;">

				<a href="login.jsp"
					target="_blank">登录</a>

			</div>
		</div>

	</div>
</body>
</html>