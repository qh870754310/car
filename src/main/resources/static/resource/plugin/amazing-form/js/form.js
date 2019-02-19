/**
 * 表单
 * @param id
 * @param formData
 * @constructor
 */
function Form(id, formData) {
    this.id = id;
    this.formData = formData;
    this.elements = [];
}

/**
 * 表单初始化
 */
Form.prototype.initial = function () {
    var form = this, $form = $('#' + form.id);
    $form.addClass('amazing-form');
    //初始化label标签
    $form.find('label').each(function () {
        $(this).attr('title', $(this).text());
    });
    //初始化隐藏文本框
    $form.find('input[type="hidden"]').each(function () {
        form.elements.push(new HiddenInput($(this).attr('id')));
    });
    //初始化文本框
    $form.find('input[type="text"]').addClass('form-text').wrap('<div class="form-text-block"></div>').each(function () {
        var text = new TextInput($(this).attr('id'), new Verifier());
        if (text.verifier.rule !== undefined && text.verifier.rule.indexOf('NOTNULL') > -1) {
            $(this).parent('div').prev('label').addClass('must');
        }
        form.elements.push(text);
        if ($(this).attr('btn')) {
            $(this).after('<a class="select" onclick="javascript:' + $(this).attr('btn') + '"></a>');
        }
    });
    //初始化密码框
    $form.find('input[type="password"]').addClass('form-text').wrap('<div class="form-text-block"></div>').each(function () {
        var text = new PwdInput($(this).attr('id'), new Verifier());
        if (text.verifier.rule !== undefined && text.verifier.rule.indexOf('NOTNULL') > -1) {
            $(this).parent('div').prev('label').addClass('must');
        }
        form.elements.push(text);
    });
    //初始化文本域
    $form.find('textarea').addClass('form-textarea').wrap('<div class="form-textarea-block"></div>').each(function () {
        var text = new TextArea($(this).attr('id'), new Verifier());
        if (text.verifier.rule !== undefined && text.verifier.rule.indexOf('NOTNULL') > -1) {
            $(this).parent('div').prev('label').addClass('must');
        }
        form.elements.push(text);
    }).parent('.form-textarea-block').prev('label').addClass('form-textarea-label');
    //初始化复选框
    $form.find('input[type="checkbox"]').each(function () {
        var $this = $(this);
        $this.wrap('<div class="form-checkbox"></div>').parent('.form-checkbox').attr('id', $(this).attr('id')).on('click', function () {
            $(this).toggleClass('checked');
        });
        var checkInput = new CheckInput($this.attr('id'));
        form.elements.push(checkInput);
        $this.remove();
    });
    //初始化文件框

    //初始化下拉框
    $form.find('select').each(function () {
        var $this = $(this), select = new Select($this.attr('id'), new Verifier());
        if (select.verifier.rule !== undefined && select.verifier.rule.indexOf('NOTNULL') > -1) {
            $this.prev('label').addClass('must');
        }
        form.elements.push(select);
        $this.wrap('<div class="form-select-block"></div>').after('<input type="text" class="form-select" placeholder="点击选择" readonly="readonly"><div class="option-box"><dl></dl></div><a class="remove"></a>').next('.form-select').on('click', function (e) {
            $(this).next('.option-box').toggleClass('active');
            e.stopPropagation();
        });
        var $formSelect = $this.next('.form-select'), $optionBox = $formSelect.next('.option-box'),
            $remove = $optionBox.next('.remove');
        $formSelect.attr('id', $this.attr('id'));
        $this.find('option').each(function () {
            $optionBox.find('dl').append('<dd data-key="' + $(this).val() + '">' + $(this).text() + '</dd>');
        });
        $optionBox.find('dd').on('click', function () {
            $formSelect.val($(this).text()).attr('data-key', $(this).attr('data-key'));
            $(this).addClass('active').siblings('dd').removeClass('active');
        });
        $remove.on('click', function () {
            $formSelect.val('').removeAttr('data-key');
            $optionBox.find('dd.active').removeClass('active');
        });
        $(document).on('click', function () {
            $optionBox.removeClass('active');
        });
        $this.remove();
    });
    //表单赋值
    if (form.formData) {
        form.elements.forEach(function (element) {
            if (form.formData[element.id]) {
                element.setValue(form.formData[element.id]);
            }
        });
    }
    $form.show();
    return form;
};

/**
 * 根据id获取表单元素
 * @param id 元素id
 */
Form.prototype.getElement = function (id) {
    var result = undefined;
    this.elements.forEach(function (element) {
        if (element.id === id) {
            result = element;
            return false;
        }
    });
    return result;
};

/**
 * 表单验证
 */
Form.prototype.verify = function () {
    var result = true;
    this.elements.forEach(function (element) {
        if (!element.verify()) {
            result = false;
        }
    });
    return result;
};

/**
 * 获取表单数据
 */
Form.prototype.getData = function () {
    var formData = new FormData();
    this.elements.forEach(function (element) {
        if (!element.isEmpty()) {
            if (element instanceof PwdInput) {
                var pwd = element.getValue();
                for (var i = 0; i < 5; i++) {
                    pwd = $.md5(pwd);
                }
                formData.append(element.id, pwd);
            } else {
                formData.append(element.id, element.getValue());
            }
        }
    });
    return formData;
};

/**
 * 提交表单
 * @param url 提交地址
 */
Form.prototype.submit = function (url) {
    var result = undefined;
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        data: this.getData(),
        cache: false,
        async: false,
        processData: false,
        contentType: false,
        success: function (data) {
            result = data.state;
        }
    });
    return result;
};

/**
 * combo初始化
 * @param id combo的id
 * @param url 数据请求地址
 */
Form.prototype.combo = function (id, url) {
    this.elements = this.elements.filter(function (element) {
        return element.id !== id;
    });
    var $combo = $('#' + id);
    var combo = new Combo(id, url, new Verifier());
    if (combo.verifier.rule !== undefined && combo.verifier.rule.indexOf('NOTNULL') > -1) {
        $combo.parent('div').prev('label').addClass('must');
    }
    this.elements.push(combo);
    $combo.removeClass('form-text').addClass('form-combo').attr('placeholder', '点击选择').attr('readonly', 'readonly').after('<div class="option-box"><dl></dl></div><a class="remove"></a>').parent('.form-text-block').removeClass('form-text-block').addClass('form-combo-block');
    if (combo.url) {
        $.ajaxSettings.async = false;
        $.getJSON(combo.url, function (json) {
            $.each(json, function (i, o) {
                $combo.next('.option-box').find('dl').append('<dd data-key="' + o.key + '">' + o.value + '</dd>');
            });
        });
        $.ajaxSettings.async = true;
        $combo.next('.option-box').find('dd').on('click', function () {
            $combo.val($(this).text()).attr('data-key', $(this).attr('data-key'));
            $(this).addClass('active').siblings('dd').removeClass('active');
        });
    }
    $combo.on('click', function (e) {
        $(this).next('.option-box').toggleClass('active');
        e.stopPropagation();
    });
    $combo.next('.option-box').next('.remove').on('click', function () {
        $combo.val('').removeAttr('data-key');
        $combo.next('.option-box').find('dd.active').removeClass('active');
    });
    $(document).on('click', function () {
        $combo.next('.option-box').removeClass('active');
    });
    if (this.formData && this.formData[id]) {
        combo.setValue(this.formData[id]);
    }
    return combo;
};

/**
 *  comboTree初始化
 * @param id comboTree的id
 * @param url 数据请求地址
 */
Form.prototype.comboTree = function (id, url) {
    this.elements = this.elements.filter(function (element) {
        return element.id !== id;
    });
    var $comboTree = $('#' + id), comboTree = new ComboTree(id, url, new Verifier()), treeData = undefined;
    if (comboTree.verifier.rule !== undefined && comboTree.verifier.rule.indexOf('NOTNULL') > -1) {
        $comboTree.parent('div').prev('label').addClass('must');
    }
    this.elements.push(comboTree);
    $comboTree.removeClass('form-text').addClass('form-combo-tree').attr('placeholder', '点击选择').attr('readonly', 'readonly').after('<div class="tree-box"><ul></ul></div><a class="remove"></a>').parent('.form-text-block').removeClass('form-text-block').addClass('form-combo-tree-block');
    $comboTree.next('.tree-box').find('ul').attr('id', id + '-tree');
    if (comboTree.url) {
        $.ajaxSettings.async = false;
        $.getJSON(url, function (json) {
            treeData = json;
        });
        $.ajaxSettings.async = true;
    }
    $('#' + id + '-tree').tree({
        data: treeData,
        animate: true,
        onClick: function (node) {
            $comboTree.val(node.text).attr('data-key', node.id);
            $comboTree.next('.tree-box').removeClass('active');
        }
    });
    $comboTree.on('click', function (e) {
        $(this).next('.tree-box').toggleClass('active');
        e.stopPropagation();
    });
    $comboTree.next('.tree-box').next('.remove').on('click', function () {
        $comboTree.val('').removeAttr('data-key');
        $('#' + id + '-tree').find('.tree-node-selected').removeClass('tree-node-selected');
    });
    $(document).on('click', function () {
        $comboTree.next('.tree-box').removeClass('active');
    });
    if (this.formData[id]) {
        comboTree.setValue(this.formData[id]);
    }
    return comboTree;
};