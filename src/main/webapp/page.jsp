<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>所有用户列表</h4>
<form action="PageServlet" method="post">
<input name="start" value="0">

<button type="submit">查询</button>
</form>

<table style="border:1px;width:60%;">
  <tr>
    <td>用户姓名</td>
    <td>用户性别</td>
    <td>操作</td>  
  </tr> 
<!--遍历显示-->
<tr>
	<c:if test="${!empty map }">
	<c:forEach items="${map.stock}" var="stock">
	<td>${stock.id}</td>
	<td>${stock.name}</td>
	<td>${stock.code}</td>
	<td>${stock.price}</td>
	</c:forEach>
	</c:if>
</tr>
 
</table>
	<nav>
	    <ul class="pagination">
	        <li>
	            <a  href="PageServlet?start=0">
	                <span>首页</span>
	            </a>
	        </li>        
	        <li>
	            <a  href="PageServlet?start=${requestScope.prePage }">
	                <span>前一页</span>
	            </a>
	        </li> 
	        <li>
	            <a  href="PageServlet?start=${requestScope.nextPage }">
	                <span>后一页</span>
	            </a>
	        </li> 
	        <li>
	            <a href="PageServlet?start=${requestScope.totalPage-1} ">
	                <span>尾页</span>
	            </a>
	        </li>
	    </ul>   
	</nav>
</body>
</html>