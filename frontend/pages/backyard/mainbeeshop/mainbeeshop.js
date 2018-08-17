var t = getApp();

Page({
    data: {},
    onLoad: function(a) {
        var o = this;
        this.setData({
            total_honey: t.globalData.honey_info.total_honey
        }), this.setData({
            upload_url: t.globalData.uploadURL
        }), wx.request({
            url: t.globalData.mainURL + "api/getGoodsList",
            data: {},
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(t) {
                t.data.status && (console.log(t.data.result), o.setData({
                    product_array: t.data.result
                }));
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
    On_click_product: function(t) {
        wx.navigateTo({
            url: "../product_detail/product_detail?id=" + t.currentTarget.id
        });
    }
});