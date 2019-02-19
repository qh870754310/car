/**
 * 表单元素
 * @param id 表单元素id
 * @param verifier 表单元素验证器
 * @constructor 构造器
 */
function FormElement(id, verifier) {
    this.id = id;
    if (verifier instanceof Verifier) {
        verifier.caller = this;
        var rule = $('#' + id).attr('verify');
        if (rule) {
            verifier.rule = rule;
        } else {
            verifier.rule = undefined;
        }
        this.verifier = verifier
    } else {
        this.verifier = undefined;
    }
    this.timer = undefined;
}

/**
 * 表单元素取值
 */
FormElement.prototype.getValue = function () {
    return $('#' + this.id).val();
};

/**
 * 表单元素赋值
 * @param val 值
 */
FormElement.prototype.setValue = function (val) {
    $('#' + this.id).val(val);
};

/**
 * 表单元素值改变事件
 * @param func 回调函数
 */
FormElement.prototype.onChange = function (func) {
    $('#' + this.id).on('change', function () {
        func();
    });
};

/**
 * 表单元素验证
 */
FormElement.prototype.verify = function () {
    if (this.verifier === undefined) {
        return true;
    } else {
        return this.verifier.verify();
    }
};

/**
 * 表单元素添加提示信息
 * @param prompt 提示信息
 */
FormElement.prototype.addPrompt = function (prompt) {
    var type = document.getElementById(this.id).type, $target = $('#' + this.id);
    $target.parent('div').next('.prompt').remove();
    $target.parent('div').after('<div class="prompt animated fadeIn">' + prompt + '</div>');
    if (type === 'textarea') {
        prompt.parent('div').next('.prompt').css('top', '118px');
    }
    if (this.timer !== undefined) {
        clearTimeout(this.timer);
        this.timer = setTimeout("$('#" + this.id + "').parent('div').next('.prompt').remove();", 2500);
    } else {
        this.timer = setTimeout("$('#" + this.id + "').parent('div').next('.prompt').remove();", 2500);
    }
};

/**
 * 表单元素移除提示信息
 */
FormElement.prototype.removePrompt = function () {
    $('#' + this.id).parent('div').next('.prompt').remove();
};

/**
 * 判断表单元素的值是否为空
 */
FormElement.prototype.isEmpty = function () {
    var val = this.getValue();
    return val == null || val === undefined || val.toString().trim().length === 0;
};

/**
 * 表单元素添加规则
 * @param rule 规则
 */
FormElement.prototype.addRule = function (rule) {
    if (rule) {
        if (this.verifier === undefined) {//尚未有验证器
            var verifier = new Verifier(this);
            verifier.rule = rule;
        } else {//有验证器
            if (this.verifier.rule === undefined) {
                this.verifier.rule = rule;
            } else {
                $.each(rule.split('|'), function (i, o) {
                    if (this.verifier.rule.indexOf(o) < 0) {
                        this.verifier.rule = this.verifier.rule + '|' + o;
                    }
                });
            }
        }
        if (this.verifier.rule.indexOf('NOTNULL') > -1) {
            $('#' + this.id).parent('div').prev('label').addClass('must');
        }
    }
};

/**
 * 表单元素移除规则
 * @param rule 规则
 */
FormElement.prototype.removeRule = function (rule) {
    if (rule && this.verifier !== undefined && this.verifier.rule !== undefined) {
        var ruleArr = this.verifier.rule.split('|');
        $.each(rule.split('|'), function (i, o) {
            if (ruleArr.indexOf(o) > -1) {
                ruleArr.splice(ruleArr.indexOf(o), 1);
            }
        });
        if (ruleArr.length > 0) {
            this.verifier.rule = ruleArr.join('|');
            if (ruleArr.indexOf('NOTNULL') > -1) {
                $('#' + this.id).parent('div').prev('label').addClass('must');
            } else {
                $('#' + this.id).parent('div').prev('label').removeClass('must');
            }
        } else {
            this.verifier.rule = undefined;
            $('#' + this.id).parent('div').prev('label').removeClass('must');
        }
    }
};