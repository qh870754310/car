/**
 * 下拉框
 * @param id 下拉框id
 * @param verifier 验证器
 * @constructor 构造器
 */
function Select(id, verifier) {
    FormElement.call(this, id, verifier);//继承表单元素
    this.callBack = undefined;
}

inheritPrototype(Select, FormElement);

/**
 * 下拉框取值
 * @returns {*|jQuery}
 */
Select.prototype.getValue = function () {
    return $('#' + this.id).attr('data-key');
};

/**
 * 下拉框赋值
 * @param val 值
 */
Select.prototype.setValue = function (val) {
    var $target = $('#' + this.id), hasOption = false;
    $target.next('.option-box').find('dd').each(function () {
        if ($(this).attr('data-key') == val) {
            $(this).addClass('active').siblings('dd').removeClass('active');
            $target.attr('data-key', val).val($(this).text());
            hasOption = true;
        }
    });
    if (!hasOption) {
        $target.removeAttr('data-key').val('').next('.option-box').find('dd.active').removeClass('active');
    }
};

/**
 * 下拉框值改变事件
 * @param func 回调函数
 */
Select.prototype.onChange = function (func) {
    var select = this, $select = $('#' + select.id);
    this.callBack = func;
    $select.next('.option-box').find('dd').off('click').on('click', function () {
        var oldVal = select.getValue();
        $select.val($(this).text()).attr('data-key', $(this).attr('data-key'));
        $(this).addClass('active').siblings('dd').removeClass('active');
        if (select.getValue() !== oldVal) {
            func();
        }
    });
    $select.next('.option-box').next('.remove').off('click').on('click', function () {
        var oldVal = select.getValue();
        $select.val('').removeAttr('data-key');
        $select.next('.option-box').find('dd.active').removeClass('active');
        if (oldVal) {
            func();
        }
    });
};

/**
 * 下拉框锁定
 * @param placeholder 提示信息
 */
Select.prototype.lock = function (placeholder) {
    var $select = $('#' + this.id);
    $select.css('cursor', 'not-allowed').attr('placeholder', placeholder).off('click');
    $select.next('.option-box').next('.remove').hide();
};

/**
 * 下拉框解锁
 */
Select.prototype.unlock = function () {
    var $select = $('#' + this.id);
    $select.css('cursor', 'pointer').attr('placeholder', '点击选择').off('click').on('click', function (e) {
        $(this).next('.option-box').toggleClass('active');
        e.stopPropagation();
    });
    $select.next('.option-box').next('.remove').show();
};

/**
 * 下拉框数据重载
 * @param data json数组
 */
Select.prototype.reload = function (data) {
    var select = this, $select = $('#' + select.id), $optionBox = $select.next('.option-box');
    $optionBox.find('dd').remove();
    $.each(data, function (i, o) {
        $optionBox.find('dl').append('<dd data-key="' + o.key + '">' + o.value + '</dd>');
    });
    $optionBox.find('dd').on('click', function () {
        if (select.callBack !== undefined) {
            var oldVal = select.getValue();
            $select.val($(this).text()).attr('data-key', $(this).attr('data-key'));
            $(this).addClass('active').siblings('dd').removeClass('active');
            if (select.getValue() !== oldVal) {
                select.callBack();
            }
        } else {
            $select.val($(this).text()).attr('data-key', $(this).attr('data-key'));
            $(this).addClass('active').siblings('dd').removeClass('active');
        }
    });
};