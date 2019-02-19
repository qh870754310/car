/**
 * 密码框
 * @param id 密码框id
 * @param verifier 验证器
 * @constructor 构造器
 */
function PwdInput(id, verifier) {
    TextInput.call(this, id, verifier);
}

inheritPrototype(PwdInput, TextInput);