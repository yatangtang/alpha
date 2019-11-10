function DrawImage(hotimg) {
    $(hotimg).jqthumb({
        width: '100%',//宽度
        height: '180px',//高度
        //position : { y: '50%', x: '50%'},//从图片的中间开始产生缩略图
        zoom: '1',//缩放比例
        method: 'auto'//提交方法，用于不同的浏览器环境，默认为‘auto’
    });
};
window.onload=function () {
    var oBtn=document.getElementById('rbtn')
    var oDiv=document.getElementById('rnav')
    var iSp=document.getElementById('iconsp')
    oBtn.onclick=function () {
        if(oDiv.style.display=='none')
        {
            oDiv.style.display='block';
            iSp.setAttribute("class","layui-icon layui-icon-left")
        }
        else {
            oDiv.style.display='none';
            iSp.setAttribute("class","layui-icon layui-icon-right")
        }

    }
}
layui.use(['layer', 'form'],function(){
    var layer = layui.layer
        ,form = layui.form;
    form.on('submit(search)', function(data){
        console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
        console.log(data.form) ;//被执行提交的form对象，一般在存在form标签时才会返回
        console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}

    });
});