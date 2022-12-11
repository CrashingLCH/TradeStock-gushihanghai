<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>www.jb51.net 脚本之家</title>
  <style>
    * {
      margin: 0;
      padding: 0;
    }
    ul {
      list-style-type: none;
    }
    .box {
      width: 400px;
      height: 300px;
      border: 1px solid #ccc;
      margin: 100px auto;
      overflow: hidden;
    }
    .hd {
      height: 45px;
    }
    .hd span {
      display: inline-block;
      width: 90px;
      background-color: pink;
      line-height: 45px;
      text-align: center;
      cursor: pointer;
    }
    .hd span.current {
      background-color: yellowgreen;
    }
    .bd li {
      height: 255px;
      background-color: yellowgreen;
      display: none;
    }
    .bd li.current {
      display: block;
      font-size: 36px;
    }
  </style>
</head>
<body>
<div class="box" id="box">
  <div class="hd">
    <span class="current">体育</span>
    <span>娱乐</span>
    <span>新闻</span>
    <span>综合</span>
  </div>
  <div class="bd">
    <ul>
      <li class="current">我是体育模块</li>
      <li>我是娱乐模块</li>
      <li>我是新闻模块</li>
      <li>我是综合模块</li>
    </ul>
  </div>
</div>
<script>
var box = document.getElementById("box");
var spans = box.getElementsByTagName("span");
var lis = box.getElementsByTagName("li");
for (var i = 0; i < spans.length; i++) {
  spans[i].aaa = i;
  spans[i].onclick = function () {
    for (var i = 0; i < spans.length; i++) {
      spans[i].className = "";
      lis[i].className = "";
    }
    this.className = "current";
    lis[this.aaa].className = "current";
  }
}
</script>
</body>
</html>

