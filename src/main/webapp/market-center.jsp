<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>行情中心</title>
<link rel="stylesheet" type="text/css" href="css/marketCenter.css">
</head>
<body>

	<%@include file="sonpage-top.jsp"%>
	<div class="box">
		<div class="head">
			<h2>个股行情</h2>
		</div>
		<div class="box1">
			<div class="table-tab m-pager-board">
				<div class="table-tab m-pager-board">
					<h4 class="cur">
						<a href="javascript: void(0)">全部股票</a>
					</h4>
					<h4>
						<a href="javascript: void(0)">上证A股</a>
					</h4>
					<h4>
						<a href="javascript: void(0)">深证A股</a>
					</h4>
					<h4>
						<a href="javascript: void(0)">创业板</a>
					</h4>
					<h4>
						<a href="javascript: void(0)">科创板</a>
					</h4>
				</div>
			</div>

			<div id="maincont" data-fixedthead="true" class="maincont">

				<table class="m-table">
					<thead>
						<tr>
							<th style="width: 46px;">序号</th>
							<th style="width: 68px;">代码</th>
							<th style="width: 91px;">名称</th>
							<th style="width: 68px;"><a href="javascript:void(0)">现价<i></i></a></th>
							<th style="width: 91px;" class="cur"><a
								href="javascript:void(0)" class="desc">涨跌幅(%)<i></i></a></th>
							<th style="width: 68px;"><a href="javascript:void(0)">涨跌<i></i></a></th>
							<th style="width: 91px;"><a href="javascript:void(0)">涨速(%)<i></i></a></th>
							<th style="width: 69px;"><a href="javascript:void(0)">量比<i></i></a></th>
							<th style="width: 69px;"><a href="javascript:void(0)">振幅(%)<i></i></a></th>
							<th style="width: 80px;"><a href="javascript:void(0)">成交额<i></i></a></th>
							<th style="width: 91px;"><a href="javascript:void(0)">流通股<i></i></a></th>
							<th style="width: 91px;"><a href="javascript:void(0)">流通市值<i></i></a></th>
							<th style="width: 80px;"><a href="javascript:void(0)">市盈率<i></i></a></th>
							<!--th>概念题材</th-->
							<th style="width: 46px;">加自选</th>
						</tr>
					</thead>

					<tbody class="scontent">
						<c:forEach items="${map.stock}" var="stock">

							<tr>
								<td>${stock.id}</td>
								<td>
									<form name="form${stock.id}" action="QueryStocks"
										target="_blank">
										<a href="javascript:document.form${stock.id}.submit();"> <input
											type="text" style="display: none" name="code"
											value="${stock.code}" />${stock.code}
										</a>
									</form>
								</td>
								<td><a href="javascript:document.form${stock.id}.submit();">${stock.name}
								</a></td>
								<td class="c-rise">${stock.price}</td>
								<td class="c-rise">${stock.raterf}</td>
								<td class="c-rise">${stock.updn}</td>
								<td class="c-rise">${stock.rspeed}</td>
								<td class="">${stock.vratio}</td>
								<td class="c-rise">${stock.amplitude}</td>
								<td>${stock.turnover}</td>
								<td>${stock.tradestock}</td>
								<td>${stock.marketvalue}</td>
								<td>${stock.peratio}</td>
								<td><a class="j_addStock" title="加自选"
									href="javascript:void(0);"><img
										src="http://i.thsi.cn/images/q/plus_logo.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tbody class="scontent" style="display: none;">

						<c:forEach items="${map.sastock}" var="sastock">
							<tr>
								<td>${sastock.id}</td>
								<td>
									<form name="form${sastock.code}" action="QueryStocks"
										target="_blank">
										<a href="javascript:document.form${sastock.code}.submit();">
											<input type="text" style="display: none" name="code"
											value="${sastock.code}" />${sastock.code}
										</a>
									</form>
								</td>
								<td><a
									href="javascript:document.form${sastock.code}.submit();">${sastock.name}</a></td>
								<td class="c-rise">${sastock.price}</td>
								<td class="c-rise">${sastock.raterf}</td>
								<td class="c-rise">${sastock.updn}</td>
								<td class="c-rise">${sastock.rspeed}</td>
								<td class="">${sastock.vratio}</td>
								<td class="c-rise">${sastock.amplitude}</td>
								<td>${sastock.turnover}</td>
								<td>${sastock.tradestock}</td>
								<td>${sastock.marketvalue}</td>
								<td>${sastock.peratio}</td>
								<td><a class="j_addStock" title="加自选"
									href="javascript:void(0);"><img
										src="http://i.thsi.cn/images/q/plus_logo.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody class="scontent" style="display: none;">
						<c:forEach items="${map.szstock}" var="szstock">
							<tr>
								<td>${szstock.id}</td>
								<td>
									<form name="form${szstock.code}" action="QueryStocks"
										target="_blank">
										<a href="javascript:document.form${szstock.code}.submit();">
											<input type="text" style="display: none" name="code"
											value="${szstock.code}" />${szstock.code}
										</a>
									</form>
								</td>
								<td><a
									href="javascript:document.form${szstock.code}.submit();">${szstock.name}</a></td>
								<td class="c-rise">${szstock.price}</td>
								<td class="c-rise">${szstock.raterf}</td>
								<td class="c-rise">${szstock.updn}</td>
								<td class="c-rise">${szstock.rspeed}</td>
								<td class="">${szstock.vratio}</td>
								<td class="c-rise">${szstock.amplitude}</td>
								<td>${szstock.turnover}</td>
								<td>${szstock.tradestock}</td>
								<td>${szstock.marketvalue}</td>
								<td>${szstock.peratio}</td>
								<td><a class="j_addStock" title="加自选"
									href="javascript:void(0);"><img
										src="http://i.thsi.cn/images/q/plus_logo.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody class="scontent" style="display: none;">
						<c:forEach items="${map.cystock}" var="cystock">
							<tr>
								<td>${cystock.id}</td>
								<td>
									<form name="form${cystock.code}" action="QueryStocks"
										target="_blank">
										<a href="javascript:document.form${cystock.code}.submit();">
											<input type="text" style="display: none" name="code"
											value="${cystock.code}" />${cystock.code}
										</a>
									</form>
								</td>
								<td><a
									href="javascript:document.form${cystock.code}.submit();">${cystock.name}</a></td>
								<td class="c-rise">${cystock.price}</td>
								<td class="c-rise">${cystock.raterf}</td>
								<td class="c-rise">${cystock.updn}</td>
								<td class="c-rise">${cystock.rspeed}</td>
								<td class="">${cystock.vratio}</td>
								<td class="c-rise">${cystock.amplitude}</td>
								<td>${cystock.turnover}</td>
								<td>${cystock.tradestock}</td>
								<td>${cystock.marketvalue}</td>
								<td>${cystock.peratio}</td>
								<td><a class="j_addStock" title="加自选"
									href="javascript:void(0);"><img
										src="http://i.thsi.cn/images/q/plus_logo.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody class="scontent" style="display: none;">
						<c:forEach items="${map.kcstock}" var="kcstock">
							<tr>
								<td>${kcstock.id}</td>
								<td>
									<form name="form${kcstock.code}" action="QueryStocks"
										target="_blank">
										<a href="javascript:document.form${kcstock.code}.submit();">
											<input type="text" style="display: none" name="code"
											value="${kcstock.code}" />${kcstock.code}
										</a>
									</form>
								</td>
								<td><a
									href="javascript:document.form${kcstock.code}.submit();">${kcstock.name}</a></td>
								<td class="c-rise">${kcstock.price}</td>
								<td class="c-rise">${kcstock.raterf}</td>
								<td class="c-rise">${kcstock.updn}</td>
								<td class="c-rise">${kcstock.rspeed}</td>
								<td class="">${kcstock.vratio}</td>
								<td class="c-rise">${kcstock.amplitude}</td>
								<td>${kcstock.turnover}</td>
								<td>${kcstock.tradestock}</td>
								<td>${kcstock.marketvalue}</td>
								<td>${kcstock.peratio}</td>
								<td><a class="j_addStock" title="加自选"
									href="javascript:void(0);"><img
										src="http://i.thsi.cn/images/q/plus_logo.png" alt=""></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<%@include file="marketCenter-js.jsp"%>
				</table>

			</div>
		</div>
		<div class="m-pager" id="m-page">
			<nav>
				<ul class="pagination">
					<li><a href="QueryStock?start=0"> <span>首页</span>
					</a></li>
					<li><a href="QueryStock?start=${requestScope.prePage }">
							<span>前一页</span>
					</a></li>
					<li><a href="QueryStock?start=${requestScope.nextPage }">
							<span>后一页</span>
					</a></li>
					<li><a href="QueryStock?start=${(requestScope.totalPage-1)*20} ">
							<span>尾页</span>
					</a></li>
				</ul>
			</nav>
		</div>

	</div>

	<%@include file="sonpage-bottom.jsp"%>
</body>
</html>