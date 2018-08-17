getApp();

Page({
    data: {
        image_cancel_success_src: "../../../image/success@2x.png",
        kind: 0,
        cancel_sucess_text: [ "提交成功，钱款将在1-3个工作日到账", "取消成功，钱款将在1-3个工作日退回", "报名成功" ]
    },
    onLoad: function(t) {
        this.setData({
            kind: t.type
        });
    },
    on_return: function() {
        2 == this.data.kind ? wx.switchTab({
            url: "../../activity/activity"
        }) : wx.switchTab({
            url: "../profile"
        });
    }
});