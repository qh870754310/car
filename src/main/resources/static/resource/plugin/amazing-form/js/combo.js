/**
 * 下拉框
 * @param id 下拉框id
 * @param url 数据请求地址
 * @param verifier 验证器
 * @constructor 构造器
 */
function Combo(id, url, verifier) {
    Select.call(this, id, verifier);//继承表单元素
    if (url) {
        this.url = url;
    } else {
        this.url = undefined;
    }
}

inheritPrototype(Combo, Select);

/**
 * Combo数据重载
 * @param url 数据请求地址
 */
Combo.prototype.reload = function (url) {
    if (url) {
        this.url = url;
    }
    var combo = this, $combo = $('#' + combo.id);
    $combo.next('.option-box').find('dd').remove();
    if (this.url !== undefined) {
        $.ajaxSettings.async = false;
        $.getJSON(this.url, function (json) {
            $.each(json, function (i, o) {
                $combo.next('.option-box').find('dl').append('<dd data-key="' + o.key + '">' + o.value + '</dd>');
            });
        });
        $.ajaxSettings.async = true;
        $combo.next('.option-box').find('dd').on('click', function () {
            if (combo.callBack !== undefined) {
                var oldVal = $combo.val();
                $combo.val($(this).text()).attr('data-key', $(this).attr('data-key'));
                $(this).addClass('active').siblings('dd').removeClass('active');
                if (combo.getValue() !== oldVal) {
                    combo.callBack();
                }
            } else {
                $combo.val($(this).text()).attr('data-key', $(this).attr('data-key'));
                $(this).addClass('active').siblings('dd').removeClass('active');
            }
        });
    }
};