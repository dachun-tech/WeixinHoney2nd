var a = getApp();

Page({
    data: {
        array: []
    },
    onLoad: function(t) {
        var n = this;
        wx.request({
            url: a.globalData.mainURL + "api/getExchange",
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(t) {
                if (t.data.status) {
                    for (var o = t.data.result, e = 0; e < o.length; e++) o[e].idshow = "0000000000", 
                    o[e].idshow = o[e].idshow.slice(0, 10 - o[e].no.length) + o[e].no;
                    n.setData({
                        array: o,
                        upload_url: a.globalData.uploadURL,
                        productState: a.globalData.productState
                    });
                }
            },
            fail: function() {}
        });
    },
    onDetailState: function(a) {
        wx.navigateTo({
            url: "../transaction_detail/transaction_detail?id=" + a.currentTarget.id
        });
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {}
});