<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/31
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nddmwdf.program.entity.Garbage" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<link rel="stylesheet" href="../css/search_info.css">
<!--<link rel="stylesheet" href="./css/search.css">-->
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--导航栏部分-->
<div class="nav">
    <ul>
        <li><img src="../img/树叶.png" alt=""></li>
        <li>易分垃圾网</li>
        <li><a href="/forjsp/index.jsp">首页</a></li>
        <li><a href="/forjsp/garbage.jsp">分类指南</a></li>
        <li><a href="/forjsp/search_result.jsp">分类查询</a></li>
        <li><a href="/forjsp/news_center.jsp">新闻中心</a></li>
    </ul>
</div>
<%
    ArrayList<Garbage> garbageList = (ArrayList<Garbage>)session.getAttribute("detail_garbage");
    int i=Integer.parseInt(request.getParameter("id"));
%>
<p>"<%=garbageList.get(i).getName()%>"属于[<%=garbageList.get(i).getType()%>]</p>
<div class="search1">
    <h4>干垃圾</h4><br>
    又称其它垃圾，除有害垃圾、可回收垃圾、是垃圾意外的其他生活废弃物
</div>
<div class="search2">
    <h4>干垃圾主要包括</h4><br>
    餐盒、餐巾纸、湿巾纸、卫生间用纸、塑料袋、食品包装袋、污染严重的纸、烟蒂、纸尿裤、一次性杯子、大骨头、备课等
</div>
<div class="search3">
    <h4><%=garbageList.get(i).getName()%>投放要求</h4><br>
    <ul>
        <li><%=garbageList.get(i).getContent()%></li>
    </ul>
</div>
</body>
</html>
