/// <reference path="iviewer-master/test/index6.html" />
/// <reference path="iviewer-master/test/index6.html" />
/// <reference path="iviewer-master/test/index6.html" />
//地图查询JS,包括 空间查询、关键字查询，查询结果展示

//空间查询 开始

var spaceDia; //空间查询面板
function SpaceSearch() {
    clearResult();//清除查询结果
    $("#txtHCBJ").val(""); //清空输入的缓冲半径
    spaceDia = artDialog(
        {
            title: '空间查询',
            content: document.getElementById('divSPACE'),
            lock: true,
            style: 'succeed noClose',
        });
}


//空间查询
function KJSearch(t) {
    feaOneQY.hide();
    feaTwoQY.hide();
    feaThreeQY.hide();
    feazfjlayer.hide();
    feasygsjlayer.hide();
    feaajjlayer.hide();
    feagafjlayer.hide();
    feahbjlayer.hide();
    feagsjlayer.hide();
    feafwzxlayer.hide();
    feasqLayer.hide();
    feadzlayer.hide();


    var hcbjval = $("#txtHCBJ").val();
    if (hcbjval == "" && (t == 1 || t == 2)) {
        art.dialog({
            time: 2,
            content: '请输入缓冲半径',
            cancel: false
        });
    }
    else {
        toolbar = new esri.toolbars.Draw(map);
        if (t == 1) {
            toolbar.activate(esri.toolbars.Draw.POINT);
        }
        else if (t == 2) {
            toolbar.activate(esri.toolbars.Draw.POLYLINE);
        }
        else if (t == 3) {
            toolbar.activate(esri.toolbars.Draw.EXTENT);
        }
        else if (t == 4) {
            toolbar.activate(esri.toolbars.Draw.POLYGON);
        }
        spaceDia.close();//进行空间查询前关闭空间查询弹框
        clearResult();//清除
        toolbar.on("draw-end", addMap);
    }
}

function addMap(evt) {
    toolbar.deactivate();
    var zxdsymbol;
    switch (evt.geometry.type) {
        case "point":
            zxdsymbol = new esri.symbol.PictureMarkerSymbol(
                {
                    "url": "images/ui_close.png",
                    "height": 16,
                    "width": 16,
                    "type": "esriPMS",
                    "angle": 0
                });
            break;
        case "polyline":
            zxdsymbol = new esri.symbol.SimpleLineSymbol().setWidth(2);
            break;
        default:
            zxdsymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
                new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_DASHDOT,
                    new esri.Color([255, 0, 0]), 2), new esri.Color([255, 255, 0, 0.25]));
            break;
    }
    var graphic = new esri.Graphic(evt.geometry, zxdsymbol);
    map.graphics.add(graphic);//将所画的几何图形添加到map容器中
    Buff(evt);
}

//缓冲区分析
function Buff(evt) {
    switch (evt.geometry.type) {
        case "point":
        case "polyline": {
            var params = new esri.tasks.BufferParameters();
            params.distances = [$("#txtHCBJ").val()];
            params.outSpatialReference = map.spatialReference;
            params.bufferSpatialReference = new esri.SpatialReference({wkid: 102113});//add by zfl
            params.unit = esri.tasks.GeometryService.UNIT_METER;
            params.geometries = [evt.geometry];
            gs.buffer(params, showBuffer);
            break;
        }
        default: {
            DoQuery(evt, 1);
            break;
        }
    }

    //var size = 1;
    //var hcbj = $("#txtHCBJ").val();
    //if (hcbj > 10000) {
    //    size = 2;
    //}
    //else if (hcbj > 5000 && hcbj <= 10000) {
    //    size = 3;
    //}
    //else if (hcbj <= 5000 && hcbj > 1000) {
    //    size = 4;
    //}
    //else if (hcbj <= 1000 && hcbj > 100) {
    //    size = 5;
    //}
    //else if (hcbj <= 100 && hcbj > 0) {
    //    size = 7;
    //}
    //if (evt.geometry.type == "point") {
    //    //点
    //    var point_x = parseFloat(evt.geometry.x);
    //    var point_y = parseFloat(evt.geometry.y);
    //    var point_location = new esri.geometry.Point(point_x, point_y, map.spatialReference);
    //    map.centerAndZoom(point_location, size);
    //}
    //else if (evt.geometry.type == "polyline") {
    //    //线
    //    var line = new esri.geometry.Polyline(evt.geometry);
    //    var line_center = line.getExtent().getCenter();
    //    map.centerAndZoom(line_center, size);
    //}
    //else if (evt.geometry.type == "extent") {
    //    //框选
    //    var xmin = parseFloat(evt.geometry.xmin);
    //    var ymin = parseFloat(evt.geometry.ymin);
    //    var xmax = parseFloat(evt.geometry.xmax);
    //    var ymax = parseFloat(evt.geometry.ymax);
    //    var extent = new esri.geometry.Extent(xmin, ymin, xmax, ymax, map.spatialReference);
    //    var extent_center = extent.getExtent().getCenter();
    //    map.centerAndZoom(extent_center, 5);
    //}
    //else {
    //    //多边形
    //    var polygon = new esri.geometry.Polygon(evt.geometry);
    //    var polygon_center = polygon.getExtent().getCenter();
    //    map.centerAndZoom(polygon_center, 5);
    //}
}

//缓冲公用方法 
function showBuffer(geometries) {
    var buffersymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
        new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_DASHDOT,
            new esri.Color([255, 0, 0]), 2), new esri.Color([255, 255, 0, 0.25]));

    //返回的bufferedGeometries是一个数组
    var graphic = new esri.Graphic(geometries[0], buffersymbol);
    //两种方式都可以
    map.graphics.add(graphic);
    //graphicsLayer.add(graphic);
    DoQuery(geometries[0], 2)
}

//空间查询 结束


//关键字查询 开始
var keyQueryDialog;  //定义关键字查询弹出框
var QueryLayer;     //查询图层
var resultDialog;   //查询结果弹框
function KeySearch() {
    clearResult();  //清除查询结果
    $("#txtKeyWord").val("");//清空输入的关键字
    keyQueryDialog = art.dialog({
        title: '关键字查询',
        content: document.getElementById('divKeyQueryCon'),
        lock: true,
        style: 'succeed noClose'
    });
}


function btnQuery() {
    var key = $("#txtKeyWord").val();     //输入的关键字
    if (key == "") {
        art.dialog({
            time: 2,
            content: '请输入关键字',
            cancel: false
        });
    }
    else {
        DoQuery("", 5);
    }
}

function DoQuery(geometries, k) {

    if (keyQueryDialog != null) {
        keyQueryDialog.close(); //关闭弹框
    }
    var query = new esri.tasks.Query();
    var queryTask;
    query.where = "1=1";

    if (k == 5) {//关键字查询
        QueryLayer = $("#selLayer").val(); //图层
        var key = $("#txtKeyWord").val();     //输入的关键字
        tlx = $("#selLayer").val();
        var selValue;  //获取Select选择的Value
        if (tlx == "一级片长责任区域" || tlx == "二级片长责任区域" || tlx == "三级片长责任区域" || tlx == "社区") {
            selValue = $("#selField").val();
        }
        else {
            selValue = $("#nselField").val();
        }

        if (selValue == "realName" || selValue == "SSQY" || selValue == "XQMC" || selValue == "ZDS" || selValue == "NAME" || selValue == "ZRQY") {
            query.where = "" + selValue + " like '%" + key + "%' ";
        }
        else {
            query.where = "" + selValue + " = " + key + "";
        }
    }
    else {
        QueryLayer = $("#selType").val(); //空间查询
    }
    switch (QueryLayer) {
        case "社区": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/BTXT_JDJX/MapServer/0");
            break;
        }
        case "一级片长责任区域": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/BTXT_ONE/MapServer/0");
            break;
        }
        case "二级片长责任区域": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/BTXT_TWO/MapServer/0");
            break;

        }
        case "三级片长责任区域": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/BTXT_THREE/MapServer/0");
            break;
        }
        case "执法局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/6");
            break;
        }
        case "食药工商局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/5");
            break;
        }
        case "安监局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/0");
            break;
        }
        case "公安分局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/2");
            break;
        }
        case "环保局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/4");
            break;
        }
        case "公事局": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/3");
            break;
        }
        case "滨河建设服务中心": {
            queryTask = new esri.tasks.QueryTask("http://58.211.255.58:6080/arcgis/rest/services/BTZHZF20170715/NY/MapServer/1");
            break;
        }

    }

    query.outSpatialReference = map.spatialReference;
    if (k == 1) {
        query.geometry = geometries.geometry;
    }
    else if (k == 2) {
        query.geometry = geometries;
    }
    query.returnGeometry = true;
    query.outFields = ["*"];
    queryTask.execute(query, ResultToMap);
}

function ResultToMap(response) {
    dzlayer.hide();
    switch (QueryLayer) {
        case "一级片长责任区域": {
            OneQY.show();
            TwoQY.hide();
            ThreeQY.hide();
            break;
        }
        case "二级片长责任区域": {
            OneQY.hide();
            TwoQY.show();
            ThreeQY.hide();
            break;
        }
        case "三级片长责任区域": {
            OneQY.hide();
            TwoQY.hide();
            ThreeQY.show();
            break;
        }
    }

    if (response.features.length == 0) {
        art.dialog({
            time: 2,
            content: '暂无数据',
            cancel: false
        });
        return;
    }

    var result = "<div class='result_con'><div class='result_top'><span>查询结果共（" + response.features.length + "条数据）</span></div>";
    result += "<table class='result_tb'><tr><th>真实姓名</th><th>手机号码</th><th>所在街道名称</th><th>操作</th></tr>";
    for (var i = 0; i < response.features.length; i++) {
        var feature = response.features[i];

        //点渲染
        var symbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
            new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
                new esri.Color([255, 0, 0]), 2), null);

        result += "<tr><td>" + IsNullValue(feature.attributes["realName"]) + "</td><td>" + IsNullValue(feature.attributes["cellphone"]) + "</td><td>" + IsNullValue(feature.attributes["SSQY"]) + "</td><td><a style='color: blue;' href=\"javascript:void(0)\"  onclick='Fix(" + JSON.stringify(feature) + ")'>定位</a></td></tr>";

        graphicsLayer.add(new esri.Graphic(feature.geometry, symbol));
    }
    result += "</table></div>";
    resultDialog = artDialog({
        title: '查询记录列表',
        content: result,
        lock: false,
        left: '100%',
        height: '500px'
    })
}

//关键字查询 结束


//查询所需的公用方法 开始

//清除查询结果
function clearResult() {
    map.graphics.clear();     //在地图中删除所加的几何要素
    graphicsLayer.clear();
    ajLayer.clear();
    ajLayer2.clear();
    rydwLayer.clear();
    //查询结果弹框
    if (resultDialog != null && resultDialog != undefined) {
        resultDialog.close();
    }
    if (map.infoWindow)
        map.infoWindow.hide();
}

//管点定位
function Fix(feature) {
    var polygon = new esri.geometry.Polygon(feature.geometry);
    var centerPoint = polygon.getExtent().getCenter();
    map.infoWindow.setTitle("详细信息");
    if (QueryLayer == "社区") {
        var info = "<tr><th>辖区名称</th><td>" + IsNullValue(feature.attributes.XQMC) + "</td>";
        info += "<th>所在街道名称</th><td>" + IsNullValue(feature.attributes.SSQY) + "</td></tr>";
        info += "<tr><th>辖区范围</th><td colspan='3'>" + IsNullValue(feature.attributes.XQFW) + "</td></tr>";
    }
    else {
        var info = "<tr><th>真实姓名</th><td>" + IsNullValue(feature.attributes.realName) + "</td>";
        info += "<th>手机号码</th><td>" + IsNullValue(feature.attributes.cellphone) + "</td></tr>";
        info += "<tr><th>辖区名称</th><td>" + IsNullValue(feature.attributes.XQMC) + "</td>";
        info += "<th>所在街道名称</th><td>" + IsNullValue(feature.attributes.SSQY) + "</td></tr>";
        info += "<tr><th>辖区范围</th><td colspan='3'>" + IsNullValue(feature.attributes.XQFW) + "</td></tr>";
    }
    map.infoWindow.setContent("<div style='width:600px'><table class='Detail_table'>" + info + "</table><div>");
    map.infoWindow.show(centerPoint);
    map.centerAndZoom(centerPoint, 4);
}


//时间格式转换
function compare(value) {
    if (value != "" && value != null && value != "Null") {
        if (value.toString().indexOf('/') < 0) {
            var date = new Date(value);
            var seperator1 = "/";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }
        else
            return value;
    }
    else {
        return "";
    }
}

//判断是否为空
function IsNullValue(value) {
    if (value == null || value == "undefined") {
        return "";
    }
    else {
        return value;
    }
}

//查询所需的公用方法 结束


$(function () {

    //绑定人员列表
    PersonList();
});

//格式化图片
function formatImages(value, key, data) {
    //此方法针对传入字段(key)对应的值(value)进行处理，在这里指的是POP2007字段,data是feature的attributes  
    //data: graphic的attributes
    if (value == "") return "";
    var imgs = value.split(',');
    var result = "";
    for (var i = 0; i < imgs.length; i++) {
        result = result + '<li onclick="GetBigImg(\'/file?filePath=' + imgs[i] + '\');"><img src="/file?filePath=' + imgs[i] + '"/></li>';
    }
    return result;
}

function caseProcess(id) {
    layer.open({
        type: 2,
        title: '<i class="iconfont icon-13" style="font-size: 12px"></i>&nbsp;案件流程',
        area: ['700px', '480px'],
        content: '/case/process/' + id,
        moveOut: true,
        shadeClose: false,
        anim: 1,
        resize: false
    });
}

//查看大图
function GetBigImg(url) {
    layer.open({
        type: 2,
        title: '<i class="iconfont icon-13" style="font-size: 12px"></i>&nbsp;图片查看',
        area: ['700px', '550px'],
        content: '/resource/plugin/iviewer/test/index6.html?myurl=' + url,
        moveOut: true,
        shadeClose: false,
        anim: 1,
        resize: false
    });
}

function GetDetailInfo(evt) {
    var caseid = evt.graphic.attributes["caseId"];  //案件id
    $.ajax({
        url: 'http://www.cstrqcp.com/api/gis/case?caseId=' + caseid,
        type: "get",
        dataType: "jsonp",
        async: false,
        jsonp: 'callback',
        success: function (json_obj) {
            map.infoWindow.setTitle("详细信息");
            var info = "<tr><td>案件编号</td><td>" + IsNullValue(json_obj.caseNo) + "</td>";
            info += "<td>案件上报人姓名</td><td>" + IsNullValue(json_obj.reportUserName) + "</td></tr>";
            info += "<tr><td>案件内容说明</td><td colspan='3'>" + IsNullValue(json_obj.content) + "</td></tr>";
            info += "<tr><td>案件上报地址</td><td>" + IsNullValue(json_obj.address) + "</td>";
            info += "<td>上报时间</td><td>" + IsNullValue(json_obj.reportTime) + "</td></tr>";
            info += "<tr><td>案件状态</td><td>" + ajstate(json_obj.state) + "</td>";
            info += "<td>案件区域</td><td>" + IsNullValue(json_obj.area) + "</td></tr>";
            info += "<tr><td>案件来源</td><td>" + ajsource(json_obj.source) + "</td>";
            info += "<td>案件类型</td><td>" + IsNullValue(json_obj.type) + "</td></tr>";
            map.infoWindow.setContent("<div style='width:570px'><table class='Detail_table'>" + info + "</table><div>");
            var locationPoint = new esri.geometry.Point(evt.graphic.geometry.x, evt.graphic.geometry.y, map.spatialReference);
            map.infoWindow.show(locationPoint);
            map.centerAndZoom(locationPoint, 2);
        },
        error: function (xmlhttprequest, textstatus, errorthrown) {
            alert(xmlhttprequest.status);
            alert(xmlhttprequest.readystate);
            alert(textstatus);
        }
    });
}

//案件状态
function caseState(value) {
    var returnVal = "";
    switch (value) {
        case 0:
            returnVal = "待受理";
            break;
        case 1:
            returnVal = "待立案";
            break;
        case 2:
            returnVal = "待下派";
            break;
        case 3:
            returnVal = "待处理";
            break;
        case 4:
            returnVal = "待检查";
            break;
        case 5:
            returnVal = "待结案";
            break;
        case 6:
            returnVal = "已结案";
            break;
        case 7:
            returnVal = "特殊案件";
            break;
        default:
            break;
    }
    return returnVal;
}


//案件来源
function caseSource(value) {
    var returnVal = "";
    switch (value) {
        case 1:
            returnVal = "群众举报";
            break;
        case 2:
            returnVal = "巡查发现";
            break;
        case 3:
            returnVal = "N员上报";
            break;
        case 4:
            returnVal = "N员上报（自处理）";
            break;
        default:
            break;
    }
    return returnVal;
}

var pTimer;//人员在轨迹上走动的定时器
var pArray;　//人员轨迹点的数组

//人员轨迹 开始
//展示人员轨迹面板by yanq 2017-7-22
function GetTrail() {
    layer.open({
        type: 2,
        title: '<i class="iconfont icon-39" style="font-size: 12px"></i>&nbsp;人员轨迹',
        resize: false,
        moveOut: true,
        anim: 1,
        area: ['500px', '400px'],
        content: '/map/trackView',
        btn: ['确定', '取消'],
        yes: function (index, layero) {
            var data = $(layero).find("iframe")[0].contentWindow.getData();
            if (data.state) {
                $.ajaxSettings.async = false;
                $.getJSON('/map/track', {userId: data.userId, trackTime: data.trackTime}, function (json) {
                    trailClose();  //清除
                    if (json.length === 0) {
                        top.layer.msg('很抱歉，未查询到任何轨迹！', {icon: 1, offset: '2px'});
                    } else {
                        var path = "";
                        pArray = [];
                        $.each(json, function (i, o) {
                            // 百度经纬度坐标转国测局坐标
                            var bd09coord = bd09togcj02(o.longitude, o.latitude);
                            //  国测局坐标转wgs84坐标
                            var wgs84coord = gcj02towgs84(bd09coord[0], bd09coord[1]);
                            path = path + "[" + wgs84coord[0] + "," + wgs84coord[1] + "]" + ",";
                            pArray.push(wgs84coord);
                            //画一下第一个点和最后一个点
                            if (i === 0 || i === json.length - 1) {
                                var picSymbol = new esri.symbol.PictureMarkerSymbol("/resource/map/images/round.png", 12, 12);
                                var centerPoint = new esri.geometry.Point(wgs84coord[0], wgs84coord[1], map.spatialReference);
                                var picGraphic = new esri.Graphic(centerPoint, picSymbol, null);
                                graLyrTrail.add(picGraphic);
                            }
                        });
                        path = path.substring(0, path.length - 1);
                        pTimer = window.setInterval(movePerson, 2000);//人员在轨迹上走动的定时器
                        var myLine = {
                            geometry: {
                                "paths": eval("[[" + path + "]]"),
                                "spatialReference": {"wkid": 4490}
                            },
                            "symbol": {
                                "color": [119, 138, 245, 255],
                                "width": 2,
                                "type": "esriSLS",
                                "style": "esriSLSSolid"
                            }
                        };//esriSLSSolid esriSLSDash esriSLSDash | esriSLSDashDotDot | esriSLSDot | esriSLSNull | esriSLSSolid

                        var gra = new esri.Graphic(myLine);
                        graLyrTrail.add(gra);

                        map.centerAndZoom(gra.geometry.getExtent().getCenter(), 4);
                    }
                });
                $.ajaxSettings.async = true;
                layer.close(index);
            }
        }
    });
}

//获得人员轨迹点，并把标注在地图上，连成线
function btnGetTrail() {
    var userid = $("#selPersonName").val();//人员id
    var datetime = $("#txtDatetime").val();//时间
    $.ajax({
        url: 'http://www.cstrqcp.com/api/gis/locations?userId=' + userid + '&startTime=' + datetime + " 00:00:00" + '&endTime= ' + datetime + " 24:00:00",
        type: "get",
        dataType: "jsonp",
        async: false,
        jsonp: 'callback',
        success: function (json_obj) {
            if (json_obj.length == 0) {
                alert("没有轨迹！");
                return;
            }
            trailClose();  //清除
            var path = "";
            pArray = new Array();
            for (var i = 0; i < json_obj.length; i++) {
                var coord_X = parseFloat(json_obj[i].longitude);  //经度
                var coord_Y = parseFloat(json_obj[i].latitude);    //纬度               
                // 百度经纬度坐标转国测局坐标
                var bd09coord = bd09togcj02(coord_X, coord_Y);
                //  国测局坐标转wgs84坐标
                var wgs84coord = gcj02towgs84(bd09coord[0], bd09coord[1]);
                path = path + "[" + wgs84coord[0] + "," + wgs84coord[1] + "]" + ",";
                pArray.push(wgs84coord);
                //画一下第一个点和最后一个点
                if (i == 0 || i == json_obj.length - 1) {
                    var picSymbol = new esri.symbol.PictureMarkerSymbol("images/round.png", 12, 12);
                    var centerPoint = new esri.geometry.Point(wgs84coord[0], wgs84coord[1], map.spatialReference);
                    var picGraphic = new esri.Graphic(centerPoint, picSymbol, null);
                    graLyrTrail.add(picGraphic);
                }

            }

            path = path.substring(0, path.length - 1);
            pTimer = window.setInterval(movePerson, 2000);//人员在轨迹上走动的定时器
            var myLine = {
                geometry: {
                    "paths": eval("[[" + path + "]]"),
                    "spatialReference": {"wkid": 4490}
                },
                "symbol": {"color": [119, 138, 245, 255], "width": 2, "type": "esriSLS", "style": "esriSLSSolid"}
            };//esriSLSSolid esriSLSDash esriSLSDash | esriSLSDashDotDot | esriSLSDot | esriSLSNull | esriSLSSolid

            var gra = new esri.Graphic(myLine);
            graLyrTrail.add(gra);

            map.centerAndZoom(gra.geometry.getExtent().getCenter(), 4);

        },
        error: function (xmlhttprequest, textstatus, errorthrown) {
            alert(xmlhttprequest.status);
            alert(xmlhttprequest.readystate);
            alert(textstatus);
        }
    });
}

var i = 0;

function movePerson() {
    if (i === pArray.length) {
        i = 0;
    }
    graLyrTrailPoint.clear();
    var picSymbol = new esri.symbol.PictureMarkerSymbol("/resource/map/images/person.png", 24, 24);
    var centerPoint = new esri.geometry.Point(pArray[i][0], pArray[i][1], map.spatialReference);
    var picGraphic = new esri.Graphic(centerPoint, picSymbol, null);
    graLyrTrailPoint.add(picGraphic);
    i++;
}

//把轨迹关掉，人员移动的定时器清除
function trailClose() {
    clearInterval(pTimer);
    graLyrTrailPoint.clear();
    graLyrTrail.clear();
}

var pNames;

//绑定二级的人员
function GetPName() {
    var t = $("#selPersonLayer").val();  //所选区域
    $("#selPersonName").empty();//先清空一下
    switch (t) {
        case "一级片长责任区域":
        case "二级片长责任区域":
        case "三级片长责任区域": {
            $.each(pNames.area, function (i, obj) {
                $.each(obj, function (j, arr) {
                    if (j == "area1" && t == "一级片长责任区域") {
                        setPerson(arr, 1);
                    }
                    else if (j == "area2" && t == "二级片长责任区域") {
                        setPerson(arr, 1);
                    }
                    else if (j == "area3" && t == "三级片长责任区域") {
                        setPerson(arr, 1);
                    }
                })
            });
        }
            break;
        default: {
            $.each(pNames.nMember, function (i, obj) {
                if (obj.department == t) {
                    setPerson(obj.users, 2);
                }
            });
        }
            break;
    }

}

function setPerson(myArray, type) {
    if (type == 1) {
        $.each(myArray, function (k, pq) {
            if (pq.key != undefined && pq.key != "") {
                $("#selPersonName").append("<option value='" + pq.key + "'>" + pq.value + "</option>");
            }
        })
    } else if (type == 2) {
        $.each(myArray, function (k, pq) {
            if (pq.userId != undefined && pq.userId != "") {
                $("#selPersonName").append("<option value='" + pq.userId + "'>" + pq.realName + "</option>");
            }
        })
    }
}

//人员轨迹 结束


//获取人员列表 开始
function PersonList() {

    $.ajax({
        url: "http://www.cstrqcp.com/api/gis/users",
        type: "get",
        dataType: "jsonp",
        async: false,
        jsonp: 'callback',
        success: function (json_obj) {
            pNames = json_obj;
            var PQRYList = ""; //片区人员
            var NYList = "";
            var strTitle = ""; //片区标识
            //片区
            $.each(json_obj.area, function (i, obj) {
                $.each(obj, function (j, arr) {
                    PQRYList += "<li>";
                    if (j == "area1") {
                        strTitle = "一级片长责任区域";
                    }
                    else if (j == "area2") {
                        strTitle = "二级片长责任区域";
                    }
                    else {
                        strTitle = "三级片长责任区域";
                    }
                    PQRYList += '<a class="item-name c-f"><i onclick="showSub(this)"></i><span class="pull-left"><div class="checkbox"  id =""  onclick="ckOnclick(this)"><input type="checkbox"/></div></span><span class="pull-left filename">' + strTitle + '</span></a>';

                    PQRYList += '<ul  class="nav-trunk fold">';
                    $.each(arr, function (k, pq) {
                        //PQRYList += '<li><label class="demo--label"><input class="demo--radio" type="checkbox"  value="1" name="chkCase"><span class="demo--checkbox demo--radioInput"></span>' + pq.value + '</label><br></li>';
                        PQRYList += '<li  class="lick"><span class="pull-left"><div class="checkbox"  id=' + pq.key + ' onclick="ckOnclick(this)"><input type="checkbox"/></div><span class="ckfont">' + pq.value + '</span></span><br></li>';
                    })
                    PQRYList += '</ul>';
                    PQRYList += "</li>";
                })
            });

            //N员
            $.each(json_obj.nMember, function (i, obj) {

                //绑定区域下拉框
                $("#selPersonLayer").append("<option value='" + obj.department + "'>" + obj.department + "</option>");


                NYList += "<li>";
                NYList += '<a class="item-name c-f"><i onclick="showSub(this)"></i><span class="pull-left"><div class="checkbox"  id ="" onclick="ckOnclick(this)"><input type="checkbox"/></div></span><span class="pull-left filename">' + obj.department + '</span></a>';

                NYList += '<ul  class="nav-trunk fold">';
                $.each(obj.users, function (k, pq) {
                    NYList += '<li class="lick"><span class="pull-left"><div class="checkbox" id=' + pq.userId + ' onclick="ckOnclick(this)"><input type="checkbox"/></div><span class="ckfont">' + pq.realName + '</span></span><br></li>';
                    ;
                })
                NYList += '</ul>';
                NYList += "</li>";
            })
            $("#PQRYList").html(PQRYList);
            $("#NYList").html(NYList);
        },
        error: function (xmlhttprequest, textstatus, errorthrown) {
            alert(xmlhttprequest.status);
            alert(xmlhttprequest.readystate);
            alert(textstatus);
        }
    });

}

//子菜单显示与隐藏
function showSub(obj) {
    $(obj).parent().parent().toggleClass("unfold")
    $(obj).parent().parent().find("ul:first").slideToggle(500);
    $(obj).toggleClass("unfold");
    $(obj).parent().children(".filename").toggleClass("filename-open");
}


//checkbox点击事件
function ckOnclick(obj) {
    $(obj).toggleClass("c-selected");
    if ($(obj).hasClass('c-selected')) {
        $(obj).parent().prev().parent().parent().find("ul:first").find("input[type='checkbox']").parent().addClass("c-selected");////追加子节点选中样式
        if ($(obj).parent().parent().parent().parent().prev('a').hasClass('item-name c-f'))
            $(obj).parent().parent().parent().parent().prev('a').find(".checkbox").addClass("c-selected");//追加父节点选中样式
    }
    else {
        $(obj).parent().prev().parent().parent().find("ul:first").find("input[type='checkbox']").parent().removeClass("c-selected");
        if (!$(obj).parent().parent().parent().parent().find("div").hasClass('c-selected'))
            $(obj).parent().parent().parent().parent().prev('a').find(".checkbox").removeClass("c-selected");//去除父节点选中样式
    }
    ;

    GetPersonLocation();
    window.setInterval(GetPersonLocation, 1000 * 60);//每隔一分钟定时获取人员位置
}

//获取人员定位
function GetPersonLocation() {
    var userid = "";
    $("#dwDivCon .checkbox").each(function () {
        if ($(this).hasClass('c-selected')) {
            if ($(this).attr('id') != "" && $(this).attr('id') != "undefined") {
                userid += $(this).attr('id') + ",";
            }
        }
    })
    userid = userid == "" ? userid : TrimLastStr(userid);


    rydwLayer.clear(); //清空图层
    $.ajax({
        url: 'http://www.cstrqcp.com/api/gis/location?userIds=' + userid,
        type: "get",
        dataType: "jsonp",
        async: false,
        jsonp: 'callback',
        success: function (json_obj) {
            for (var i = 0; i < json_obj.length; i++) {
                var coord_X = parseFloat(json_obj[i].longitude);  //经度
                var coord_Y = parseFloat(json_obj[i].latitude);    //纬度               
                // 百度经纬度坐标转国测局坐标
                var bd09coord = bd09togcj02(coord_X, coord_Y);
                //  国测局坐标转wgs84坐标
                var wgs84coord = gcj02towgs84(bd09coord[0], bd09coord[1]);
                var picSymbol = new esri.symbol.PictureMarkerSymbol("images/person.png", 24, 24);
                var centerPoint = new esri.geometry.Point(wgs84coord[0], wgs84coord[1], map.spatialReference);

                var attr = {
                    "birthday": IsNullValue(json_obj[i].birthday),
                    "realName": IsNullValue(json_obj[i].realName),
                    "gender": sexStr(json_obj[i].gender),
                    "cellphone": IsNullValue(json_obj[i].cellphone),
                    "telephone": IsNullValue(json_obj[i].telephone),
                    "remark": IsNullValue(json_obj[i].remark),
                    "email": IsNullValue(json_obj[i].email)
                };   //定位——人员信息
                var picGraphic = new esri.Graphic(centerPoint, picSymbol, attr);
                rydwLayer.add(picGraphic);
            }
        },
        error: function (xmlhttprequest, textstatus, errorthrown) {
            alert(xmlhttprequest.status);
            alert(xmlhttprequest.readystate);
            alert(textstatus);
        }
    });
}

//去除最后一个字符
function TrimLastStr(str) {
    return str.substring(0, str.length - 1);
}

//性别
function sexStr(value) {
    if (value === 1) {
        return "男";
    }
    else if (value === 2) {
        return "女"
    } else {
        return "未知";
    }
}

//获取人员列表 结束