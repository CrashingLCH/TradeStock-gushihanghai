<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jqueryform.js"></script>
</head>
<body>
	<div>
		<ul>
			<li>
				<button type="button" class="btn btn-primary" οnclick="addOrder()">
					确认添加</button>
			</li>
		</ul>
	</div>

</body>
<script>
function addOrder() {
    $('#orderAddForm').ajaxSubmit( {
        url : "/order/add",
        success: function(data) {
            if(data=="1"){
                alert("添加成功")
            }
            else{
                alert("添加失败")
            }
        },
    });
    $('#myModal').modal("hide")
    return false;
}
</script>
</html>