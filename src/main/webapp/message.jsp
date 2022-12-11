<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的消息</title>
<link rel="stylesheet" href="css/message.css">
<script type="text/javascript" src="js/message.js"></script>
</head>
<body>
	<div class="container">
		<div class="head">
			<div id="xiaoxi" class="xiaoxi">
				<h3>我的消息</h3>
			</div>
			<div id="hudong" class="hudong">
				<h3>互动消息</h3>
			</div>
			<div id="liaotian" class="liaotian">
				<h3>聊天</h3>
			</div>
		</div>
		<div class="left">
			<div class="info">
				<ul>
					<c:if test="${empty nuser }">
						<li class="tx"><img src="null.jpg"
							style="with: 80px; height: 100px;"></li>
						<li class="text">请登录！</li>
					</c:if>
					<c:if test="${!empty nuser }">
						<c:forEach items="${nuser}" var="nuser">
							<li class="tx"><img src="${nuser.img}"
								style="with: 80px; height: 100px;">
							<li>
							<li class="text">${nuser.name}</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="lfinfo">
				<div class="tiaomu">
					<button onclick="hd()">互动消息</button>
					<ul id="cnt-hd">
						<li onclick="cntpl()"><span>评论</span></li>
						<li onclick="cntxx()"><span>@我</span></li>
						<li onclick="cntdz()"><span>点赞</span></li>
						<li onclick="cnttz()"><span>通知</span></li>
					</ul>
				</div>
				<div class="tiaomu">
					<button onclick="lt()">&nbsp聊&nbsp天&nbsp</button>
					<br>
					<ul id="cnt-lt">
						<li onclick="cntql()"><span>群聊助手</span></li>
						<li onclick="cnthy()"><span>我的好友</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div id="cnt-pl" class="jtlt">
				<img src="null.jpg">
				<span>暂无评论!</span>
			</div>
			<div id="cnt-xx" class="jtlt">
				<img src="null.jpg">
				<span>暂无消息!</span>
			</div>
			<div id="cnt-dz" class="jtlt">
				<img src="null.jpg">
				<span>没有点赞消息!</span>
			</div>
			<div id="cnt-tz" class="jtlt">
				<img src="null.jpg">
				<span>暂无通知!</span>
			</div>
			<div id="cnt-ql" class="jtlt">
				<img src="null.jpg">
				<span>您还没有加入群聊!</span>
			</div>
			<div id="cnt-hy" class="jtlt">
				<img src="null.jpg">
				<span>好友列表为空!</span>
			</div>
		</div>

	</div>
</body>
</html>