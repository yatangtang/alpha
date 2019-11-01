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