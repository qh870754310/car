/**
 * 功能对象
 * @type {{openForm: func.openForm, delConfirm: func.delConfirm}}
 */
var func = {
    /**
     * 打开表单
     * @param option 选项
     */
    openForm: function (option) {
        var defaultOption = {
            title: '信息',
            width: '700px',
            height: '480px',
            url: null
        };
        option = $.extend(defaultOption, option);
        layer.open({
            type: 2,
            title: '<i class="iconfont icon-pencil" style="font-size: 12px"></i>&nbsp;' + option.title,
            resize: false,
            moveOut: true,
            anim: 1,
            area: [option.width, option.height],
            content: option.url,
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($(layero).find("iframe")[0].contentWindow.subForm()) {
                    layer.close(index);
                    top.layer.msg('恭喜您，数据提交成功！', {icon: 1, offset: '2px'});
                    reloadGrid();
                } else {
                    top.layer.msg('很抱歉，数据提交失败！', {icon: 5, offset: '2px'});
                }
            }
        });
    },
    /**
     * 删除确认框
     * @param url 删除请求地址
     */
    delConfirm: function (url) {
        layer.confirm('您确认要删除选中数据吗？', {
            icon: 3,
            title: '<i class="iconfont icon-prompt" style="font-size: 12px"></i>&nbsp;提示',
            anim: 1
        }, function (index) {
            $.ajax({
                url: url,
                type: "GET",
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.state) {//删除成功
                        top.layer.msg('恭喜您，数据删除成功！', {icon: 1, offset: '2px'});
                        reloadGrid();
                    } else {//删除失败
                        top.layer.msg('很抱歉，数据删除失败！', {icon: 5, offset: '2px'});
                    }
                }
            });
            layer.close(index);
        });
    },
    /**
     * 顶部提示信息
     * @param msg 信息内容
     * @param icon 图标（1-7）
     */
    topMsg: function (msg, icon) {
        if (!msg) {
            msg = '这是默认信息！';
        }
        if (!icon) {
            icon = 1;
        }
        top.layer.msg(msg, {icon: icon, offset: '2px'});
    },
    /**
     * 添加提示信息
     * @param id id
     * @param prompt 内容
     * @param offset 偏移
     * @param timer 定时器
     */
    addPrompt: function (id, prompt, offset, timer) {
        var $target = $('#' + id);
        $target.find('.prompt').remove();
        $target.append('<div class="prompt animated fadeIn" style="top: ' + offset + ';">' + prompt + '</div>');
        if (timer !== undefined) {
            clearTimeout(timer);
        }
        return setTimeout("$('#" + id + "').find('.prompt').remove();", 2500);
    }
};