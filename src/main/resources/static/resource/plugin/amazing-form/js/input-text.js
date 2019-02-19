/**
 * 普通文本框
 * @param id 文本框id
 * @param verifier 验证器
 * @constructor 构造器
 */
function TextInput(id, verifier) {
    FormElement.call(this, id, verifier);//继承表单元素
}

inheritPrototype(TextInput, FormElement);

/**
 * 文本锁定
 * @param placeholder 提示信息
 */
TextInput.prototype.lock = function (placeholder) {
    $('#' + this.id).attr('readonly', true).css('background-color', '#eeeeee').css('cursor', 'not-allowed').attr('placeholder', placeholder);
};

/**
 * 文本解锁
 * @param placeholder 提示信息
 */
TextInput.prototype.unlock = function (placeholder) {
    $('#' + this.id).attr('readonly', false).css('background-color', '#ffffff').css('cursor', '').attr('placeholder', placeholder);
};