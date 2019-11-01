window.onload=function ()
{
    var oBtn=document.getElementById('btn1');
    var oUl=document.getElementById('ul1');
    var oTxt=document.getElementById('txt1');
    oBtn.onclick=function ()
    {
        var oLi=document.createElement('li');
        oLi.setAttribute('class','layui-col-md12')
        if (oTxt.value == ""){
            alert("输入内容不能为空");
        }
        else {
            oLi.innerHTML='<img class="img-responsive laui-col-md1 layui-col-xs1 thumbnail" src="img/vator.jpeg">'+'<h5 class="layui-col-md1 layui-col-xs3"style="padding: 0px">用户名：XXX 时间：xx-xx-xx</h5>'
                +oTxt.value+'<span class="layui-icon layui-icon-praise layui-col-md2 mes-icon">点赞<span class="layui-col-md3 layui-icon layui-icon-reply-fill"style="margin-right: 30px">评论</span></span>'+'';
            oTxt.value='';

            if(oUl.children.length>0)
            {
                oUl.insertBefore(oLi, oUl.children[0]);

            }
            else
            {
                oUl.appendChild(oLi);
            }

            //运动
            var iHeight=oLi.offsetHeight;
            oLi.style.height='0';

            startMove(oLi, {height: iHeight}, function (){
                startMove(oLi, {opacity: 100});
            });

            //alert(iHeight);
        }


    };
};