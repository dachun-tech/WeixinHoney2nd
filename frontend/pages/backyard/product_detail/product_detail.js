var t = require("../../../wxParse/wxParse.js"), a = getApp();

Page({
    data: {
        id: 0,
        disable: 1,
        btn_text: "立即兑换",
        comment: ""
    },
    onLoad: function(e) {
        var o = this;
        wx.request({
            url: a.globalData.mainURL + "api/getGoodDetail",
            data: {
                id: e.id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(e) {
                if (console.log(e.data.result[0]), e.data.status) {
                    o.data.id = e.data.result[0].id, o.data.cost = e.data.result[0].cost;
                    var n = e.data.result[0].comment;
                    t.wxParse("comment", "html", n, o), o.setData({
                        btn_text: "立即兑换",
                        disable: 0
                    }), 1 * e.data.result[0].cost > 1 * a.globalData.honey_info.total_honey && o.setData({
                        btn_text: "蜂蜜不足",
                        disable: 1
                    }), 0 == e.data.result[0].amount && o.setData({
                        btn_text: "缺货",
                        disable: 1
                    });
                    var d = a.globalData.uploadURL + e.data.result[0].pic;
                    e.data.result[0].pic = d, o.setData({
                        product: e.data.result[0]
                    });
                }
            },
            fail: function() {}
        });
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {},
    On_click_order: function() {
        var t = this;
        wx.redirectTo({
            url: "../product_order/product_order?id=" + t.data.id
        });
    }
});