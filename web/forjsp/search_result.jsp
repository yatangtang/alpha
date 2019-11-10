<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nddmwdf.program.entity.Garbage" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="../css/search_result2.css">
<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>查询结果</title>
</head>
<body>
<!--导航栏部分-->
<div class="nav">
    <ul>
        <li><img src="../img/树叶.png" alt=""></li>
        <li>易分垃圾网</li>
        <li><a href="../forjsp/index.jsp">首页</a></li>
        <li><a href="../forjsp/garbage.jsp">分类指南</a></li>
        <li><a href="../forjsp/garbage.jsp">分类查询</a></li>
        <li><a href="../forjsp/news_center.jsp">新闻中心</a></li>
    </ul>
</div>
<div class="search">
    <form method="post" action="/GarbageSearch">
    <input type="text" class="search_box" name="garbage_name">
    <div class="search_img">
        <img src="../img/搜索.png" alt="">
    </div>
    </form>
</div>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>#</th>
        <th>查询项</th>
        <th>垃圾分类</th>
        <th>注意事项</th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<Garbage> garbageList = (ArrayList<Garbage>)request.getAttribute("user_list");
        session.setAttribute("detail_garbage",garbageList);
        int len = (int)request.getAttribute("list_size");
        for(int i=0;i<len;i++){
    %>
    <tr>
        <td><%= i%></td>
        <td><%=garbageList.get(i).getName()%></td>
        <td><%=garbageList.get(i).getType()%></td>
        <td><a href="../forjsp/search_info.jsp?id=<%=i%>&name=id">详情</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
