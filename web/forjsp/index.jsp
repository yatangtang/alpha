<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<meta charset="UTF-8">
<title>Title</title>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jqthumb.js"></script>
<script type="text/javascript" src="../layui-v2.5.5/layui/layui.all.js"></script>
<script type="text/javascript" src="../js/index.js"></script>

<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
<link rel="script" href="../js/move.js">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/total.css">
<%
    boolean isLogin = false;
    String loginName = (String)request.getSession().getAttribute("username");
    if(loginName != null && !"".equals(loginName)){
        isLogin = true;
    }
    request.setAttribute("isLogin",isLogin);
    request.setAttribute("username",loginName);
%>
</head>
<script>
    ;!function(){
        var layer = layui.layer
            ,form = layui.form;
    }();
</script>
<style>
    .layui-nav{
        border-radius: 0px;
    }
    .layui-nav-tree {
        /* width: 200px; */
        padding: 0;
        width: auto;
    }
</style>
<body style="background:url(../img/houndstooth-pattern.png)">
<!--顶部导航-->
<div class="layui-fluid"style="padding: 0px;">
    <div class="layui-row">
        <div class="layui-col-md9 layui-col-sm2">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/logo.png">
                </li>
                <li class="layui-nav-item">
                    <a href="#">易分垃圾网</a>
                </li>
            </ul>
        </div>
        <div class="layui-col-md3 layui-col-sm1">
            <ul class="layui-nav layui-bg-green">
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="index.jsp">--%>
                        <%--<span class="layui-icon layui-icon-home">首页</span>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li class="layui-nav-item">
                    <a href="login.jsp">
                        <span class="layui-icon layui-icon-user">欢迎你，${loginName}</span>
                    </a>
                </li>

                <li class="layui-nav-item">
                    <a href="login.jsp">
                        <span class="layui-icon layui-icon-user">登录</span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="register.jsp">
                        <span class="layui-icon layui-icon-release">注册</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--搜索-->
<div class="layui-container" style="height: 500px;background-image: url(../img/bg.jpg);padding-left: 0px;">
    <div class="layui-row">
        <div class="layui-col-md1"style="margin-top: 130px;">
            <div class="layui-row">
                <div>
                    <button type="button" id="rbtn" class="layui-btn layui-btn-sm">
                        <span id="iconsp" class="layui-icon layui-icon-right"style="font-size: larger;position: relative"></span>
                    </button>
                </div>
                <div id="rnav" style="display: none;">
                    <ul class="layui-nav layui-nav-tree">
                        <li class="layui-nav-item">
                            <a href="search_result.jsp">分类查询</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="garbage.jsp">分类指南</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="news_center.jsp">新闻中心</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="#">加入我们</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="layui-col-md10">
            <!--文字-->
            <div class="text-center"style="padding-top: 150px;">
                <h2 class="font">
                    易分垃圾网
                </h2>
            </div>
            <!--搜索框-->
            <form class="layui-form" action="/GarbageSearch" method="post">
                <div class="layui-form-item"></div>
                <div class="layui-input-block" style="border-radius: 0px;">
                    <input type="text" name="garbage_name" required  lay-verify="required" placeholder="请输入要搜索的垃圾" autocomplete="off" class="layui-input">
                    <button type="button" class="layui-btn layui-btn-primary layui-btn-md">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--新闻中心-->
<div class="container-fluid">
    <fieldset class="layui-elem-field title" style="margin-bottom: 0px;">
        <legend>新闻中心</legend>
    </fieldset>
</div>
<div class="container" style="margin-top: 30px;">
    <div class="row" id="div1">
        <div class="col-xs-1 col-md-3 ">
            <a href="newinfo.jsp" class="thumbnail">
                <img src="../img/new.jpg" class="img-responsive"onload="DrawImage(this)">
                <h3>垃圾回收场</h3>
                <p>2008年中国某地塑料瓶回收场.....</p>
            </a>
        </div>
        <div class="col-xs-1 col-md-3">
            <a href="newinfo.jsp" class="thumbnail">
                <img src="../img/new1.jpg" class="img-responsive"onload="DrawImage(this)">
                <h3>上海推进垃圾分类</h3>
                <p>shhklsfkdskjfkdslj</p>
            </a>
        </div>
        <div class="col-xs-1 col-md-3">
            <a href="newinfo.jsp" class="thumbnail">
                <img src="../img/new2.jpg" class="img-responsive"onload="DrawImage(this)">
                <h3>建立垃圾回收亭</h3>
                <p>shhklsfkdskjfkdslj</p>
            </a>
        </div>
        <div class="col-xs-1 col-md-3">
            <a href="newinfo.jsp" class="thumbnail">
                <img src="../img/new3.jpg" class="img-responsive"onload="DrawImage(this)">
                <h3>相关垃圾摄影作品</h3>
                <p>shhklsfkdskjfkdslj</p>
            </a>
        </div>
    </div>
</div>

<!--交流中心--->
<div class="container-fluid">
    <fieldset class="layui-elem-field title" style="margin-bottom: 0px;">
        <legend>交流中心</legend>
    </fieldset>
</div>
<div class="container" style="margin-left: 60px;">
    <div class="row text-center " >
        <div class="col-xs-6 col-md-1"></div>
        <div class="col-xs-1 col-md-1"style="margin-top: 90px;">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-md">
                <span class="layui-icon layui-icon-left"style="font-size: 30px;"></span>
            </button>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="message.html" class="thumbnail">
                <img src="../img/mes.jpeg" class="img-responsive"onload="DrawImage(this)">
            </a>
        </div>
        <div class="col-xs-6 col-md-3 ">
            <a href="message.html" class="thumbnail">
                <img src="../img/mes1.jpeg" class="img-responsive"onload="DrawImage(this)">
            </a>
        </div>
        <div class="col-xs-6 col-md-3 ">
            <a href="message.html" class="thumbnail">
                <img src="../img/mes2.jpg" class="img-responsive"onload="DrawImage(this)">
            </a>
        </div>

        <div class="col-xs-1 col-md-1"style="margin-top: 85px;">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-md">
                <span class="layui-icon layui-icon-right"style="font-size: 30px;"></span>
            </button>
        </div>
    </div>
</div>

<!--关于我们-->
<div class="container-fluid">
    <fieldset class="layui-elem-field title" style="margin-bottom: 0px;">
        <legend>关于我们</legend>
    </fieldset>
</div>
<div class="text-center footer">
    <span class="layui-icon layui-icon-login-weibo " style="font-size: 30px;padding: 20px;"></span>
    <span class="layui-icon layui-icon-login-wechat" style="font-size: 30px; padding: 20px;"></span>
    <span class="layui-icon layui-icon-login-qq" style="font-size: 30px; padding: 20px"></span>
</div>
</div>
</body>
</html>