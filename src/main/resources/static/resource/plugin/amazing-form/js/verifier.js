/**
 * 验证器
 * @param caller 调用对象
 * @constructor 构造器
 */
function Verifier(caller) {
    if (caller instanceof FormElement) {
        caller.verifier = this;
        this.caller = caller;
        var rule = $('#' + caller.id).attr('verify');
        if (rule) {
            this.rule = rule;
        } else {
            this.rule = undefined;
        }
    } else {
        this.caller = undefined;
        this.rule = undefined;
    }
}

/**
 * 验证器数据验证
 */
Verifier.prototype.verify = function () {
    var caller = this.caller, result = true;
    if (this.rule !== undefined) {
        this.rule.split(',').forEach(function (rule) {
            switch (rule) {
                case "NOTNULL"://不为空验证
                    if (caller.getValue() == null || caller.getValue() === undefined || caller.getValue().match(/[\S]+/) == null) {
                        result = false;
                        caller.addPrompt('此项不能为空');
                    } else {
                        caller.removePrompt();
                    }
                    break;
                default:
                    break;
            }
        });
    }
    return result;
};