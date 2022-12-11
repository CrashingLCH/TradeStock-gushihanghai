<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <title>点击展开再次点击关闭</title>
</head>
 
<body>
    <div class="_Fu">
        <a href="javasrcipt:;"><span>一级目录</span></a>
        <ul class="_Zi">
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
        </ul>
    </div>
    <div class="_Fu">
        <a href="javasrcipt:;"><span>一级目录</span></a>
        <ul class="_Zi">
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
        </ul>
    </div>
    <div class="_Fu">
        <a href="javasrcipt:;"><span>一级目录</span></a>
        <ul class="_Zi">
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
            <li><a href="#">二级</a></li>
        </ul>
    </div>
</body>
 
<script>
    // 调用方法
    k73('._Fu', '._Zi')
    // 第一个值是父元素第二个值是子元素
    function k73(idParent, idSon) {
        let parent = $(idParent);
        let son = $(idSon);
        son.hide();
        parent.first().find(son).show();//让第一个初始的时候展开
        parent.on('click', function (event) {
            if ($(this).find(son).is(':hidden')) {
                parent.find(son).hide(300);// 关闭其他
                $(this).find(son).show(300);// 显示自己
            } else {
                $(this).find(son).hide(300);// 关闭自己
            }
            event.preventDefault();
        });
    }
</script>
</html>