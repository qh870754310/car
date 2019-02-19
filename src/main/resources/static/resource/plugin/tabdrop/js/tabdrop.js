!function ($) {

    var WinReszier = (function () {
        var registered = [];
        var inited = false;
        var timer;
        var resize = function (ev) {
            clearTimeout(timer);
            timer = setTimeout(notify, 100);
        };
        var notify = function () {
            for (var i = 0, cnt = registered.length; i < cnt; i++) {
                registered[i].apply();
            }
        };
        return {
            register: function (fn) {
                registered.push(fn);
                if (inited === false) {
                    $(window).bind('resize', resize);
                    inited = true;
                }
            },
            unregister: function (fn) {
                for (var i = 0, cnt = registered.length; i < cnt; i++) {
                    if (registered[i] == fn) {
                        delete registered[i];
                        break;
                    }
                }
            }
        }
    }());

    var TabDrop = function (element, options) {
        this.element = $(element);
        this.dropdown = $('<li class="dropdown hide"><a class="dropdown-toggle" href="javascript:">' + options.text + '</a><ul class="dropdown-menu animated fadeIn"></ul></li>')
            .prependTo(this.element);
        WinReszier.register($.proxy(this.layout, this));
        this.layout();
    };

    TabDrop.prototype = {
        constructor: TabDrop,

        layout: function () {
            var collection = [];
            this.dropdown.removeClass('hide');
            this.element
                .append(this.dropdown.find('li'))
                .find('>li')
                .not('.tabdrop')
                .each(function () {
                    if (this.offsetTop > 22) {
                        collection.push(this);
                    }
                });
            if (collection.length > 0) {
                collection.sort(compare);
                collection = $(collection);
                this.dropdown
                    .find('ul')
                    .empty()
                    .append(collection);
                if (this.dropdown.find('.active').length == 1) {
                    this.dropdown.addClass('active');
                } else {
                    this.dropdown.removeClass('active');
                }
            } else {
                this.dropdown.addClass('hide');
            }

            function compare(element1, element2) {
                var index1 = Number($(element1).attr('index'));
                var index2 = Number($(element2).attr('index'));
                if (index1 < index2) {
                    return -1
                } else if (index1 > index2) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }
    };

    $.fn.tabdrop = function (option) {
        return this.each(function () {
            var $this = $(this),
                data = $this.data('tabdrop'),
                options = typeof option === 'object' && option;
            if (!data) {
                $this.data('tabdrop', (data = new TabDrop(this, $.extend({}, $.fn.tabdrop.defaults, options))));
            }
            if (typeof option == 'string') {
                data[option]();
            }
        })
    };

    $.fn.tabdrop.defaults = {
        text: '<i class="iconfont icon-more"></i>'
    };

    $.fn.tabdrop.Constructor = TabDrop;

    $(function () {
        $('.dropdown-toggle').parent('.dropdown').click(function (e) {
            $('.dropdown-menu').toggleClass('show');
            e.stopPropagation();
        });
        $(document).on('click', function () {
            $('.dropdown-menu').removeClass('show');
        });
    });

}(window.jQuery);