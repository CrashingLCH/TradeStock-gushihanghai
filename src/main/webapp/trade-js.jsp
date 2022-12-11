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
	var tabList = $_class("hinfo").getElementsByTagName("li")
	tabCon = $_class("tright").getElementsByTagName("div");
	for (i = 0; i < tabList.length; i++) {
		(function() {
			var t = i;
			tabList[t].onclick = function() {
				for (o = 0; o < tabCon.length; o++) {
					tabCon[o].style.display = "none";
					tabList[o].className = "";
					if (t == o) {
						this.className = "active";
						tabCon[o].style.display = "block";
					}
				}
			}
		})()
	}
	var tabList1 = $_class("minfo").getElementsByTagName("td")
	tabCon1 = $_class("tlist3").getElementsByTagName("tr");
	for (i = 0; i < tabList1.length; i++) {
		(function() {
			var t = i;
			tabList1[t].onclick = function() {
				for (o = 0; o < tabCon1.length; o++) {
					tabCon1[o].style.display = "none";
					tabList1[o].className = "";
					if (t == o) {
						this.className = "active2";
						tabCon1[o].style.display = "block";
					}
				}
			}
		})()
	}
	var tabList2 = $_class("minfo1").getElementsByTagName("td")
	tabCon2 = $_class("tlist4").getElementsByTagName("tr");
	for (i = 0; i < tabList2.length; i++) {
		(function() {
			var t = i;
			tabList2[t].onclick = function() {
				for (o = 0; o < tabCon2.length; o++) {
					tabCon2[o].style.display = "none";
					tabList2[o].className = "";
					if (t == o) {
						this.className = "active3";
						tabCon2[o].style.display = "block";
					}
				}
			}
		})()
	}
		</script>
</body>
</html>