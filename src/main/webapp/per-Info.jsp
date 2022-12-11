<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/info.css">
<title>个人信息</title>

</head>
<body>
	<div class="nav">
		<h3>个人信息</h3>
	</div>
	<div class="a">
		<div class="one">
			<div class="two1">
				<c:if test="${empty nuser }">
					<img src="null.jpg" style="with: 80px; height: 100px;">
				</c:if>
				<c:if test="${!empty nuser }">
					<c:forEach items="${nuser}" var="nuser">
						<img src="${nuser.img}" style="with: 80px; height: 100px;">
					</c:forEach>
				</c:if>
			</div>

			<div class="text1">
				<c:if test="${empty nuser }">
				请登录！
			</c:if>
				<c:if test="${!empty nuser }">
					<c:forEach items="${nuser}" var="nuser">
			${nuser.name}
			</c:forEach>
				</c:if>
			</div>

			<div class="two2">
				<div class="two2-one">粉丝:999</div>
				<div>关注:99</div>
			</div>

			<div class="two">
				<ul>
					<li class="three1" onclick="mima()"><span>修改密码</span></li>
					<li class="three1" onclick="xiaoxi()"><span>消息</span>
						<button>99</button></li>
					<li class="three1" onclick="shezhi()"><span>设置</span></li>
					<li class="three1" onclick="submitForm()">
						<form action="Dispatcher">
							<ul>
								<li><c:forEach items="${nuser}" var="nuser">
										<input type="text" style="display: none" name="username"
											value="${nuser.username}" />
									</c:forEach></li>
								<li><span>
										<button class="zybt" style="color: white">返回主页</button>
								</span></li>
							</ul>
						</form>
					</li>

				</ul>
			</div>
		</div>
		<div id="mima" class="mima">
			<c:if test="${empty nuser }">
				<ul>
					<li>账号：***********</li>
					<li>旧密码：</li>
					<li>新密码：</li>
				</ul>
			</c:if>
			<form action="UpUser">
				<c:forEach items="${nuser}" var="nuser">
					<c:if test="${!empty nuser }">
						<ul>
							<li>账号：<input style="display: none;" type="text"
								name="username" value="${nuser.username}" />${nuser.username}</li>
							<li>旧&nbsp 密&nbsp码：<input type="text" name="opassword" /></li>
							<li>新&nbsp 密&nbsp码：<input type="text" name="npassword" /></li>
							<li>确认密码：<input type="text" name="cpassword" /></li>
							<li class="xiugai"><input type="submit" value="修改"></li>
						</ul>
					</c:if>
				</c:forEach>
			</form>
			
		</div>
		<div id="info" class="info">

			<div class="list">
				<c:if test="${empty nuser }">
					<ul>
						<li>账号：</li>
						<li>昵称：</li>
						<li>性别：</li>
						<li>邮箱：</li>
					</ul>
				</c:if>
				<c:forEach items="${nuser}" var="nuser">
					<c:if test="${!empty nuser }">
						<ul>
							<li>账号：${nuser.username}</li>
							<li>昵称：${nuser.name}</li>
							<li>性别：${nuser.sex}</li>
							<li>邮箱：${nuser.email}</li>
							<li><span class="sp1" onclick="xshi()" id="anniu"> <a
									href="javascript:void(0)" onclick="add()">修改</a>
							</span></li>
						</ul>
					</c:if>
				</c:forEach>
			</div>
			<div id="contes">
				<div>
					<span id="fmh">修改信息</span>
					<hr>
					<form action="UpInfo" method="post" enctype="multipart/form-data"
						class="fm">
						<ul>
							<c:forEach items="${nuser}" var="nuser">
								<li><input type="text" style="display: none"
									name="username" value="${nuser.username}" /></li>
							</c:forEach>
							<li>昵称：<input type="text" value="" name="name"></li>
							<li>邮箱：<input type="text" value="" name="email"></li>
							<li>性别：<input id="man" type="radio" checked="checked"
								name="sex" value="男" />男 <input type="radio" id="woman"
								name="sex" value="女">女
							</li>
							<li class="tx">头像：<input type="file" name="uploadImage" />
							</li>
							<li class="st"><input type="submit" value="提交"> <input
								type="button" onclick="myFunction()" value="取消"></li>
						</ul>
					</form>
				</div>
			</div>

		</div>
	</div>
	<div id="all_light"></div>
	<script>
		function add() {
			document.getElementById('all_light').style.display = 'block';
			document.getElementById('contes').style.display = 'block';
		}
		function xshi() {
			document.getElementById('anniu').style.display = 'none';
		}
		function myFunction() {
			window.location.href = 'per-Info.jsp';
		}
		function mima() {
			document.getElementById('mima').style.display = 'block';
			document.getElementById('info').style.display = 'none';
		}
		function shezhi() {
			document.getElementById('mima').style.display = 'none';
			document.getElementById('info').style.display = 'block';
		}
		function xiaoxi() {
			alert("没这么多消息啦!")
		}
	</script>
</body>
</html>

