<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>股市航海-股票详情</title>
<link rel="stylesheet" href="css/stockInfo.css">
</head>
<body>
	<%@include file="sonpage-top.jsp" %>
	<div class="ser-s">
		<form action="QueryStocks">
		<input type="text" name="code" value="" placeholder="输入股票代码">
		<input type="submit" value="搜索">
		</form>
	</div>
	<div class="dis-s">
		<h1 class="m_logo fl">
		<c:if test="${empty stock}">
				<span class="snll">暂无股票信息！</span>
			</c:if>
			<c:forEach items="${stock}" var="stock">
			<c:if test="${!empty stock}">
		<span>
		<a href="#">${stock.name}</a>
		<a href="#">${stock.code}</a>
		<a class="addsl" href="#"><input type="text" style="display: none"name="sccode" value="${stock.code}" /></a>
		</span>
		</c:if>
		</c:forEach>
		
	</h1>
	
		<ul class="info">
			<c:if test="${empty stock}">
				<span>请输入正确的股票代码进行搜索！</span>
			</c:if>
		<c:forEach items="${stock}" var="stock">
			
			<c:if test="${!empty stock}">
			
			<li class="rise">涨跌幅(%):${stock.raterf}</li>
			<li class="rise">&nbsp;&nbsp;涨跌：${stock.updn}</li>
			<li class="rise">涨速：${stock.rspeed}</li>
			<li>市盈率(%)：${stock.peratio}</li>
			<li>量比：${stock.vratio}</li>
			<li>振幅：${stock.amplitude}</li>
			<li>流通股：${stock.tradestock}</li>
			<li>成交额：${stock.turnover}&nbsp;</li>
			
		</c:if>
		</c:forEach>
		</ul>
		
	</div>
	<div class="bodys">
	<div class="ninf">
		<span style="color:red;">暂无详细资讯!</span>
		</div>
	</div>
	<%@include file="sonpage-bottom.jsp"%>
</body>
</html>