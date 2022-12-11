<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股市航海-交易</title>
<link rel="stylesheet" href="css/trade.css">
<script type="text/javascript" src="js/jqueryform.js"></script>
</head>
<body>

	<div class="head">
		<h4>交易中心</h4>
		<c:if test="${empty nuser }">
			<h6>欢迎!****</h6>
		</c:if>
		<c:if test="${!empty nuser }">
			<c:forEach items="${nuser}" var="nuser">
				<h6>欢迎您！${nuser.name}</h6>
			</c:forEach>
		</c:if>
	</div>
	<div id="over"></div>
	<div id="recode">
		<form action="QueryTrade" id="bfm" style="display: block;">
			<ul>
				<li><input placeholder="输入股票代码" id="tjk" name="code" /><input
					type="submit" value="查 询" id="sub1" /></li>
				<li><button type="button" onclick="kxs()">返回</button></li>
			</ul>
		</form>
		<form action="QuerySTrade" id="sfm" style="display: none;"
			>
			<ul>
				<li><input placeholder="输入股票代码" id="tjk" name="code" /><input
					type="submit" value="查 询" id="sub1" class="ajc" /></li>
				<li><button type="button" onclick="kxs1()">返回</button></li>
			</ul>
		</form>
	</div>
	<div class="tbox">
		<div class="tlist">
			<ul class="hinfo">
				<li class="active">买入</li>
				<li>卖出</li>
				<li>撤单</li>
				<li>持仓/收益</li>
				<li>查询</li>
			</ul>
		</div>
		<div class="tright">
			<div class="t1">
				<form action="BuyStock" method="post">
					<c:if test="${!empty map}">
						<c:forEach items="${map.trade}" var="trade">
							<ul class="cha">
								<li class="price">最新价 <input type="text" name="nprice"
									value="${trade.price}" style="display: none;" />${trade.price}<span>0.02
										&nbsp;0.10%</span></li>
								<li class="ssk2" onclick="shuru()"><input type="text"
									name="code" value="${trade.code}" style="display: none;" /> <input
									type="text" name="name" value="${trade.name}"
									style="display: none;" /> <input type="text" name="raterf"
									value="${trade.raterf}" style="display: none;" /> <input
									type="text" name="updn" value="${trade.updn}"
									style="display: none;" /> <input type="hidden" name="token"
									value="<%=session.getAttribute("token")%>"> <input
									type="hidden" name="token" value="${token}" /> <span
									class="ftn">${trade.code}</span> <span class="frn">${trade.name}</span>
								</li>
								<li><input placeholder="${trade.price}" name="cost"
									type="text" value="" /></li>
								<li class="tmr"><button class="bt1">明日</button>
									<button class="bt2">
										跌停&nbsp;<span>15.62</span>
									</button>
									<button class="bt3">
										涨停&nbsp;<span>23.42</span>
									</button></li>
								<li><input placeholder="数量" type="text" name="snum"
									value="" /></li>
								<li class="tgu">可买<span>10000</span>股
								</li>
								<li class="how">
									<button>全仓</button>
									<button>半仓</button>
									<button>1/3仓</button>
									<button>1/4仓</button>
								</li>
								<li><button class="buy" type="submit" id="btns">买入</button></li>
							</ul>
						</c:forEach>
					</c:if>

				</form>
				<c:if test="${empty map.trade }">
					<ul class="cha">
						<li class="price">最新价 19.52<span>0.02 &nbsp;0.10%</span></li>
						<li class="ssk" onclick="shuru()">输入股票代码</li>
						<li><input placeholder="价格" name="nprice" /></li>
						<li class="tmr"><button class="bt1">明日</button>
							<button class="bt2">
								跌停&nbsp;<span>15.62</span>
							</button>
							<button class="bt3">
								涨停&nbsp;<span>23.42</span>
							</button></li>
						<li><input placeholder="数量" name="snum" /></li>
						<li class="tgu">可买<span>10000</span>股
						</li>
						<li class="how">
							<button>全仓</button>
							<button>半仓</button>
							<button>1/3仓</button>
							<button>1/4仓</button>
						</li>
						<li><button class="buy">买入</button></li>
					</ul>
				</c:if>
				<ul class="tleft">
					<li class="tf">
						<ul>
							<li>卖5 <span>--</span> <span>--</span></li>
							<li>卖4 <span>--</span> <span>--</span></li>
							<li>卖3</li>
							<li>卖2</li>
							<li>卖1</li>
						</ul>
					</li>
					<li class="tf1">
						<ul>
							<li>买1</li>
							<li>卖2</li>
							<li>卖3</li>
							<li>卖4</li>
							<li>卖5</li>
						</ul>
					</li>
				</ul>
				<table class="rely"
					style="word-wrap: break-word; word-break: break-all;">
					<tbody class="tlist2" style="height: 40px;">
						<tr class="minfo">
							<td class="active2">持仓</td>
							<td>委托</td>
							<td>成交</td>
							<td>自选</td>
						</tr>
					</tbody>
					<tbody class="tlist3">
						<tr class="k2">
							<td>市值</td>
							<td>盈亏</td>
							<td>持仓/可用</td>
							<td>成本/现价</td>
							<c:if test="${!empty map }">
								<c:forEach items="${map.btrade}" var="btrade">
									<td><span>${btrade.shiz}</span></td>
									<td><span>${btrade.yingk}</span></td>
									<td><span>${btrade.snum}/</span><span>${btrade.snum}</span></td>
									<td><span>${btrade.cost}/${btrade.nprice}</span></td>
								</c:forEach>
							</c:if>
							<c:if test="${!empty map }">
								<c:forEach items="${map.msg}" var="msg">
									<td><span class="cwk">${msg}</span></td>
								</c:forEach>
							</c:if>
						</tr>
						<tr class="kn" style="display: none;">
							<td>委托时间</td>
							<td>委托/均价</td>
							<td>委托/成交</td>
							<td>状态</td>
							<c:if test="${!empty map }">
								<c:forEach items="${map.btrade}" var="btrade">
									<td><span>${btrade.name}</span></td>
									<td><span>${btrade.cost}</span></td>
									<td><span>${btrade.snum}</span></td>
									<td><span>买入</span></td>
									<td><span class="wtt">${btrade.wttime}</span></td>
									<td><span>${btrade.nprice}</span></td>
									<td><span>${btrade.snum}</span></td>
									<td class="fg"><span>${btrade.zt}</span></td>
								</c:forEach>
							</c:if>
							<c:if test="${!empty msg }">
								<c:forEach items="${msg}" var="msg">
									<td><span class="cwk">${msg}</span></td>
								</c:forEach>
							</c:if>

						</tr>
						<tr class="knn" style="display: none;">
							<td>成交时间</td>
							<td>成交价</td>
							<td>成交量</td>
							<td>成交量</td>
							<c:if test="${!empty map }">
								<c:forEach items="${map.btrade}" var="btrade">
									<td><span>${btrade.wttime}</span></td>
									<td><span>${btrade.cost}</span></td>
									<td><span>${btrade.snum}</span></td>
									<td><span>${btrade.snum}</span></td>
								</c:forEach>
							</c:if>
						</tr>
						<tr class="knn1" style="display: none;">
							<td>股票/代码</td>
							<td>现价</td>
							<td>涨跌</td>
							<td>涨幅</td>
							<c:if test="${!empty map }">
								<c:forEach items="${map.atrade}" var="atrade">
									<td><span>${atrade.name}</span><span class="dm">${atrade.code}</span></td>
									<td><span>${atrade.nprice}</span></td>
									<td><span>${atrade.updn}</span></td>
									<td><span>${atrade.raterf}</span></td>
								</c:forEach>
							</c:if>
						</tr>


					</tbody>
				</table>
			</div>
			<div style="display: none; height: 500px;">
				<form action="SellStock" method="post">
					

					<c:if test="${!empty map }">
						<c:forEach items="${map.btrade}" var="btrade" end="0">
							<ul class="cha1">
								<li class="price">最新价 <input type="text" name="nprice"
									value="${btrade.cost}" style="display: none;" />${btrade.nprice}<span>-1.29
										&nbsp;-8.68%</span></li>
								<li class="ssk1" onclick="shuru1()"><input type="text"
									name="code" value="${btrade.code}" style="display: none;" /> <input
									type="text" name="name" value="${btrade.name}"
									style="display: none;" /> <input type="text" name="snum"
									value="${btrade.snum}" style="display: none;" /> <input
									type="hidden" name="token1"
									value="<%=session.getAttribute("token1")%>"> <input
									type="hidden" name="token1" value="${map.token1}" /> <span
									class="sftn">${btrade.code}</span> <span class="sfrn">${btrade.name}</span>
								</li>
								<li><input placeholder="${btrade.cost}" name="sell"
									value="" /></li>
								<li class="tmr"><button class="bt1">明日</button>
									<button class="bt2">
										跌停&nbsp;<span>15.62</span>
									</button>
									<button class="bt3">
										涨停&nbsp;<span>23.42</span>
									</button></li>
								<li><input placeholder="${btrade.snum}" type="text"
									value="" name="mnum" /></li>
								<li class="tgu">可卖<span>${btrade.snum}</span>股
								</li>
								<li class="how">
									<button>全仓</button>
									<button>半仓</button>
									<button>1/3仓</button>
									<button>1/4仓</button>
								</li>
								<li><button class="buy1" type="submit" id="sub"
										class="mcgp">卖出</button></li>
							</ul>
						</c:forEach>
					</c:if>
				</form>
				<c:if test="${empty map.btrade }">
					<ul class="cha1">
						<li class="price">最新价 13.69<span>-1.29 &nbsp;-8.68%</span></li>
						<li class="ssk1" onclick="shuru1()">输入股票代码</li>
						<li><input placeholder="价格" /></li>
						<li class="tmr"><button class="bt1">明日</button>
							<button class="bt2">
								跌停&nbsp;<span>15.62</span>
							</button>
							<button class="bt3">
								涨停&nbsp;<span>23.42</span>
							</button></li>
						<li><input placeholder="数量" /></li>
						<li class="tgu">可买<span>10000</span>股
						</li>
						<li class="how">
							<button>全仓</button>
							<button>半仓</button>
							<button>1/3仓</button>
							<button>1/4仓</button>
						</li>
						<li><button class="buy1" type="submit">卖出</button></li>
					</ul>
				</c:if>
				<ul class="tleft">
					<li class="tf">
						<ul>
							<li>卖5 <span>--</span> <span>--</span></li>
							<li>卖4 <span>--</span> <span>--</span></li>
							<li>卖3</li>
							<li>卖2</li>
							<li>卖1</li>
						</ul>
					</li>
					<li class="tf1">
						<ul>
							<li>买1</li>
							<li>卖2</li>
							<li>卖3</li>
							<li>卖4</li>
							<li>卖5</li>
						</ul>
					</li>
				</ul>
				<table class="rely1">
					<tbody class="tlist2" style="height: 40px;">
						<tr class="minfo1">
							<td class="active3">持仓</td>
							<td>委托</td>
							<td>成交</td>
							<td>历史</td>
						</tr>
					</tbody>
					<tbody class="tlist4">
						<tr class="k2">
							<td>市值</td>
							<td>盈亏</td>
							<td>持仓/可用</td>
							<td>成本/现价</td>
							<c:if test="${!empty map }">
								<c:forEach items="${map.btrade}" var="btrade">
									<td><span>${btrade.shiz}</span></td>
									<td><span>${btrade.yingk}</span></td>
									<td><span>${btrade.snum}/</span><span>${btrade.snum}</span></td>
									<td><span>${btrade.cost}/${btrade.nprice}</span></td>
								</c:forEach>
							</c:if>
							<c:if test="${!empty map.msg1 }">
								<c:forEach items="${map.msg1}" var="msg">
									<td><span class="cwk">${msg}</span></td>
								</c:forEach>
							</c:if>
						</tr>
						<tr class="knn2" style="display: none;">
							<td>委托时间</td>
							<td>委托/均价</td>
							<td>委托/成交</td>
							<td>状态</td>
							<c:if test="${!empty map.sstrade }">
								<c:forEach items="${map.sstrade}" var="sstrade">
									<td><span>${sstrade.wttime}</span></td>
									<td><span>${sstrade.sell}/</span><span>${sstrade.sell}</span></td>
									<td><span>${sstrade.mnum}/</span><span>${sstrade.mnum}</span></td>
									<td><span>${sstrade.zt}</span></td>
								</c:forEach>
							</c:if>
							<c:if test="${!empty map.msg1 }">
								<c:forEach items="${map.msg1}" var="msg">
									<td><span class="cwk">${msg}</span></td>
								</c:forEach>
							</c:if>

						</tr>
						<tr class="knn3" style="display: none;">
							<td>成交时间</td>
							<td>成交价</td>
							<td>成交量</td>
							<td>成交量</td>
							<c:if test="${!empty map.sstrade }">
								<c:forEach items="${map.sstrade}" var="sstrade">
									<td><span>${sstrade.wttime}</span></td>
									<td><span>${sstrade.sell}</span></td>
									<td><span>${sstrade.mnum}</span></td>
									<td><span>${sstrade.mnum}</span></td>
								</c:forEach>
							</c:if>
							<c:if test="${!empty map.msg1 }">
								<c:forEach items="${map.msg1}" var="msg">
									<td><span class="cwk">${msg}</span></td>
								</c:forEach>
							</c:if>
						</tr>
						<tr style="display: none;">
							<td><span class="wls"><p>暂无历史!</p></span></td>

						</tr>


					</tbody>
				</table>
			</div>
			<div style="display: none;">

				<ul class="k3">
					<li>委托时间</li>
					<li>委托/均价</li>
					<li>委托/成交</li>
					<li>状态</li>
				</ul>
				<span class="wls1"><p>暂无委托数据!</p></span>
			</div>
			<div style="display: none;">
				<ul class="cc">
					<li class="cc1">
						<ul class="ys1">
							<li>总资产</li>
							<li>浮动盈亏</li>
							<li>当日参盈亏</li>
						</ul>
						<ul>
							<li>200000.00</li>
							<li>0.00</li>
							<li>--</li>
						</ul>
					</li>
					<li class="cc2">
						<ul class="ys2">
							<li>总市值</li>
							<li>可用</li>
							<li>可取</li>
						</ul>
						<ul>
							<li>0.00</li>
							<li>200000.00</li>
							<li>0.00</li>
						</ul>
					</li>
				</ul>
				<ul class="k4">
					<li>市值</li>
					<li>盈亏</li>
					<li>持仓/可用</li>
					<li>成本/现价</li>
				</ul>

			</div>
			<div class="cx" style="display: none;">
				<ul>
					<li>当日成交</li>
					<li>当日委托</li>
				</ul>
				<ul>
					<li>历史成交</li>
					<li>历史委托</li>
				</ul>
				<ul>
					<li>更多操作</li>
				</ul>
				<span>意见反馈</span>
			</div>
		</div>
	</div>
	<%@include file="trade-js.jsp"%>
</body>
<script type="text/javascript">
	function shuru() {
		document.getElementById('over').style.display = 'block';
		document.getElementById('recode').style.display = 'block';
		document.getElementById('bfm').style.display = 'block';
		document.getElementById('sfm').style.display = 'none';
	}
	function shuru1() {
		document.getElementById('over').style.display = 'block';
		document.getElementById('recode').style.display = 'block';
		document.getElementById('bfm').style.display = 'none';
		document.getElementById('sfm').style.display = 'block';
	}
	function kxs() {
		document.getElementById("over").style.display = "none";
		document.getElementById('recode').style.display = 'none';

	}
	function kxs1() {
		document.getElementById("over").style.display = "none";
		document.getElementById('recode').style.display = 'none';
	}
</script>
</html>