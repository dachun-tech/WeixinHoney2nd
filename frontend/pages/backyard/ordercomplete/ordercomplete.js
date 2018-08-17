getApp();

Page({
    data: {},
    onLoad: function(n) {},
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {},
    on_click_shop: function() {
        wx.navigateTo({
            url: "../mainbeeshop/mainbeeshop"
        });
    },
    on_click_map: function() {
        wx.switchTab({
            url: "../../index/index"
        });
    }
});