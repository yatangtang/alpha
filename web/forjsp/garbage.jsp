<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="../css/garbage.css">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script src="../js/garbage.js"></script>
</head>
<body>
<!--顶部导航栏部分-->
<div class="top">
    <span><img src="../img/树叶.png" alt=""><p>易分环保网</p></span>
    <div class="top_nav">
        <ul>
            <li><a href="index.jsp"><img src="../img/首页.png" alt="">首页</a></li>
            <li><a href="garbage.jsp"><img src="../img/分类.png" alt="">垃圾分类</a></li>
            <li><a href="news_center.jsp"><img src="../img/新闻.png" alt="">新闻</a></li>
            <li><a href="message.html"><img src="../img/论坛.png" alt="">论坛</a></li>
        </ul>
    </div>
</div>
<!--视频部分-->
<div class="video">
    <video src="../video/垃圾分类.mp4" width="1000px" height="300px" autoplay="autoplay"  loop="loop"
           muted="muted"></video>
    <div class="search">
        <input type="text" class="search_box">
        <div class="search_img">
            <a href="garbage.jsp"><img src="../img/搜索.png" alt=""></a>
        </div>
    </div>
</div>
<!--垃圾分类部分-->
<div class="garbage">
    <div class="garbage_left">
        <ul class="garbage_name">
            <li class="current">其他垃圾</li>
            <li>厨余垃圾</li>
            <li>有害垃圾</li>
            <li>可回收垃圾</li>
        </ul>
        <ul class="garbage_img">
            <li class="show">
                <ul>
                    <li><a href="rbdetail.html"><img src="../img/q-一次性餐具.jpg" alt="一次性餐具">
                    </a><span>一次性餐具</span></li>
                    <li><a href="rbdetail.html"><img src="../img/q-废旧陶瓷品.jpg" alt="废旧陶瓷品"></a>
                        <span>废旧陶瓷品</span></li>
                    <li><a href="rbdetail.html"><img src="../img/q-污染纸张.jpg" alt="污染纸张"></a>
                        <span>污染纸张</span></li>
                    <li><a href="rbdetail.html"><img src="../img/q-灰土.jpg" alt="灰土"></a>
                        <span>灰土</span></li>
                    <li><a href="rbdetail.html"><img src="../img/q-烟头.jpg" alt="烟头"></a>
                        <span>烟头</span></li>
                    <li><a href="rbdetail.html"><img src="../img/q-砖.jpg" alt="砖头"></a>
                        <span>砖头</span></li>
                </ul>
            </li>
            <li>
                <ul >
                    <li><a href="rbdetail.html"><img src="../img/c-剩菜.jpg" alt=""></a>
                        <span>剩菜</span></li>
                    <li><a href="rbdetail.html"><img src="../img/c-果皮.jpg" alt=""></a> <span>果皮</span></li>

                    <li><a href="rbdetail.html"><img src="../img/c-茶叶渣.jpg" alt=""></a><span>茶叶渣</span></li>

                    <li><a href="rbdetail.html"><img src="../img/c-菜叶.jpg" alt=""></a> <span>菜叶</span></li>

                    <li><a href="rbdetail.html"><img src="../img/c-蛋壳.jpg" alt=""></a><span>蛋壳</span></li>

                    <li><a href="rbdetail.html"><img src="../img/c-骨头.jpg" alt=""></a><span>骨头</span></li>

                </ul>
            </li>
            <li>
                <ul >
                    <li><a href="rbdetail.html"><img src="../img/y-废杀虫喷雾罐.jpg" alt=""></a>
                        <span>废杀虫喷雾罐</span></li>
                    <li><a href="rbdetail.html"><img src="../img/y-废油漆桶.jpg" alt=""></a>
                        <span>废油漆桶</span></li>
                    <li><a href="rbdetail.html"><img src="../img/y-废温度计.jpg" alt=""></a>
                        <span>废温度计</span></li>
                    <li><a href="rbdetail.html"><img src="../img/y-废灯管.jpg" alt=""></a>
                        <span>废灯管</span></li>
                    <li><a href="rbdetail.html"><img src="../img/y-废药品.jpg" alt=""></a>
                        <span>废药品</span></li>
                    <li><a href="rbdetail.html"><img src="../img/y-电池.jpg" alt=""></a>
                        <span>废电池</span></li>
                </ul>
            </li>
            <li>
                <ul >
                    <li><a href="rbdetail.html"><img src="../img/k-塑料.jpg" alt=""></a>
                        <span>塑料</span></li>
                    <li><a href="rbdetail.html"><img src="../img/k-布料.jpg" alt=""></a>
                        <span>废布料</span></li>
                    <li><a href="rbdetail.html"><img src="../img/k-玻璃.jpg" alt=""></a>
                        <span>废玻璃</span></li>
                    <li><a href="rbdetail.html"><img src="../img/k-硬纸板.jpg" alt=""></a>
                        <span>废硬纸板</span></li>
                    <li><a href="rbdetail.html"><img src="../img/k-纸.jpg" alt=""></a>
                        <span>废纸</span></li>
                    <li><a href="rbdetail.html"><img src="../img/k-金属器材.jpg" alt=""></a>
                        <span>废金属器材</span></li>
                </ul>
            </li>
        </ul>
        <a href="#" class="span_more">更多>></a>

    </div>
    <div class="location">
        <p>学校宿舍楼分类垃圾桶位置:</p>
        <p>二栋宿舍楼下   四栋宿舍楼下   七栋宿舍楼下   九栋宿舍楼下 </p>
        <p>十一栋宿舍楼下   十四栋宿舍楼下   十六栋宿舍楼下   十七栋宿舍楼下</p>
    </div>
</div>
<div class="bottom">
    <ul class="about">
        <li>关于</li>
        <li>关于我们</li>
        <li>加入我们</li>
        <li>使用条款</li>
        <li>隐私协议</li>

    </ul>
    <ul class="contact">
        <li>联系我们</li>
        <li>发送邮箱至xxxxx</li>
        <li><img src="../img/QQ.png" alt=""></li>
        <li><img src="../img/微博.png" alt=""> </li>

    </ul>
    <ul class="more">
        <li>更多</li>
        <li>向他人介绍</li>
    </ul>
    <ul class="business">
        <li>商业合作</li>
        <li>活动协商</li>
        <li>资源合作</li>
        <li>商业融资</li>
    </ul>
</div>
</body>
</html>
