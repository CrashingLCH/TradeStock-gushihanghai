<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!---随窗口变化-->
<title>用户登录</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>

</head>
<body>
<div class="wrap">
	<div class="banner-show" id="js_ban_content">
		<div class="cell bns-01">
			<div class="con">
			</div>
		</div>
		<div class="cell bns-02" style="display:none;">
			<div class="con">
				<a href="javascript:void(0);" target="_blank" class="banner-link">
				<i>股市航海</i></a> </div>
		</div>
		<div class="cell bns-03" style="display:none;">
			<div class="con">
				<a href="javascript:void(0);" target="_blank" class="banner-link">
				<i>你的股票管家</i></a> </div>
		</div>
	</div>
	<div class="banner-control" id="js_ban_button_box">
		<a href="javascript:;" class="left">左</a>
		<a href="javascript:;" class="right">右</a>
	</div>
<script type="text/javascript">
;(function(){
	
	var defaultInd = 0;
	var list = $('#js_ban_content').children();
	var count = 0;
	var change = function(newInd, callback){
		if(count) return;
		count = 2;
		$(list[defaultInd]).fadeOut(400, function(){
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
		$(list[newInd]).fadeIn(400, function(){
			defaultInd = newInd;
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
	}
	
	var next = function(callback){
		var newInd = defaultInd + 1;
		if(newInd >= list.length){
			newInd = 0;
		}
		change(newInd, callback);
	}
	
	var start = function(){
		if(start.timer) window.clearTimeout(start.timer);
		start.timer = window.setTimeout(function(){
			next(function(){
				start();
			});
		}, 8000);
	}
	
	start();
	
	$('#js_ban_button_box').on('click', 'a', function(){
		var btn = $(this);
		if(btn.hasClass('right')){
			//next
			next(function(){
				start();
			});
		}
		else{
			//prev
			var newInd = defaultInd - 1;
			if(newInd < 0){
				newInd = list.length - 1;
			}
			change(newInd, function(){
				start();
			});
		}
		return false;
	});
	
})();

function submitForm(){
	$("#loginForm").submit();
}

</script>


	<form id="loginForm" action="${pageContext.request.contextPath }/loginServlet" method="post">
		<div class="container">
			<div class="register-box" style="top:-480px;height:350px">
				<div class="reg-slogan">
					用户登录</div>
				<div style="color:red;padding-left:35px">
					${loginInfo }
				</div>
				<div class="reg-form" id="js-form-mobile">
					<div class="cell">
						<input type="password" placeholder="请输入账号" name="username" id="js-mobile_ipt" class="text" maxlength="11" />
					</div>
					<div class="cell">
						<input type="password" placeholder="请输入密码"  name="password" id="js-mobile_pwd_ipt" class="text" />
					</div>
					<div  class="cell vcode">
						<input name="inputNum" type="text" placeholder="请输入验证码" class="text"/>
						<img src="Code" onclick="this.src='Code?'+Math.random();"/>
					</div>
					<div class="user-agreement" style="color:#BDBDBD;font-size: 14px">
						<span>
						没有账号？前往<a href="regist.jsp">注册</a>
						</span>
					</div>
					
					
					<div class="bottom" onclick="submitForm()">
						<a id="js-mobile_btn" href="javascript:;" class="button btn-green">
						用户登录</a></div>
				</div>
				
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	FancyForm.setup();
});
</script>	
</body>
</html>
