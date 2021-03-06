﻿!function ($) {
    $.extend({
        _jsonp: {
            scripts: {},
            counter: 1,
            charset: "gb2312",
            head: document.getElementsByTagName("head")[0],
            name: function (callback) {
                var name = "_jsonp_" + (new Date).getTime() + "_" + this.counter;
                this.counter++;
                var cb = function (json) {
                    eval("delete " + name),
                        callback(json),
                        $._jsonp.head.removeChild($._jsonp.scripts[name]),
                        delete $._jsonp.scripts[name]
                };
                return eval(name + " = cb"),
                    name
            },
            load: function (a, b) {
                var c = document.createElement("script");
                c.type = "text/javascript",
                    c.charset = this.charset,
                    c.src = a,
                    this.head.appendChild(c),
                    this.scripts[b] = c
            }
        },
        getJSONP: function (a, b) {
            var c = $._jsonp.name(b),
                a = a.replace(/{callback};/, c);
            return $._jsonp.load(a, c),
                this
        }
    })
}(jQuery);
var iplocation = locationJsonInfoDyr.ip_location;  //省市
var provinceCityJson = locationJsonInfoDyr.city_location; //市区
function doInitRegion()
{
    var province_id = getCookieByName('province_id'),city_id = getCookieByName('city_id'),district_id = getCookieByName('district_id');
    if(province_id==null || city_id==null){
        province_id = 1;
        city_id = 2;
        district_id = '';
    }
   // $('ul.list1').Address({ proid: province_id, cityid: city_id, areaid: district_id });
    $('ul.list1head').Addresshead({ proid: province_id});
}

//循环输出省html
function getProvinceHtml()
{
    var str = '';
    for(var o in iplocation){
        str += '<li><a href="#none" data-value="'+iplocation[o].id+'">'+o+'</a></li>';
    }
    return str;
}

//-----------------------------------------------------------


//根据省份ID获取名称
function getNameById(provinceId) {
    for (var o in iplocation) {
        if (iplocation[o] && iplocation[o].id == provinceId) {
            return o;
        }
    }
    return "北京";
}
//根据省份名称获取ID
function getIdByName(name) {
    if(iplocation[name].id){
        return iplocation[name].id;
    }else {
        return 1;
    }

}
//根据是名称获取ID
function getcityIdByName(name) {
    //return provinceCityJson[name].id;
    for (var o in provinceCityJson){
        //console.log(provinceCityJson[o]);
        for (var i in provinceCityJson[o]){
            //alert(provinceCityJson[o][i]['name']);
            if(provinceCityJson[o][i]['name'] == name){
                return provinceCityJson[o][i]['id']
            }
        }
    }
    return 2;
}
/**
 * 获取县区列表
 * @param result
 * @returns {string}
 */
function getAreaList(result) {
    var html = ["<ul class='area-list'>"];
    var longhtml = [];
    var longerhtml = [];
    if (result && result.length > 0) {
        for (var i = 0, j = result.length; i < j; i++) {
            result[i].name = result[i].name.replace(" ", "");
            if (result[i].name.length > 12) {
                longerhtml.push("<li class='longer-area'><a href='#none' data-value='" + result[i].id + "'>" + result[i].name + "</a></li>");
            }
            else if (result[i].name.length > 5) {
                longhtml.push("<li class='long-area'><a href='#none' data-value='" + result[i].id + "'>" + result[i].name + "</a></li>");
            }
            else {
                html.push("<li><a href='#none' data-value='" + result[i].id + "'>" + result[i].name + "</a></li>");
            }
        }
    }
    else {
        html.push("<li><a href='#none' data-value='" + currentAreaInfo.currentFid + "'> </a></li>");
    }
    html.push(longhtml.join(""));
    html.push(longerhtml.join(""));
    html.push("</ul>");

    return html.join("");
}
//商品物流配送与运费
function ajaxDispatching(region_id) {
    //region_id  地区的最后第三个id
    var goods_id = $("input[name='goods_id']").val();
    var goods_num = $("input[name='goods_num']").val();
    var item_id = $("input[name='item_id']").val();
    $('#dispatching_msg').attr('region_id',region_id);
    if(typeof(goods_id) != 'undefined' && region_id!= ''){
        $.ajax({
            type: "POST",
            dataType: 'json',
            data: {goods_id: goods_id, region_id: region_id,goods_num:goods_num,item_id:item_id},
            url: "/index.php?m=Home&c=Goods&a=dispatching",
            success: function (data) {
                if (data.status == 1) {
                    $('#dispatching_msg').show().html(data.msg);
                    if(data.result.freight == 0){
                        $('#dispatching_desc').show().html('免运费');
                    }else{
                        $('#dispatching_desc').show().html("运费 ￥" + data.result.freight);
                    }
                    $('.buy_button').removeClass('buy_bt_disable');
                } else if (data.status == -1) {
                    $('#dispatching_msg').show().html(data.msg);
                    $('#dispatching_desc').hide();
                    $('.buy_button').addClass('buy_bt_disable');
                } else {
                    $('#dispatching_msg').show().html(data.msg);
                    $('#dispatching_desc').hide();
                    $('.buy_button').addClass('buy_bt_disable');
                }
            }
        });
    }
}
//初始化布局
(function ($) {
    $.fn.Address = function (cfg) {
        return this.each(function () {
            var JD_stock = $('<div class="content"><div data-widget="tabs" class="m JD-stock">'
                + '<div class="mt">'
                + '    <ul class="tab">'    //切换城市默认选中的城市地区
                + '        <li data-index="0" data-widget="tab-item" class="curr"><a href="#none" class="hover"><em>请选择</em><i></i></a></li>'
                + '        <li data-index="1" data-widget="tab-item" style="display:none;"><a href="#none" class=""><em>请选择</em><i></i></a></li>'
                + '        <li data-index="2" data-widget="tab-item" style="display:none;"><a href="#none" class=""><em>请选择</em><i></i></a></li>'
                + '        <li data-index="3" data-widget="tab-item" style="display:none;"><a href="#none" class=""><em>请选择</em><i></i></a></li>'
                //                        + '        <li data-index="4" style="float:right;"><a href="#none" class=""><em>确定</em><i></i></a></li>'
                //                        + '        <li data-index="5" style="float:right;" ><a href="#none" class=""><em>清除</em><i></i></a></li>'
                + '    </ul>'
                + '    <div class="stock-line"></div>'
                + '</div>'
                + '<div class="mc stock_province_item" data-area="0" data-widget="tab-content">'
                + '    <ul class="area-list">'
                + getProvinceHtml()   //省份的html
                + '    </ul>'
                + '</div>'
                + '<div class="mc stock_city_item" data-area="1" data-widget="tab-content"></div>'
                + '<div class="mc stock_area_item" data-area="2" data-widget="tab-content""></div>'
                + '<div class="mc stock_town_item" data-area="3" data-widget="tab-content"></div>'
                + '</div></div>');
            var ul = $(this), store_selector = ul.find('div.store-selector'), addrIDContainer = ul.find('div.addrID'), getAreaListcallback = 'areaCallBack' + new Date().getTime(); //回调函数名称
            var currentAreaInfo; //保存当前信息变量
            function getStockOpt(id, name) {
                if (currentAreaInfo.currentLevel == 3) {
                    currentAreaInfo.currentAreaId = id;
                    currentAreaInfo.currentAreaName = name;
                    if (!page_load) {
                        currentAreaInfo.currentTownId = 0;
                        currentAreaInfo.currentTownName = "";
                    }
                }
                else if (currentAreaInfo.currentLevel == 4) {
                    currentAreaInfo.currentTownId = id;
                    currentAreaInfo.currentTownName = name;
                }
                store_selector.removeClass('hover');
                if (page_load) {
                    page_load = false;
                }
                //替换gSC
                //var address = currentAreaInfo.currentProvinceName+','+ currentAreaInfo.currentCityName+','+ currentAreaInfo.currentAreaName +','+ currentAreaInfo.currentTownName;
                if(currentAreaInfo.currentAreaName){
                    var address = currentAreaInfo.currentProvinceName + currentAreaInfo.currentCityName + currentAreaInfo.currentAreaName + currentAreaInfo.currentTownName;
                }else {
                    var address = currentAreaInfo.currentProvinceName + currentAreaInfo.currentCityName;
                }
                //只选择最低级地名--------------------------------------------------------------------
                //最后的获取结果为所选的最后一级地名，比如若只选到县名，则保留县名，同理市名，省名。
                var tTown = "", tArea = "", tCity = "", tProvince = "";
                var tID = "";
                tProvince = currentAreaInfo.currentProvinceName;
                tCity = cleanKuohao(currentAreaInfo.currentCityName);
                tArea = cleanKuohao(currentAreaInfo.currentAreaName);
                tTown = cleanKuohao(currentAreaInfo.currentTownName);
                //tID=currentAreaInfo.currentAreaId;
                if (tTown != "") {
                    tProvince = tCity = tArea = "";
                    tID = currentAreaInfo.currentTownId;
                }
                else if (tArea != "") {
                    tProvince = tCity = "";
                    tID = currentAreaInfo.currentAreaId;
                }
                else if (tCity != "") {
                    tProvince = "";
                    tID = currentAreaInfo.currentCityId;
                }
                else {
                    tID = currentAreaInfo.currentProvinceId;
                }

                var oldAddrHtml = store_selector.find(".text div").text();
                var oldAddrID = store_selector.find(".text div").attr("val");
                var addrHtml = "";
                var addrID = "";
                if (oldAddrHtml != "") {
//                        addrHtml = oldAddrHtml + "," + tProvince + tCity + tArea + tTown;
                    addrHtml = tProvince + tCity + tArea + tTown;
                    addrID = oldAddrID + "," + tID;
                }
                else {
                    addrHtml = tProvince + tCity + tArea + tTown;
                    addrID = tID;
                }
                // store_selector.find(".text div").html(address).attr("val", addrID);
                store_selector.find(".text div").html(address).attr("val", tID);
                //alert(getNameById(currentAreaInfo.currentProvinceId));
                $(".headtext div").html(getNameById(currentAreaInfo.currentProvinceId)).attr("val", currentAreaInfo.currentProvinceId);
                addrIDContainer.find("div").html("地名ID为：" + addrID); //地名ID
                delCookie('province_id');
                delCookie('city_id');
                delCookie('district_id');
                setCookies('province_id',currentAreaInfo.currentProvinceId,30*24*60*60*1000);
                setCookies('city_id',currentAreaInfo.currentCityId,30*24*60*60*1000);
                setCookies('district_id',currentAreaInfo.currentAreaId,30*24*60*60*1000);
                setCookies('parent_region', parentRegion);
                ajaxDispatching(tID);//选中地址事件
            }


            window.getAreaListcallback = function (r) { ////////全局JSONP回调
                parentRegion = JSON.stringify(r);
                currentDom.html(getAreaList(r));
                if (currentAreaInfo.currentLevel >= 2) {
                    currentDom.find("a").click(function () {
                        if (page_load) {
                            page_load = false;
                        }
                        if (currentDom.hasClass("stock_area_item")) {
                            currentAreaInfo.currentLevel = 3;
                        }
                        else if (currentDom.hasClass("stock_town_item")) {
                            currentAreaInfo.currentLevel = 4;
                        }
                        getStockOpt($(this).attr("data-value"), $(this).html());
                    });
                    if (page_load) { //初始化加载
                        currentAreaInfo.currentLevel = currentAreaInfo.currentLevel == 2 ? 3 : 4;
                        if (currentAreaInfo.currentAreaId && new Number(currentAreaInfo.currentAreaId) > 0) {
                            getStockOpt(currentAreaInfo.currentAreaId, currentDom.find("a[data-value='" + currentAreaInfo.currentAreaId + "']").html());
                        }
                        else {
                            getStockOpt(currentDom.find("a").eq(0).attr("data-value"), currentDom.find("a").eq(0).html());
                        }
                    }
                }
            }
            function chooseProvince(provinceId) {
                provinceContainer.hide();
                currentAreaInfo.currentLevel = 1;
                currentAreaInfo.currentProvinceId = provinceId;
                currentAreaInfo.currentProvinceName = getNameById(provinceId);
                if (!page_load) {
                    currentAreaInfo.currentCityId = 0;
                    currentAreaInfo.currentCityName = "";
                    currentAreaInfo.currentAreaId = 0;
                    currentAreaInfo.currentAreaName = "";
                    currentAreaInfo.currentTownId = 0;
                    currentAreaInfo.currentTownName = "";
                }
                areaTabContainer.eq(0).removeClass("curr").find("em").html(currentAreaInfo.currentProvinceName);
                areaTabContainer.eq(1).addClass("curr").show().find("em").html("请选择");
                areaTabContainer.eq(2).hide();
                areaTabContainer.eq(3).hide();
                cityContainer.show();
                areaContainer.hide();
                townaContainer.hide();
                if (provinceCityJson["" + provinceId]) {
                    cityContainer.html(getAreaList(provinceCityJson["" + provinceId]));
                    cityContainer.find("a").click(function () {
                        if (page_load) {
                            page_load = false;
                        }
                        store_selector.unbind("mouseout");
                        chooseCity($(this).attr("data-value"), $(this).html());
                    });
                    if (page_load) { //省初始化加载
                        if (currentAreaInfo.currentCityId && new Number(currentAreaInfo.currentCityId) > 0) {
                            chooseCity(currentAreaInfo.currentCityId, cityContainer.find("a[data-value='" + currentAreaInfo.currentCityId + "']").html());
                        }
                        else {
                            chooseCity(cityContainer.find("a").eq(0).attr("data-value"), cityContainer.find("a").eq(0).html());
                        }
                    }
                }
            }


            function chooseCity(cityId, cityName) {
                provinceContainer.hide();
                cityContainer.hide();
                currentAreaInfo.currentLevel = 2;
                currentAreaInfo.currentCityId = cityId;
                currentAreaInfo.currentCityName = cityName;
                if (!page_load) {
                    currentAreaInfo.currentAreaId = 0;
                    currentAreaInfo.currentAreaName = "";
                    currentAreaInfo.currentTownId = 0;
                    currentAreaInfo.currentTownName = "";
                }
                areaTabContainer.eq(1).removeClass("curr").find("em").html(cityName);
                areaTabContainer.eq(2).addClass("curr").show().find("em").html("请选择");
                areaTabContainer.eq(3).hide();
                areaContainer.show().html("<div class='iloading'>正在加载中，请稍候...</div>");
                townaContainer.hide();
                currentDom = areaContainer;
                window.getAreaListcallback(areaListDyr[cityId]);
//                    $.getJSONP("https://d.jd.com/area/get?callback=getAreaListcallback&fid="+cityId);
//				$.getJSONP("/index.php?m=Home&c=Goods&callback=getAreaListcallback&a=region&fid="+cityId);
            }
            function chooseArea(areaId, areaName) {
                provinceContainer.hide();
                cityContainer.hide();
                areaContainer.hide();
                currentAreaInfo.currentLevel = 3;
                currentAreaInfo.currentAreaId = areaId;
                currentAreaInfo.currentAreaName = areaName;
                if (!page_load) {
                    currentAreaInfo.currentTownId = 0;
                    currentAreaInfo.currentTownName = "";
                }
                areaTabContainer.eq(2).removeClass("curr").find("em").html(areaName);
                areaTabContainer.eq(3).addClass("curr").show().find("em").html("请选择");
                townaContainer.show().html("<div class='iloading'>正在加载中，请稍候...</div>");
                currentDom = townaContainer;
//                    $.getJSONP("https://d.jd.com/area/get?callback=getAreaListcallback&fid="+areaId);
                $.getJSONP("/index.php?m=Home&c=Goods&callback=getAreaListcallback&a=region&fid="+areaId);
            }


            store_selector.find('.content').remove();
            store_selector.find('.text').after(JD_stock);
            var areaTabContainer = JD_stock.find(".tab li");
            var provinceContainer = ul.find("div.stock_province_item");
            var cityContainer = ul.find("div.stock_city_item");
            var areaContainer = ul.find("div.stock_area_item");
            var townaContainer = ul.find("div.stock_town_item");
            var currentDom = provinceContainer;
            var parentRegion = null;
            //当前地域信息
            var currentAreaInfo;
            //初始化当前地域信息
            function CurrentAreaInfoInit(proid, cityid, areaid, townid) {
                var proname = getNameById(proid);
                currentAreaInfo = { "currentLevel": 1, "currentProvinceId": proid, "currentProvinceName": proname, "currentCityId": 0, "currentCityName": "", "currentAreaId": 0, "currentAreaName": "", "currentTownId": 0, "currentTownName": "" };

                chooseProvince(proid); //加载省，需要一级一级加载，不能越级
            }
            var page_load = true;

            store_selector.on("click",'.text', function () {
                store_selector.addClass('hover');
                store_selector.find('.content').show();
                JD_stock.show();
            }).find("dl").remove();
            CurrentAreaInfoInit(cfg.proid, cfg.cityid, cfg.areaid, cfg.townid);

            //当第0个选项卡被点击时，显示“省”选项面板
            areaTabContainer.eq(0).find("a").click(function () {
                areaTabContainer.removeClass("curr");
                areaTabContainer.eq(0).addClass("curr").show();
                provinceContainer.show();
                cityContainer.hide();
                areaContainer.hide();
                townaContainer.hide();
                areaTabContainer.eq(1).hide();
                areaTabContainer.eq(2).hide();
                areaTabContainer.eq(3).hide();
            });

            //当第1个选项卡被点击时，显示“市”选项面板
            areaTabContainer.eq(1).find("a").click(function () {
                areaTabContainer.removeClass("curr");
                areaTabContainer.eq(1).addClass("curr").show();
                provinceContainer.hide();
                cityContainer.show();
                areaContainer.hide();
                townaContainer.hide();
                areaTabContainer.eq(2).hide();
                areaTabContainer.eq(3).hide();
            });

            //当第2个选项卡被点击时，显示“县”选项面板
            areaTabContainer.eq(2).find("a").click(function () {
                areaTabContainer.removeClass("curr");
                areaTabContainer.eq(2).addClass("curr").show();
                provinceContainer.hide();
                cityContainer.hide();
                areaContainer.show();
                townaContainer.hide();
                areaTabContainer.eq(3).hide();
            });


            //当第四个选项卡被点击时，确定地名------------------------------------------------------
            areaTabContainer.eq(4).find("a").click(function () {
                //areaTabContainer.removeClass("curr");
                areaTabContainer.eq(0).addClass("curr").show();
                provinceContainer.show();
                cityContainer.hide();
                areaContainer.hide();
                townaContainer.hide();
                areaTabContainer.eq(1).hide();
                areaTabContainer.eq(2).hide();
                areaTabContainer.eq(3).hide();
                //-----------------------------
                if (!page_load) {
                    currentAreaInfo.currentTownId = 0;
                    currentAreaInfo.currentTownName = "";
                }
                store_selector.removeClass('hover');
                if (page_load) {
                    page_load = false;
                }
                //替换gSC
                var address = currentAreaInfo.currentProvinceName + currentAreaInfo.currentCityName + currentAreaInfo.currentAreaName + currentAreaInfo.currentTownName;

                //只选择最低级地名---------------------------
                var tTown = "", tArea = "", tCity = "", tProvince = "";
                var tID = "";
                tProvince = currentAreaInfo.currentProvinceName;
                tCity = cleanKuohao(currentAreaInfo.currentCityName);
                tArea = cleanKuohao(currentAreaInfo.currentAreaName);
                tTown = cleanKuohao(currentAreaInfo.currentTownName);

                if (tTown != "") {
                    tProvince = tCity = tArea = "";
                    tID = currentAreaInfo.currentTownId;
                }
                else if (tArea != "") {
                    tProvince = tCity = "";
                    tID = currentAreaInfo.currentAreaId;
                }
                else if (tCity != "") {
                    tProvince = "";
                    tID = currentAreaInfo.currentCityId;
                }
                else {
                    tID = currentAreaInfo.currentProvinceId;
                }
                var addrHtml =tProvince+tCity+tArea+tTown;
                var oldAddrHtml = store_selector.find(".text div").text();
                var oldAddrID = store_selector.find(".text div").attr("val");
//                    var addrHtml = "";
                var addrID = "";
                if (oldAddrHtml != "") {
                    addrHtml = oldAddrHtml + "," + tProvince + tCity + tArea + tTown;
                    addrID = oldAddrID + "," + tID;
                }
                else {
                    addrHtml = tProvince + tCity + tArea + tTown;
                    addrID = tID;

                }
                store_selector.find(".text div").html(addrHtml).attr("val", addrID);//
                addrIDContainer.find("div").html("地名ID为：" + addrID); //选择的地名ID
            }); //当第四个选项卡被点击时，确定地名------------------------------------------------------------


            //当第5个选项卡被点击时，清除原有地名-----------------------------
            areaTabContainer.eq(5).find("a").click(function () {
                //var emptyHtml="";
                //var emptyAddrID=""
                //清空地址名
                store_selector.find(".text div").html("").attr("val", "");
                addrIDContainer.find("div").html("");
                areaTabContainer.removeClass("curr");
                areaTabContainer.eq(0).addClass("curr").show();
                provinceContainer.show();
                cityContainer.hide();
                areaContainer.hide();
                townaContainer.hide();
                areaTabContainer.eq(1).hide();
                areaTabContainer.eq(2).hide();
                areaTabContainer.eq(3).hide();
            }); //当第5个选项卡被点击时，清除原有地名-----------------------------

            provinceContainer.find("a").click(function () {
                if (page_load) {
                    page_load = false;
                }
                store_selector.unbind("mouseout");
                chooseProvince($(this).attr("data-value"));
            }).end();

        });
    };
})(jQuery);
//初始化布局
(function ($) {
    $.fn.Addresshead = function (cfg) {
        return this.each(function () {
            var JD_stock = $('<div class="headcontent"><div data-widget="tabs" class="m JD-stock">'
                + '<div class="mt">'
                + '    <ul class="tab">'    //切换城市默认选中的城市地区
                + '        <li data-index="0" data-widget="tab-item" class="curr"><a href="#none" class="hover"><em>请选择</em><i></i></a></li>'
                + '    </ul>'
                + '    <div class="stock-line"></div>'
                + '</div>'
                + '<div class="mc headstock_province_item" data-area="0" data-widget="tab-content">'
                + '    <ul class="area-list">'
                + getProvinceHtml()   //省份的html
                + '    </ul>'
                + '</div>'
                + '</div></div>');
            var ul = $(this), store_selector = ul.find('div.store-selector'), addrIDContainer = ul.find('div.addrID'), getAreaListcallback = 'areaCallBack' + new Date().getTime(); //回调函数名称
            var currentAreaInfo; //保存当前信息变量
            function headchooseProvince(provinceId) {
                provinceContainer.hide();
                currentAreaInfo.currentLevel = 1;
                currentAreaInfo.currentProvinceId = provinceId;
                currentAreaInfo.currentProvinceName = getNameById(provinceId);

                areaTabContainer.eq(0).find("em").html('请选择');
                //areaTabContainer.eq(1).addClass("curr").show().find("em").html("请选择");
                provinceContainer.show();

                //window.getAreaListcallback(areaListDyr[cityId]);
                //替换gSC
                var address = currentAreaInfo.currentProvinceName + currentAreaInfo.currentCityName + currentAreaInfo.currentAreaName + currentAreaInfo.currentTownName;

                //只选择最低级地名---------------------------
                var tProvince = "";
                var tID = currentAreaInfo.currentProvinceId;
                tProvince = currentAreaInfo.currentProvinceName;
                var addrHtml =tProvince;
                var addrID = "";
                addrHtml = tProvince;
                addrID = tID;
                store_selector.find(".headtext div").html(addrHtml).attr("val", addrID);//
                addrIDContainer.find("div").html("地名ID为：" + addrID); //选择的地名ID
                store_selector.removeClass('hover');
                delCookie('province_id');
                delCookie('city_id');
                delCookie('district_id');
                setCookies('province_id',currentAreaInfo.currentProvinceId,30*24*60*60*1000);
                //根据省份id 获取第一个城市
                var cityid = provinceCityJson[provinceId]['0']['id'];
                //alert(cityid);
                setCookies('city_id',cityid,30*24*60*60*1000);
                setCookies('district_id','',30*24*60*60*1000);
                setCookies('parent_region', parentRegion);

                //初始化商品地址
                $('ul.list1').Address({ proid: provinceId, cityid: cityid, areaid: '' });
                //设置商品地址
                /*var addrHtml = "";
                var addrID = "";
                var tCity = provinceCityJson[provinceId]['0']['name'];
                var tArea = areaListDyr[cityid]['0']['name'];  //地区名 如玄武区
                tID = areaListDyr[cityid]['0']['id'];
                addrHtml = tProvince + tCity + tArea;
                addrID = tID;
                $('ul.list1').find(".text div").html(addrHtml).attr("val", tID);*/
                JD_stock.hide();
            }

            store_selector.find('.headtext').after(JD_stock);
            var areaTabContainer = JD_stock.find(".tab li");
            var provinceContainer = ul.find("div.headstock_province_item");
            var currentDom = provinceContainer;
            var parentRegion = null;
            //当前地域信息
            var currentAreaInfo;
            //初始化当前地域信息
            function CurrentAreaInfoInit(proid) {
                currentAreaInfo = { "currentLevel": 1, "currentProvinceId": 1, "currentProvinceName": "北京", "currentCityId": 0, "currentCityName": "", "currentAreaId": 0, "currentAreaName": "", "currentTownId": 0, "currentTownName": "" };
                var ipLoc = getCookieByName("ipLoc-djd");
                ipLoc = ipLoc ? ipLoc.split("-") : [proid || 1];
                if (ipLoc.length > 0 && ipLoc[0]) {
                    currentAreaInfo.currentProvinceId = ipLoc[0];
                    currentAreaInfo.currentProvinceName = getNameById(ipLoc[0]);
                }
                headchooseProvince(currentAreaInfo.currentProvinceId); //加载省，需要一级一级加载，不能越级
            }
            var page_load = true;
            //点击地址字符串获取地址列表
            store_selector.on("click",'.headtext', function () {
                store_selector.addClass('hover');
                store_selector.find('.headcontent').show();
                JD_stock.show();
            }).find("dl").remove();
            CurrentAreaInfoInit(cfg.proid);

            //当第0个选项卡被点击时，显示“省”选项面板
            areaTabContainer.eq(0).find("a").click(function () {
                areaTabContainer.removeClass("curr");
                areaTabContainer.eq(0).addClass("curr").show();
                //alert('ad');
                provinceContainer.show();

            });

            //当第1个选项卡被点击时，显示“市”选项面板
            areaTabContainer.eq(1).find("a").click(function () {
                areaTabContainer.removeClass("curr");
                provinceContainer.hide();
            });

            provinceContainer.find("a").click(function () {
                if (page_load) {
                    page_load = false;
                }
                store_selector.unbind("mouseout");
                headchooseProvince($(this).attr("data-value"));
            }).end();

        });
    };
})(jQuery);

function cleanKuohao(str) {
    if (str && str.indexOf("(") > 0) {
        str = str.substring(0, str.indexOf("("));
    }
    if (str && str.indexOf("（") > 0) {
        str = str.substring(0, str.indexOf("（"));
    }
    return str;
}
