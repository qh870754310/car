/**
 * 复选框
 * @param id 复选框id
 * @constructor 构造器
 */
function CheckInput(id) {
    FormElement.call(this, id);//继承表单元素
}

inheritPrototype(CheckInput, FormElement);

/**
 * 复选框取值(0-未选中，1-选中)
 */
CheckInput.prototype.getValue = function () {
    if ($('#' + this.id).hasClass('checked')) {
        return 1;
    } else {
        return 0;
    }
};

/**
 * 复选框赋值
 * @param val（0-未选中，1-选中）
 */
CheckInput.prototype.setValue = function (val) {
    if (val === 1) {
        $('#' + this.id).addClass('checked');
    }
};