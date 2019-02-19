/**
 * 文本域
 * @param id 文本域id
 * @param verifier 验证器
 * @constructor 构造器
 */
function TextArea(id, verifier) {
    TextInput.call(this, id, verifier);
}

inheritPrototype(TextArea, TextInput);