var n = getApp();

Page({
    data: {},
    onLoad: function(n) {
        console.log("FirstONLOAD");
    },
    onReady: function() {},
    onShow: function() {
        0 == n.globalData.iscreatepage ? wx.navigateTo({
            url: "create_event"
        }) : (n.globalData.iscreatepage = 0, wx.switchTab({
            url: "../../index/index"
        }));
    },
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {}
});