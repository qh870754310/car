/**
 * 下拉树
 * @param id 下拉树id
 * @param url 数据请求地址
 * @param verifier 验证器
 * @constructor 构造器
 */
function ComboTree(id, url, verifier) {
    Combo.call(this, id, url, verifier);
}

inheritPrototype(ComboTree, Combo);

/**
 * 下拉树赋值
 * @param val 值
 */
ComboTree.prototype.setValue = function (val) {
    var $comboTree = $('#' + this.id), $tree = $('#' + this.id + '-tree');
    var node = $tree.tree('find', val);
    if (node) {
        $comboTree.attr('data-key', val).val(node.text);
        $tree.tree('select', node.target);
    } else {
        $comboTree.removeAttr('data-key').val('');
        $tree.find('.tree-node-selected').removeClass('tree-node-selected');
    }
};

/**
 * 下拉树锁定
 * @param placeholder 提示信息
 */
ComboTree.prototype.lock = function (placeholder) {
    var $comboTree = $('#' + this.id);
    $comboTree.css('cursor', 'not-allowed').attr('placeholder', placeholder).off('click');
    $comboTree.next('.tree-box').next('.remove').hide();
};

/**
 * 下拉树解锁
 */
ComboTree.prototype.unlock = function () {
    var $comboTree = $('#' + this.id);
    $comboTree.css('cursor', 'pointer').attr('placeholder', '点击选择').off('click').on('click', function (e) {
        $(this).next('.tree-box').toggleClass('active');
        e.stopPropagation();
    });
    $comboTree.next('.tree-box').next('.remove').show();
};

/**
 * 下拉树值改变事件
 * @param func 回调函数
 */
ComboTree.prototype.onChange = function (func) {
    var comboTree = this, $comboTree = $('#' + comboTree.id), $tree = $('#' + comboTree.id + '-tree');
    $tree.tree({
        onClick: function (node) {
            var oldVal = comboTree.getValue();
            $comboTree.val(node.text).attr('data-key', node.id);
            $comboTree.next('.tree-box').removeClass('active');
            if (comboTree.getValue() !== oldVal) {
                func();
            }
        }
    });
    $comboTree.next('.tree-box').next('.remove').off('click').on('click', function () {
        var oldVal = comboTree.getValue();
        $comboTree.val('').removeAttr('data-key');
        $tree.find('.tree-node-selected').removeClass('tree-node-selected');
        if (oldVal) {
            func();
        }
    });
};

/**
 * 下拉树数据重载
 * @param url 数据请求地址
 */
ComboTree.prototype.reload = function (url) {
    if (url) {
        this.url = url;
    }
    var treeData = null;
    if (this.url !== undefined) {
        $.ajaxSettings.async = false;
        $.getJSON(this.url, function (json) {
            treeData = json;
        });
        $.ajaxSettings.async = true;
    }
    $('#' + this.id + '-tree').tree('loadData', treeData);
};

