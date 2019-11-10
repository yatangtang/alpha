<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.entity.invitation" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nddmwdf.program.entity.User" %>
<%@ page import="com.nddmwdf.program.entity.Message_port" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    //取出用户ID，并从帖子表中找出所有帖子
    ArrayList<invitation> inv_list;
    UserDao dao = new UserDao();
    User user =(User) session.getAttribute("user");
    inv_list = dao.post_invitation(user.getId(),-1);//帖子集合
    if(inv_list.isEmpty())
    {
        request.setAttribute("post_info","没有帖子或者显示失败");
    }
    else{
        request.setAttribute("post_info","显示成功");
        session.setAttribute("inv_list",inv_list);
    }
%>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <script src="../layui-v2.5.5/layui/layui.all.js"></script>
    <script src="../js/use.js"></script>
    <script src="../js/mesmove.js"></script>
    <script src="../js/mes.js"></script>

    <link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="stylesheet" href="../css/total.css">
    <link rel="stylesheet" href="../css/mes.css">
    <script>
        ;!function(){
            var layer = layui.layer
                ,form = layui.form;
        }();
    </script>
</head>

<body style="background: url(../img/crossword.png)">
<!--顶部导航栏-->
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-md8 layui-col-sm8 layui-col-xs-4"style="padding-left: 2px;">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/logo.png">
                </li>
                <li class="layui-nav-item">
                    <a href="#">易分垃圾网</a>
                </li>
            </ul>
        </div>
        <div class="layui-col-md4 layui-col-sm4">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <a href="/forjsp/index.jsp" >首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/forjsp/garbage.jsp">分类指南</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/forjsp/garbage.jsp">分类查询</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/forjsp/news_center.jsp">新闻中心</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-row" >
        <div id="ul_txt" class="layui-col-md12">
        </div>
        <%
            //循环输出帖子
            for(int i=0;i<inv_list.size();i++)
            {
        %>
        <div class="layui-col-md12">
            <div class="layui-col-md10">
                <div class=""><a href="#"><h5><%= inv_list.get(i).getPost_topic()%></h5></a></div>
                <div>内容：<%=inv_list.get(i).getPost_content()%></div>
                <%
                    //获取这个帖子的评论，并打印出来
                    int t_id=inv_list.get(i).getPost_id();
                    int u_id=inv_list.get(i).getUser_id();
                    ArrayList<Message_port> message_list = dao.port_Message(t_id,u_id);
                    //session.setAttribute("message_list",message_list);
                    if(message_list.size()>0)
                    {
                        for(int j=0;j<message_list.size();j++)
                        {
                %>
                <%

                    if(message_list.get(j).getMessage_port_id()==inv_list.get(i).getUser_id())
                    {
                %>
                <div class="row">
                    <p><a><%=message_list.get(j).getMessage_port_id()%></a>回复<a><%=message_list.get(j).getB_id()%></a>：<%=message_list.get(j).getMessage_content()%></p>
                </div>
                <%
                }else {
                %>
                <div>
                    <p><a><%=message_list.get(j).getMessage_port_id()%></a>评论<a><%=message_list.get(j).getB_id()%></a>：<%=message_list.get(j).getMessage_content()%></p>
                </div>
                <%
                    }
                %>
                <div class="row">
                    <p><%=message_list.get(j).getMessage_time()%></p>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="layui-col-md2">
                <div class="icon-bottom">
                    <span class="layui-icon layui-icon-user">用户名：<%=inv_list.get(i).getUser_id()%> </span>
                </div>
                <div class="icon-bottom">
                    <span class="layui-icon layui-icon-date">时间：<%=inv_list.get(i).getPost_time()%></span>
                </div>
            </div>
            <span class="layui-icon layui-icon-praise layui-col-md2 mes-icon">评论</span>
        </div>
        <hr>
        <%
            }
        %>
    </div>
</div>
<div class="layui-col-md11">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <textarea id="title" placeholder="请输入标题" class="layui-textarea" style="min-height: 30px;"></textarea>
            </div>
        </div>
        <div class="layui-input-block">
            <span class="layui-icon layui-icon-align-left"></span>
            <span class="layui-icon layui-icon-align-center"></span>
            <span class="layui-icon layui-icon-align-right"></span>
            <span class="layui-icon layui-icon-fonts-strong"></span>
            <span class="layui-icon layui-icon-fonts-i"></span>
            <span class="layui-icon layui-icon-fonts-u"></span>
            <span class="layui-icon layui-icon-link"></span>
            <span class="layui-icon layui-icon-picture"></span>
        </div>
        <div class="layui-form-item layui-form-text">
            <div class="layui-input-block">
                <textarea id="txt1" placeholder="请输入内容" class="layui-textarea"></textarea>
                <input class="layui-btn" id="btn1" type="button" style="float: right" value="发布" />
            </div>
        </div>
    </form>
    <div id="page" style="float: right"></div>
</div>

<script>
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage.render({
            elem: 'page'
            , count: 50 //数据总数
        });

    })
</script>
</body>
</html>
