getApp(), new (require("../../lib/amap-wx.js").AMapWX)({
    key: "F8f1f5c8a20c199dd0f70f5a6b162280"
});

Page({
    data: {
        text: "Hello world"
    },
    onLoad: function(t) {
        this.setData({
            text: this.data.text
        });
    }
});