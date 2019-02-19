$(function () {
    $(".item-name > i").click(function () {
        $(this).parent().parent().toggleClass("unfold")
        $(this).parent().parent().find("ul:first").slideToggle(500);
        $(this).toggleClass("unfold");
        $(this).parent().children(".filename").toggleClass("filename-open");
    });

    //隐藏和显示菜单栏
    $('#hidden-show-btn').click(function () {
        if ($('#map-menu').hasClass('isHidden')) {
            $('#map-menu').removeClass('isHidden').animate({left: "0"});
            $('#map-menu a img').attr('src', '/resource/map/images/shousuo.png');
        } else {
            $('#map-menu').addClass('isHidden').animate({left: "-270px"});
            $('#map-menu a img').attr('src', '/resource/map/images/zhankai.png');
        }
    });
    //切换菜单选项
    $('#menu-option ul li a').click(function () {
        if (!$(this).hasClass('actived-option')) {
            var optionClass = $(this).attr('class');
            $('#menu-option ul li a').removeClass('actived-option');
            $(this).addClass('actived-option');
            var panelClass = 'panel_' + optionClass.split('_')[1];
            $('.' + panelClass).show().siblings('.option-panel').hide();
        }
    });
})

var keyQueryDialog;  //定义关键字查询弹出框

function ShowJS() {
    layer.open({
        type: 1,
        title: '<i class="iconfont icon-13" style="font-size: 12px"></i>&nbsp;片长制介绍',
        area: ['800px', '530px'],
        content: $('#divPCZJS'),
        moveOut: true,
        shadeClose: false,
        anim: 1,
        resize: false
    });
}

function TJ() {
    layer.open({
        type: 2,
        title: '<i class="iconfont icon-13" style="font-size: 12px"></i>&nbsp;统计信息',
        area: ['800px', '530px'],
        content: '/map/statistic',
        moveOut: true,
        shadeClose: false,
        anim: 1,
        resize: false
    });
}

function ZTTJ() {
    art.dialog.open('MyCharts.html',
        {title: '整体片区统计', lock: true, width: 1050, height: 520});
}