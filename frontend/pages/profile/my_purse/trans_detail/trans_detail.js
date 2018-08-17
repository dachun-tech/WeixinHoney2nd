var t = getApp();

Page({
    data: {
        title: [ "申请提现", "申请提现", "申请提现", "用户报名蜂约", "用户取消蜂约", "取消活动", "取消活动", "报名蜂约", "取消蜂约" ],
        sub_title: [ "提现中", "提现成功", "提现失败" ],
        plus: [ "-", "-", "+", "+", "-", "-", "+", "-", "+" ],
        payment: []
    },
    onLoad: function() {
        var a = this;
        wx.request({
            url: t.globalData.mainURL + "api/getPaymentHistory",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id
            },
            success: function(t) {
                if (console.log("asdf"), 1 == t.data.status) {
                    for (var e = t.data.payment, o = 0; o < e.length; o++) Math.floor(e[o].amount) == e[o].amount && (e[o].amount += ".00");
                    a.setData({
                        payment: e
                    });
                }
            }
        });
    }
});