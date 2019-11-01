$(function(){
    $(".garbage_name>li").mouseover(function(){
        $(this).addClass("current");
        $(this).siblings().removeClass("current");
        var index=$(this).index();
        $li=$(".garbage_img>li").eq(index);
        // console.log($li);
        ($li).addClass("show");
        ($li).siblings().removeClass("show");
    });
});