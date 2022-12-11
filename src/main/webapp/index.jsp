<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股市航海_你的金融管家</title>
<link rel="stylesheet" type="text/css" href="css/test.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<link rel="shortcut icon" href="img/title_logo.ico" />
<script src="../js/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/Slider.css" />
</head>
<body>
	<div id="layout_adt">
		<div id="top_adt" onclick="adh()">
			<a href="####" title="股市航海" style="display: block; overflow: hidden;">
				<img style="display: block;" src="img/ad.jpg" />
			</a>
		</div>
		<script>
		function adh(){
			alert("欢迎来到股市航海！")
		}
	</script>
		<div id="top_adt_big">
			<img style="width: 100%; display: block;" src='img/duizhang.jpg' />
		</div>
	</div>
	<!--搜索 -->
	<!--注册登录-->
	<div id="top_nav">
		<div id="navd">
			<ul>
				<li class="dropdown">我的股票
					<ul class="dropdown-menu">
						<li><a href="trade.jsp" target="_blank">交易查询</a></li>
						<li><a href="trade.jsp" target="_blank">资金盈利</a></li>
						<li><a href="trade.jsp" target="_blank">前往交易</a></li>
					</ul>
				</li>
				<li class="dropdown">我的资讯
					<form action="InfoMessage" target="_blank">
						<ul class="dropdown-menu">
							<c:forEach items="${nuser}" var="nuser">
								<li><input id="inf" type="text" style="display: none"
									name="username" value="${nuser.username}" /></li>
							</c:forEach>
							<li><button onclick="submitForm()" style="color: gray" >我的消息</button></li>
						</ul>
					</form>
					<ul class="dropdown-menu">
						<li><a href="collection.jsp" target="_blank">我的收藏</a></li>
						<li onclick="zixun()"><a href="#">股市资讯</a></li>
					</ul> <script>
						function zixun() {
							alert("请在本界面查看资讯！")
						}
					</script>
				</li>
				<li class="dropdown">用户中心
					<form action="Info" target="_blank">
						<ul class="dropdown-menu">
							<c:forEach items="${nuser}" var="nuser">
								<li><input id="inf" type="text" style="display: none"
									name="username" value="${nuser.username}" /></li>
							</c:forEach>
							<li><button onclick="submitForm()" style="color: gray">个人信息</button></li>
							<li><button onclick="submitForm()" style="color: gray">修改密码</button></li>
						</ul>
					</form>
					<ul class="dropdown-menu">
						<li><a href="Logout">退出登录</a></li>
					</ul>
				</li>
				<li class="log"><c:if test="${empty nuser }">
						<a href="login.jsp" target="_blank">登录</a>
						<a href="regist.jsp" style="margin-left: 8px;" target="_blank">注册</a>
					</c:if> <c:forEach items="${nuser}" var="nuser">
						<c:if test="${!empty nuser }">
							您好,<span style="color: red">${nuser.name}</span>
						</c:if>
					</c:forEach></li>
			</ul>
		</div>
	</div>
	<div id="contain">
		<div class="logo">
			<img src="img/Logo.jpg">
		</div>
		<div class="search">
			&nbsp;
			<div class="main_search">
				<div class="ng_search">
					<form action="QueryStocks" target="_blank">
						<div class="search-keyword-box">
							<input value="" id="searchKeywords" type="text" name="code"
								placeholder="输入股票名或代码" /> <input id="searchSubmit"
								type="submit" class="search-btn" value="搜索" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="guide">
		<div class="layout">
			<ul>
				<li class="selected"><a href="#" title="首页" onclick="sy()">首页</a></li>
				<li class="selected"><a target="_blank" href="QueryStock" title="A股">A股</a></li>
				<li class="selected"><a target="_blank" href="QueryStock" title="港股">港股</a></li>
				<li class="selected"><a target="_blank" href="QueryStock" title="美股">美股</a></li>
				<li class="selected"><a href="#" title="社区" onclick="sq()">社区</a></li>
				<li class="selected"><a href="#" target="_blank" title="数据">数据</a></li>
			</ul>
		</div>
		<script>
		function sq() {
			alert("社区功能还未开发，看看其他的吧！")
		}
		function sy() {
			alert("这就是首页哦")
		}
	</script>
		<div class="banner-content">
			<div class="block_1">
				<div class="market">
					<ul class="bd">
						<li class="hd"><a target="_blank" href="QueryStock">行情中心</a></li>
						<li><a style="color: rgb(177, 30, 35);" href="#" title="开户">开户</a></li>
						<li><a target="_blank" href="#" title="大盘纵览">大盘纵览</a></li>
						<li><a target="_blank" href="#" title="股市航海行业">股市航海行业</a></li>
						<li><a target="_blank" href="#" title="港股">港股</a></li>
						<li><a target="_blank" href="#" title="美股">美股</a></li>
					</ul>
				</div>
			</div>
			<div class="block_2">
				<div class="data">
					<ul class="bd">
						<li class="hd"><a target="_blank" href="#">数据中心</a></li>
						<li><a target="_blank" href="#" title="公告">公告</a></li>
						<li><a style="color: rgb(177, 30, 35);" href="#" title="交易提示">交易提示</a></li>
						<li><a target="_blank" href="#" title="资金流向">资金流向</a></li>
						<li><a target="_blank" href="#" title="宏观数据">宏观数据</a></li>
						<li><a target="_blank" href="#" title="财务分析">财务分析</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="ad_1" onclick="ad()">
		<a href="#"> <img src="img/ad_1.jpg">
		</a>
	</div>
	<script>
		function ad() {
			alert("广告服务还未开通，敬请期待！")
		}
	</script>
	<div id="page">
		<div class="left">
			<div id="toutiao">
				<div class="box" id="box">
					<div class="inner">
						<ul>
							<li><a target="_blank" title="多家白酒企业三季报出炉！五粮液、泸州老窖等报喜"
								href="http://field.10jqka.com.cn/20221028/c642534618.shtml">
									<img src="img/wine.png" alt="多家白酒企业三季报出炉！五粮液、泸州老窖等报喜"
									height="250" width="400">
							</a></li>
							<li><a target="_blank" title="逾3100家上市公司披露三季报 新能源行业业绩亮眼"
								href="http://stock.10jqka.com.cn/20221028/c642535746.shtml">
									<img src="img/report.jpg" alt="逾3100家上市公司披露三季报 新能源行业业绩亮眼"
									height="250" width="400">
							</a></li>
							<li><a target="_blank" title="锂王前三季度净利增超29倍！锂盐价格仍高位攀升"
								href="http://stock.10jqka.com.cn/20221028/c642536406.shtml">
									<img src="img/kuang.jpg" alt="锂王前三季度净利增超29倍！锂盐价格仍高位攀升"
									height="250" width="400">
							</a></li>
							<li><a target="_blank" title="汽车零部件公司前三季度业绩亮眼"
								href="http://field.10jqka.com.cn/20221028/c642535713.shtml">
									<img src="img/car.jpg" alt="汽车零部件公司前三季度业绩亮眼" height="250"
									width="400">
							</a></li>
						</ul>
						<ol class="bar">
						</ol>
						<div id="arr">
							<span id="sleft"> </span> <span id="sright"></span>
						</div>
					</div>

				</div>
				<%@include file="Slider.jsp"%>
				<div class="left2">
					<div class="item_txt">
						<p class="foucs">
							<a target="_blank" class="" style="" title="国常会：狠抓稳经济一揽子政策落地"
								rel="1" id="news_1189771"
								href="https://t.10jqka.com.cn/pid_247159240.shtml">
								国常会：狠抓稳经济一揽子政策落地</a> &nbsp;&nbsp;
						</p>
						<p>
							<a target="_blank" class="" style=""
								title="华为成绩单出炉！前三季度销售收入4458亿 利润率6.1%" rel="2" id="news_1186107"
								href="https://t.10jqka.com.cn/pid_247159221.shtml">
								华为成绩单出炉！前三季度销售收入4458亿 利润率6.1%</a> &nbsp;&nbsp;
						</p>
						<p>
							<a target="_blank" class="" style=""
								title="苹果2022财年第四季营收901.5亿美元 预估886.4亿美元" rel="3"
								id="news_1315371"
								href="http://stock.10jqka.com.cn/20221028/c642535332.shtml">苹果2022财年第四季营收901.5亿美元
								预估886.4亿美元</a> &nbsp;&nbsp;
						</p>
					</div>
					<div class="item_txt">
						<p class="foucs">
							<a target="_blank" class="" style="color: #b11e23;"
								title="欧洲央行加息75基点 多国掀起加息潮" rel="4" id="news_1231663"
								href="https://t.10jqka.com.cn/m/zhibo/pid_247159224.shtml">
								欧洲央行加息75基点 多国掀起加息潮</a> &nbsp;&nbsp;
						</p>
						<p>
							<a target="_blank" class="" style=""
								title="史上最好！两桶油前三季盈利齐超千亿，机构直呼超预期" rel="6" id="news_1357545"
								href="http://stock.10jqka.com.cn/20221028/c642535655.shtml">
								史上最好！两桶油前三季盈利齐超千亿，机构直呼超预期</a> &nbsp;&nbsp;
						</p>
						<p>
							<a target="_blank" class="" style=""
								title="钠离子电池不断升温 宁德时代：或在2023年实现产业化" rel="5" id="news_1189211"
								href="http://stock.10jqka.com.cn/20221028/c642535688.shtml">
								钠离子电池不断升温 宁德时代：或在2023年实现产业化</a> &nbsp;&nbsp;
						</p>
					</div>
				</div>
			</div>
			<div class="info">
				<div class="tab1" style="float: left; margin-top: 0;">
					<ul class="caijing"
						style="border: none; border-bottom: 2px solid #e5e5e5; background: none;">
						<li class="newli active"
							style="width: 100px; border-right: none; margin-left: -30px;"><a
							href="http://stock.10jqka.com.cn/" target="_blank">投资机会</a></li>
					</ul>
					<div class="tab-container1">
						<div class="item1"
							style="padding-bottom: 11px; height: auto; margin-top: 0px; display: block">
							<ul class="content newhe">
								<li class="first"><a target="_blank"
									style="font-weight: bold; color: #222;"
									title="Web3.0概念热度不减，天地在线11日斩获9板，公司否认迎合热点概念炒作" rel="1"
									id="news_1414181"
									href="http://stock.10jqka.com.cn/20221111/c642867021.shtml">Web3.0概念热度不减，天地在线11日斩获9板，公司否认迎合热点概念炒作</a></li>
								<li><a target="_blank" class="" style=""
									title="【手慢无】钛合金顶配苹果表直降401元" rel="2" id="news_1139011"
									href="http://stock.10jqka.com.cn/20221111/c642866420.shtml">【手慢无】钛合金顶配苹果表直降401元</a></li>
								<li><a target="_blank" class="" style="" title="中国电驱动的春天来了"
									rel="3" id="news_1152141"
									href="http://stock.10jqka.com.cn/20221111/c642865942.shtml">中国电驱动的春天来了</a></li>
								<li><a target="_blank" class="" style=""
									title="68股获20家以上机构调研 爱玛科技最受关注" rel="4" id="news_1414179"
									href="http://stock.10jqka.com.cn/20221111/c642865255.shtml">68股获20家以上机构调研
										爱玛科技最受关注</a></li>
								<li><a target="_blank" class="" style=""
									title="48股受青睐，北向资金增持额超5000万元" rel="5" id="news_1116227"
									href="http://stock.10jqka.com.cn/20221111/c642865219.shtml">48股受青睐，北向资金增持额超5000万元</a></li>
								<li><a target="_blank" class="" style=""
									title="REITs试点范围扩大至新能源等领域 海量绿电资产有望得到盘活" rel="6"
									id="news_1336512"
									href="http://stock.10jqka.com.cn/20221111/c642860449.shtml">REITs试点范围扩大至新能源等领域
										海量绿电资产有望得到盘活</a></li>
							</ul>

							<ul class="last" style="padding-top: 17px">
								<li class="first"><a target="_blank"
									style="font-weight: bold; color: #222;"
									title="宁德时代又拿下大单！与大发战略合作 将稳定供应电池" rel="1" id="news_1552725"
									href="http://stock.10jqka.com.cn/20221111/c642867032.shtml">宁德时代又拿下大单！与大发战略合作
										将稳定供应电池</a></li>
								<li><a target="_blank" class="" style=""
									title="鹏鹞环保于湖北投资设立水务发展新公司，注册资本1.5亿" rel="2" id="news_1552723"
									href="http://stock.10jqka.com.cn/20221111/c642866997.shtml">鹏鹞环保于湖北投资设立水务发展新公司，注册资本1.5亿</a></li>
								<li><a target="_blank" class="" style=""
									title="【原创】翰宇药业携手中国医药，推进“抗感染”创新药营销渠道协同" rel="3"
									id="news_1336508"
									href="http://stock.10jqka.com.cn/20221111/c642866987.shtml">【原创】翰宇药业携手中国医药，推进“抗感染”创新药营销渠道协同</a></li>
								<li><a target="_blank" class="" style=""
									title="国立科技易主收关注函！是否规避要约收购、与葛旭艳关系等均被追问" rel="4"
									id="news_1336464"
									href="http://stock.10jqka.com.cn/20221111/c642866986.shtml">国立科技易主收关注函！是否规避要约收购、与葛旭艳关系等均被追问</a></li>
								<li><a target="_blank" class="" style=""
									title="华荣股份获9家机构调研：公司产能充裕，当前产能可满足30亿元产值（附调研问答）" rel="5"
									id="news_1335744"
									href="http://stock.10jqka.com.cn/20221111/c642866982.shtml">华荣股份获9家机构调研：公司产能充裕，当前产能可满足30亿元产值（附调研问答）</a></li>
								<li class="last"><a target="_blank" class="" style=""
									title="公司前线|三五互联新增“Web3.0”概念" rel="6" id="news_1335712"
									href="http://stock.10jqka.com.cn/20221111/c642866981.shtml">公司前线|三五互联新增“Web3.0”概念</a></li>
							</ul>
						</div>
					</div>
					<span class="sp-login"> <c:if test="${empty nuser }">
							<a target="_blank" href="login.jsp">登录</a>更懂你哦~
					</c:if> <c:forEach items="${nuser}" var="nuser">
							<c:if test="${!empty nuser }">
							您好,<span style="color: red">${nuser.name}</span>
							</c:if>
						</c:forEach></span>
				</div>
				<div class="tab2">
					<ul class="caijing"
						style="border: none; border-bottom: 2px solid #e5e5e5; background: none;">
						<li class="newli active" style="width: 100px; border-right: none;"><img
							src="//i.thsi.cn/images/home/v3/caijing_logo.png" alt=""
							style="float: left; margin-top: 3px; margin-left: -38px;">
							<a style="margin-left: -7px;" href="#" target="_blank">财经要闻</a></li>
					</ul>
					<div class="tab-container2">
						<div class="item2"
							style="padding-bottom: 11px; height: auto; margin-top: 0px; display: block">
							<ul class="num1">
								<li class="first"><a target="_blank"
									style="font-weight: bold; color: #222;"
									title="李大霄：史诗般的利好推动港股冲16600，A股上摸3100" rel="1" id="news_1165247"
									href="//stock.10jqka.com.cn/20221111/c642864880.shtml">李大霄：史诗般的利好推动港股冲16600，A股上摸3100</a></li>
								<li><a target="_blank" class="" style=""
									title="中信证券：近期不排除降准的可能" rel="2" id="news_1182759"
									href="//stock.10jqka.com.cn/20221111/c642866966.shtml">中信证券：近期不排除降准的可能</a></li>
								<li><a target="_blank" class="" style=""
									title="10月新增信贷、社融增量均不及预期，专家：政策加码空间已打开" rel="3"
									id="news_1259299"
									href="//news.10jqka.com.cn/20221111/c642859486.shtml">10月新增信贷、社融增量均不及预期，专家：政策加码空间已打开</a></li>
								<li><a target="_blank" class="" style=""
									title="火上浇油！疫苗巨头又发重磅利好，股价半个月已大涨一倍" rel="4" id="news_1112163"
									href="//stock.10jqka.com.cn/20221111/c642861803.shtml">火上浇油！疫苗巨头又发重磅利好，股价半个月已大涨一倍</a></li>
								<li><a target="_blank" class="" style="color: #b11e23;"
									title="证券时报头版：大客户“砍单”给整个苹果供应链企业敲响警钟" rel="5" id="news_991957"
									href="//stock.10jqka.com.cn/20221111/c642863184.shtml">证券时报头版：大客户“砍单”给整个苹果供应链企业敲响警钟</a></li>
								<li><a target="_blank" class="" style=""
									title="9天9板大涨135%！供销社概念股紧急提示风险" rel="6" id="news_1552779"
									href="//stock.10jqka.com.cn/20221111/c642859708.shtml">9天9板大涨135%！供销社概念股紧急提示风险</a></li>
							</ul>
							<ul class="last" style="padding-top: 5px">
								<li class="first"><a target="_blank"
									style="font-weight: bold; color: #222;"
									title="蔚来李斌：明年上半年推5款新车，碳酸锂每降10万提升2个点毛利率" rel="1"
									id="news_1552727"
									href="//stock.10jqka.com.cn/20221111/c642863226.shtml">蔚来李斌：明年上半年推5款新车，碳酸锂每降10万提升2个点毛利率</a></li>
								<li><a target="_blank" class="" style=""
									title="猛买这些股！千亿私募巨头持仓大曝光！全名单来了" rel="2" id="news_1544831"
									href="//fund.10jqka.com.cn/20221111/c642862143.shtml">猛买这些股！千亿私募巨头持仓大曝光！全名单来了</a></li>
								<li><a target="_blank" class="" style=""
									title="股市“小作文”打趴芯片股？“芯片代工一哥”有力回击" rel="3" id="news_1544817"
									href="//stock.10jqka.com.cn/20221111/c642858133.shtml">股市“小作文”打趴芯片股？“芯片代工一哥”有力回击</a></li>
								<li><a target="_blank" class="" style=""
									title="10天5家A股公司遭立案调查" rel="4" id="news_1544811"
									href="//stock.10jqka.com.cn/20221111/c642860459.shtml">10天5家A股公司遭立案调查</a></li>
								<li><a target="_blank" class="" style=""
									title="医疗信息化未来复合增速有望超28%，概念股逆市大涨" rel="5" id="news_1544805"
									href="//field.10jqka.com.cn/20221111/c642860326.shtml">医疗信息化未来复合增速有望超28%，概念股逆市大涨</a></li>
								<li><a target="_blank" class="" style=""
									title="冲刺！谢治宇、朱少醒、傅友兴加仓这些公司" rel="6" id="news_1544795"
									href="//fund.10jqka.com.cn/20221111/c642859634.shtml">冲刺！谢治宇、朱少醒、傅友兴加仓这些公司</a></li>
								<li class="last"><a target="_blank" class="" style=""
									title="一图看懂A股半年成绩单：指数“深V”逆转" rel="7" id="news_1544789"
									href="http://stock.10jqka.com.cn/20220701/c640178134.shtml">一图看懂A股半年成绩单：指数“深V”逆转</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="gp">
				<form action="QueryStocks" target="_blank">
					<div class="search_1">
						<input placeholder="输入股票代码" class="txt" id="search_input" name="code"
							autocomplete="off"> <input type="submit" value="搜  索"
							id="gp-search">
					</div>
				</form>
			</div>
			<div class="hangqing">
				<div class="menuA">
					<ul>
						<li class="check"><a
							href="http://data.10jqka.com.cn/market/longhu/" target="_blank">龙虎榜</a>
						</li>
						<li><a href="http://data.10jqka.com.cn/market/rzrq/"
							target="_blank">融资融券</a></li>
						<li><a href="http://data.10jqka.com.cn/market/dzjy/ "
							target="_blank">大宗交易</a></li>
					</ul>
				</div>
				<div class="menuB">
					<table style="display: block;" class="one">
						<thead>
							<tr>
								<td>简称</td>
								<td>涨跌幅</td>
								<td>独家解读 <span class="lh-fresh" id="longhuupdate">鏇存柊:11-11</span>
								</td>
							</tr>
						</thead>

						<tbody>
							<tr class="odd">
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/301396/"
									target="_blank">宏景科技</a></td>
								<td class="hqred">24.62%</td>
								<td>游资介入,成功率43.20%</td>
							</tr>
							<tr>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/301230/"
									target="_blank">泓博医药</a></td>
								<td class="hqred">20.00%</td>
								<td>普通席位介入</td>
							</tr>
							<tr class="odd">
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/300917/"
									target="_blank">特发服务</a></td>
								<td class="hqred">19.98%</td>
								<td>游资介入,成功率41.43%</td>
							</tr>
							<tr>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/300051/"
									target="_blank">三五互联</a></td>
								<td class="hqred">19.02%</td>
								<td>游资介入,成功率41.43%</td>
							</tr>
							<tr class="odd">
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/688789/"
									target="_blank">宏华数科</a></td>
								<td class="hqred">15.59%</td>
								<td>普通席位介入</td>
							</tr>
							<tr>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/000671/"
									target="_blank">阳光城</a></td>
								<td class="hqred">10.26%</td>
								<td>游资介入,成功率44.95%</td>
							</tr>
							<tr class="odd">
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/600243/"
									target="_blank">青海华鼎</a></td>
								<td class="hqred">10.11%</td>
								<td>普通席位介入,成功率43.31%</td>
							</tr>
							<tr>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/lhbcjmx/code/600606/"
									target="_blank">绿地控股</a></td>
								<td class="hqred">10.07%</td>
								<td>游资介入</td>
							</tr>
						</tbody>
					</table>

					<table style="display: none;" class="one">
						<thead>
							<tr>
								<td>股票代码</td>
								<td>简称</td>
								<td>融资买入</td>
								<td>融资融券余额</td>
							</tr>
						</thead>
						<tbody>
							<tr class="odd">
								<td>600519</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/600519/"
									target="_blank">贵州茅台</a></td>
								<td>7.35/亿元</td>
								<td>206.92/亿元</td>
							</tr>
							<tr>
								<td>601318</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/601318/"
									target="_blank">中国平安</a></td>
								<td>2.67/亿元</td>
								<td>202.69/亿元</td>
							</tr>
							<tr class="odd">
								<td>601166</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/601166/"
									target="_blank">兴业银行</a></td>
								<td>2.10/亿元</td>
								<td>107.71/亿元</td>
							</tr>
							<tr>
								<td>600030</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/600030/"
									target="_blank">中信证券</a></td>
								<td>1.66/亿元</td>
								<td>96.71/亿元</td>
							</tr>
							<tr class="odd">
								<td>600438</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/600438/"
									target="_blank">通威股份</a></td>
								<td>2.55/亿元</td>
								<td>79.57/亿元</td>
							</tr>
							<tr>
								<td>601012</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/601012/"
									target="_blank">隆基绿能</a></td>
								<td>5.52/亿元</td>
								<td>78.53/亿元</td>
							</tr>
							<tr class="odd">
								<td>600036</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/600036/"
									target="_blank">招商银行</a></td>
								<td>3.95/亿元</td>
								<td>74.55/亿元</td>
							</tr>
							<tr>
								<td>601919</td>
								<td class="name"><a
									href="http://data.10jqka.com.cn/market/rzrqgg/code/601919/"
									target="_blank">中远海控</a></td>
								<td>1.71/亿元</td>
								<td>72.56/亿元</td>
							</tr>

						</tbody>
					</table>
					<table style="display: none;" class="one">
						<thead>
							<tr>
								<td>股票代码</td>
								<td>简称</td>
								<td>收盘价</td>
								<td>溢价率</td>
							</tr>
						</thead>
						<tbody>
							<tr class="odd">
								<td>000002</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000002/#dzjy"
									target="_blank">万科A</a></td>
								<td>15.76</td>
								<td class="hqgreen">0.00%</td>
							</tr>
							<tr>
								<td>000025</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000025/#dzjy"
									target="_blank">特力A</a></td>
								<td>17.83</td>
								<td class="hqgreen">-6.45%</td>
							</tr>
							<tr class="odd">
								<td>000048</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000048/#dzjy"
									target="_blank">京基智农</a></td>
								<td>18.29</td>
								<td class="hqgreen">-11.70%</td>
							</tr>
							<tr>
								<td>000408</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000408/#dzjy"
									target="_blank">藏格矿业</a></td>
								<td>30.68</td>
								<td class="hqgreen">-7.01%</td>
							</tr>
							<tr class="odd">
								<td>000408</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000408/#dzjy"
									target="_blank">藏格矿业</a></td>
								<td>30.68</td>
								<td class="hqgreen">-7.01%</td>
							</tr>
							<tr>
								<td>000560</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000560/#dzjy"
									target="_blank">我爱我家</a></td>
								<td>2.64</td>
								<td class="hqgreen">-7.58%</td>
							</tr>
							<tr class="odd">
								<td>000606</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000606/#dzjy"
									target="_blank">*ST顺利</a></td>
								<td>2.12</td>
								<td class="hqgreen">0.00%</td>
							</tr>
							<tr>
								<td>000606</td>
								<td class="name"><a
									href="http://stockpage.10jqka.com.cn/000606/#dzjy"
									target="_blank">*ST顺利</a></td>
								<td>2.12</td>
								<td class="hqred">1.42%</td>
							</tr>

						</tbody>
					</table>
				</div>
				<%@include file="test3-js.jsp"%>
			</div>
			<div class="ssrmtab">
				<ul class="tab-box">
					<li class="lastn"><a
						href="http://stock.10jqka.com.cn/jiepan_list/" target="_blank">实时解盘</a>
					</li>
				</ul>
				<div class="tab-container3">
					<div class="item">
						<ul class="listn">
							<li><a
								title="李克强在出席东亚合作领导人系列会议期间分别同日本首相岸田文雄、韩国总统尹锡悦、菲律宾总统马科斯会面交谈"
								href="http://stock.10jqka.com.cn/20221112/c642891735.shtml"
								target="_blank">李克强在出席东亚合作领导人系列会议 </a> <span> 11-12 </span></li>
							<li><a title="北京解除长期滞留京外人员弹窗购票限制"
								href="http://stock.10jqka.com.cn/20221112/c642891398.shtml"
								target="_blank">北京解除长期滞留京外人员弹窗购票限 </a> <span> 11-12 </span></li>
							<li><a title="习近平向“杂交水稻援外与世界粮食安全”国际论坛发表书面致辞"
								href="http://stock.10jqka.com.cn/20221112/c642891324.shtml"
								target="_blank">习近平向“杂交水稻援外与世界粮食安 </a> <span> 11-12 </span></li>
							<li><a title="今日0至15时北京新增本土新冠感染者98例 含6例社会面筛查人员"
								href="http://stock.10jqka.com.cn/20221112/c642891264.shtml"
								target="_blank">今日0至15时北京新增本土新冠感染者9 </a> <span> 11-12 </span></li>
							<li><a title="北京不再判定次密接"
								href="http://stock.10jqka.com.cn/20221112/c642891260.shtml"
								target="_blank">北京不再判定次密接 </a> <span> 11-12 </span></li>
							<li><a title="将来是否会全面放开？国家卫健委回应"
								href="http://stock.10jqka.com.cn/20221112/c642891217.shtml"
								target="_blank">将来是否会全面放开？国家卫健委回应 </a> <span> 11-12 </span></li>
						</ul>
					</div>
				</div>
			</div>





		</div>
	</div>
	<div id="block_3367">
		<div class="bottom-link">
			<div id="footer" style="background-color: #212121;">
				<p id="bottom-scroll-listen" data-scroll-taid="web_2bottom"
					class="ta-scroll-box scroll-ta-over">
					<a href="# " rel="nofollow">投资者关系</a> <span class="ff">|</span> <a
						href="# " rel="nofollow">关于股市航海</a> <span>|</span> <a href="#">软件下载</a>
					<span>|</span> <a href="#" rel="nofollow">法律声明</a> <span>|</span> <a
						href="#" rel="nofollow">运营许可</a> <span>|</span> <a href="#"
						rel="nofollow">联系我们</a> <span>|</span> <a href="#" rel="nofollow">友情链接</a>
					<span>|</span> <a href="#" rel="nofollow">招聘英才</a> <span class="ff">|</span>
					<a href="#" rel="nofollow">用户体验计划</a> <span class="ff"> | </span> <a
						href="javascript:void(0);" class="comment violation ">
						涉未成年人违规内容举报 </a> <span class="ff"> | </span> <a
						href="javascript:void(0);"> 算法推荐专项举报 </a>
				</p>
				<p class="c333">
					不良信息举报电话：(0571)88933003 <a href="#" class="smarterwiki-linkify">举报邮箱：18386618380@139.com</a>
					增值电信业务经营许可证：B2-20090237
				</p>
				<p class="c333">Copyright Zhejiang RoyalFlush Network Technology
					Co., Ltd. All rights reserved. 股市航海网络科技有限公司版权所有</p>
				<p class="c333">
					网站备案号： <a href="#" target="_blank">浙ICP备11580062号-1</a>
					证券投资咨询服务提供：股市航海云软件有限公司 （中国证监会核发证书编号：ZF6608）
				</p>
				<div style="width: 570px; margin: 0 auto; padding: 20px 0;">
					<div style="float: left; padding: 10px; margin-right: 60px;">
						<a style="text-decoration: none; height: 20px; line-height: 20px;"
							href="http://www.12377.cn/" target="_blank"> <img
							style="float: left;" src="http://i.thsi.cn/images/icon_jubao.png"
							alt="">
							<p
								style="float: left; height: 20px; line-height: 20px; margin: 0px 0px 0px 5px; color: #939393;">不良信息举报</p>
						</a>
					</div>
					<div style="float: left; padding: 10px">
						<a style="text-decoration: none; height: 20px; line-height: 20px;"
							href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33011002011820"
							target="_blank"> <img style="float: left;"
							src="http://i.thsi.cn/images/beian2016.png" alt="">
							<p
								style="float: left; height: 20px; line-height: 20px; margin: 0px 0px 0px 5px; color: #939393;">浙公网安备
								325010042032140号</p>
						</a>
					</div>
					<div style="float: left; margin-left: 70px; margin-top: 7px">
						<a target="_blank" href="http://zjamr.zj.gov.cn"><img
							src="http://i.thsi.cn/images/icon_gs.png"
							style="float: left; margin-top: 2px" alt="" border="0">
							<p style="float: left; margin-left: 6px">浙江市场监管</p> </a>
					</div>
				</div>
				<div></div>
				<div id="myVerifyImageBox" class="verifyImageBox" siteid="43"
					style="margin-bottom: 20px;"></div>
			</div>
		</div>
	</div>
</body>
</html>