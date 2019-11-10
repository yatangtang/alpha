<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/23
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.entity.User" %>
<%@ page import="java.util.List" %>
<html>
<%
    //打开浏览器时给pageno初始化，不然会报空指针异常
    UserDao ul = new UserDao();
    User user=new User();
    if(request.getAttribute("pageno") == null){
        request.setAttribute("pageno",1);
    }
    //给每条数据编序号
    int count = 5*(Integer)request.getAttribute("pageno")-5;
        if (request.getAttribute("us") == null) {
            List<User> al = ul.queryuserlimit(1);
            request.setAttribute("us", al);
            int pagenum = ul.getPage();
            request.setAttribute("pagenum", pagenum);
        }
%>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>

        <span class="x-right" style="line-height:40px">共有数据：<%= (Integer)request.getAttribute("usernum") %>条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>登录名</th>
            <th>用户名</th>
            <th>性别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <c:forEach items="${us}" var="user">
            <td>
            <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td><%= count+=1 %></td>
        <td>${user.loginName}</td>
        <td>${user.name}</td>
        <td>${user.sex}</td>

        <td class="td-manage">
            <%--<a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">--%>
                <%--<i class="layui-icon">&#xe601;</i>--%>
            <%--</a>--%>
            <%--<a title="编辑"  onclick="x_admin_show('编辑','member-edit.html',600,400)" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe642;</i>--%>
            <%--</a>--%>
            <%--<a onclick="x_admin_show('修改密码','member-password.html',600,400)" title="修改密码" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe631;</i>--%>
            <%--</a>--%>
            <a title="删除" onclick="" href="/UserDelete?username=${user.loginName}">
                <i class="layui-icon">&#xe640;</i>
            </a>
        </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <td><button onclick="First()">首页</button></td>
            <td><button onclick="Last()">上一页</button></td>
            <td><button onclick="Next()">下一页</button></td>
            <td><button onclick="End()">尾页</button></td>
            <label>当前数据库中共有<%= (Integer)request.getAttribute("pagenum") %>页</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>跳转至第</label>
            <input id="randompage" type="text"  />页
            <button onclick="random()">跳转</button>
            <label>当前是第<%= (Integer)request.getAttribute("pageno") %>页</label>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>

    function First(){
        location.href = "/UserPage?pageno=1";
    }

    function Last(){
        var pageno =<%= (Integer)request.getAttribute("pageno")  %>
        if(pageno<=1){
            alert("这已经是最前面一页！");
            return;
        }else{
            pageno = pageno-1;
            location.href = "/UserPage?pageno="+pageno;
        }
    }
    function Next(){
        var pageno =<%= (Integer)request.getAttribute("pageno")  %>
        var pagenum =<%= (Integer)request.getAttribute("pagenum") %>
        if(pageno>=pagenum){
            alert("没有下一页了！");
            return;
        }else{
            pageno++;
            location.href = "/UserPage?pageno="+pageno;
        }
    }

    function End(){
        var pagenum =<%= (Integer)request.getAttribute("pagenum") %>
            location.href = "/UserPage?pageno="+pagenum;
    }

    function random(){
        var spage=document.getElementById("randompage").value;
        var pagenum =<%= (Integer)request.getAttribute("pagenum") %>

        if((spage>=1) && (spage<=pagenum)){
            var pageno = spage;
            location.href = "/UserPage?pageno="+pageno;
        }else{
            alert("超出页码范围！请重新输入");
        }
    }
</script>
</body>
</html>
