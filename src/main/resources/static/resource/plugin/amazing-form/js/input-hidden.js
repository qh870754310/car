/**
 * 隐藏文本框
 * @param id 文本框id
 * @param verifier 验证器
 * @constructor 构造器
 */
function HiddenInput(id, verifier) {
    FormElement.call(this, id, verifier);//继承表单元素
}

inheritPrototype(HiddenInput, FormElement);