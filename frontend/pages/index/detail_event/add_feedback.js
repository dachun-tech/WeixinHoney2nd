var t = getApp();

Page({
    data: {
        text_count: 0,
        comment: "",
        event_id: 0
    },
    onLoad: function(e) {
        this.setData({
            event_id: e.id
        }), t.globalData.userInfo.nickname || wx.showModal({
            title: "获取用户信息失败",
            content: "由于无法获取您的信息，所以您无法使用留言功能",
            showCancel: !1,
            complete: function() {
                wx.redirectTo({
                    url: "detail_event?id=" + e.id,
                    success: function() {}
                });
            }
        });
    },
    bindInputText: function(t) {
        this.setData({
            text_count: t.detail.cursor,
            comment: t.detail.value
        });
    },
    btn_submit: function() {
        if (this.data.comment.length <= 200) {
            var e = this;
            wx.request({
                url: t.globalData.mainURL + "api/addFeedback",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    event_id: e.data.event_id,
                    user_id: t.globalData.userInfo.user_id,
                    comment: e.data.comment
                },
                success: function(t) {
                    1 == t.data.status && wx.redirectTo({
                        url: "detail_event?id=" + e.data.event_id
                    });
                }
            });
        } else wx.showToast({
            title: "你输入的字符超过200字！",
            icon: "none"
        });
        console.log(this.data.comment);
    }
});