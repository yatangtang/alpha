<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
    String title=request.getParameter("title");
    String time=request.getParameter("shijian");
    String text=request.getParameter("text");
    String author=request.getParameter("author");
%>
<link rel="stylesheet" href="../css/newinfo.css">
<head>
    <meta charset="UTF-8">
    <title>新闻嗷</title>
</head>
<body>
<div class="newinfo_left">
    <img src="../img/树叶.png" alt="">
    <ul class="center">
        <li>易分环保网</li>
        <li><a href="../forjsp/index.jsp">首页</a></li>
        <!--<li>注册</li>-->
        <li><a href="../forjsp/garbage.jsp">分类指南</a></li>
        <li><a href="../forjsp/garbage.jsp">分类查询</a></li>
        <li><a href="../forjsp/news_center.jsp">新闻中心</a></li>
        <!--<li><img src="img/QQ.png" alt="">-->
        <!--<img src="img/微博.png" alt=""></li>-->
        <!--<li></li>-->
    </ul>
</div>
<div class="newinfo_center">
    <h2><%=title%></h2>
    <br>
    <%=time%> | 作者: <%=author%>
    <div class="newinfo_new">
        <pre style="white-space: pre-wrap;"><%=text%></pre>
        <%--<span class="return"><a href="/forjsp/news_center.jsp">返回>></a></span>--%>
    </div>
    <%--<div class="newinfo_bottom">--%>
        <%----%>
    <%--</div>--%>
</div>


<div class="new_center-right">
    <img src="../img/蒲公英.png" alt="">
</div>
</body>
</html>
