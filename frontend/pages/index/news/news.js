var e = getApp();

Page({
    data: {
        title: [ "评价消息", "提现到账消息", "提现失败消息", "报名活动消息", "取消蜂约消息", "收取蜂蜜消息", "认证成功", "认证失败", "取消蜂约退款", "活动提醒消息", "取消活动消息", "取消活动退款" ],
        content: [ "给您进行了评价！", "您申请的提现已经到账，请查看", "很遗憾，您提现失败，请您重新提交！", "参加了您创建的", "用户取消了", "活动已结束，请及时收取蜂蜜！", "恭喜您认证成功！", "很遗憾您的认证未通过审核，请重新提交！", "蜂约，退款已经到账，请您查收！", "还有5个小时就要开始了！", "被发起人取消了，请知晓！", "被发起人取消，退款已经到账，请您查收！" ],
        eventData: []
    },
    onLoad: function(t) {
        var a = this;
        a.setData({
            eventData: e.globalData.eventType
        }), wx.request({
            url: e.globalData.mainURL + "api/getAlarm",
            data: {
                user_id: e.globalData.userInfo.user_id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(e) {
                console.log(e);
                for (var t, n = e.data.news, o = new Array(), i = Date.now(), s = new Object(), l = 0; l < n.length; l++) {
                    if (s = n[l], t = Date.parse(n[l].submit_time.replace(/-/g, "/")), i - t < 12e4) s.submit_time = "刚刚"; else if (i - t < 36e5) {
                        var u = (i - t) / 6e4;
                        u = Math.floor(u), s.submit_time = u + "分钟前";
                    } else if (i - t < 864e5) {
                        var r = (i - t) / 36e5;
                        r = Math.floor(r), s.submit_time = r + "小时前";
                    } else if (i - t < 1728e5) s.submit_time = "昨天"; else {
                        var m = n[l].submit_time.split(" ");
                        s.submit_time = m[0];
                    }
                    null == s.name && (s.name = s.nickname), s.type = 1 * s.type, o.push(s);
                }
                a.setData({
                    newsarray: o
                });
            }
        }), e.globalData.see_news = 1;
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {}
});