<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script>
	function $_class(name) {
		var elements = document.getElementsByTagName("*");
		for (s = 0; s < elements.length; s++) {
			if (elements[s].className == name) {
				return elements[s];
			}
		}
	}
	var tabList = $_class("table-tab m-pager-board").getElementsByTagName("h4")
	tabCon = $_class("maincont").getElementsByTagName("tbody");
	for (i = 0; i < tabList.length; i++) {
		(function() {
			var t = i;
			tabList[t].onclick = function() {
				for (o = 0; o < tabCon.length; o++) {
					tabCon[o].style.display = "none";
					tabList[o].className = "";
					if (t == o) {
						this.className = "cur";
						tabCon[o].style.display = "table-row-group";
					}
				}
			}
		})()
	}
		</script>
</body>
</html>