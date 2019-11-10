window.onload=function ()
{
    var oBtn=document.getElementById('btn1');
    var oUl=document.getElementById('ul_txt');
    var oTxt=document.getElementById('txt1');
    var oTit=document.getElementById('title');
    oBtn.onclick=function ()
    {
        var oLi=document.createElement('div');
        oLi.setAttribute('class','layui-col-md12');
        if (oTxt.value == ""){
            alert("输入内容不能为空");
        }
        else {
            oLi.innerHTML=oTit.value+'</br>'+oTxt.value+'<div class="layui-col-md2 mes-icon"><div class="icon-bottom"><span class="layui-icon layui-icon-user">用户名：XXX </span></div><div class="icon-bottom"><span class="layui-icon layui-icon-date">时间：xx-xx-xx</span></div><div><span class=" layui-icon layui-icon-reply-fill mes-mes"style="margin-right: 30px">评论</span><span class="layui-icon layui-icon-praise  mes-mes">点赞</span></div> </div>'+''+'<hr>';
            oTxt.value='';
            oTit.value='';
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