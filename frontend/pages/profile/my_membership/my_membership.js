var t = getApp();

Page({
    data: {
        expire_time: "",
        name: "",
        cost: 0,
        state: 0,
        btn_text_sel: 0,
        btn_text: [ "立即开通", "立即续费" ],
        isclick: 0
    },
    onLoad: function(a) {
        this.setData({
            userInfo: t.globalData.userInfo,
            cost: t.globalData.rule[7].value
        });
        var e = this;
        wx.request({
            url: t.globalData.mainURL + "api/getMemberState",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id,
                role: t.globalData.userInfo.role
            },
            success: function(t) {
                null != t.data.result && (null == t.data.result.state || 1 * t.data.result.state == 0 ? e.data.btn_text_sel = 0 : e.data.btn_text_sel = 1, 
                e.setData({
                    expire_time: t.data.result.expire_time,
                    state: 1 * e.data.btn_text_sel
                })), null != t.data.result1 && e.setData({
                    name: t.data.result1[0].name
                });
            }
        });
    },
    pay: function() {
        var a = t.globalData.rule[7].value;
        if (1 != this.data.isclick) {
            this.data.isclick = 1;
            var e = t.globalData.mch_id + Date.now(), n = (t.globalData.mch_id, Date.now(), 
            this);
            wx.login({
                success: function(o) {
                    o.code && wx.request({
                        url: t.globalData.mainURL + "api/pay",
                        data: {
                            id: wx.getStorageSync("openid"),
                            fee: a,
                            user_id: t.globalData.userInfo.user_id,
                            out_trade_no: e
                        },
                        method: "POST",
                        header: {
                            "content-type": "application/json"
                        },
                        success: function(o) {
                            wx.requestPayment({
                                timeStamp: o.data.timeStamp,
                                nonceStr: o.data.nonceStr,
                                package: o.data.package,
                                signType: "MD5",
                                paySign: o.data.paySign,
                                success: function(o) {
                                    o.errMsg.length <= 20 && wx.request({
                                        url: t.globalData.mainURL + "api/setMember",
                                        method: "POST",
                                        header: {
                                            "content-type": "application/json"
                                        },
                                        data: {
                                            user_id: t.globalData.userInfo.user_id,
                                            total_fee: a,
                                            out_trade_no: e
                                        },
                                        success: function(a) {
                                            n.setData({
                                                state: 1
                                            }), wx.request({
                                                url: t.globalData.mainURL + "api/getMemberState",
                                                method: "POST",
                                                header: {
                                                    "content-type": "application/json"
                                                },
                                                data: {
                                                    user_id: t.globalData.userInfo.user_id,
                                                    role: t.globalData.userInfo.role
                                                },
                                                success: function(a) {
                                                    console.log(a), t.globalData.userInfo.isVIP = 1, null != a.data.result && n.setData({
                                                        expire_time: a.data.result.expire_time
                                                    });
                                                }
                                            });
                                        }
                                    });
                                },
                                fail: function(t) {},
                                complete: function(t) {
                                    n.data.isclick = 0;
                                }
                            });
                        }
                    });
                }
            });
        }
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {},
    btn_Clicked_Cost: function(t) {}
});