var t = getApp();

Page({
    data: {
        event: {
            start_time: "",
            end_time: "",
            province: "",
            area: "",
            city: "",
            detail_address: "",
            pic: ""
        },
        booking: [],
        eventType: [],
        userRole: [],
        eventState: [],
        feedbacks: [],
        is_full: !1,
        is_registered: !1,
        register_amount: 0,
        btn_text: "立即参加",
        rating: 0,
        rating_amount: 0
    },
    onLoad: function(e) {
        var a = this;
        0 == t.globalData.userInfo.user_id ? (t.onLaunch(), setTimeout(function() {
            a.onInitStart(e);
        }, 2500)) : a.onInitStart(e);
    },
    onInitStart: function(e) {
        this.setData({
            userInfo: t.globalData.userInfo,
            eventType: t.globalData.eventType,
            userRole: t.globalData.userRole,
            eventState: t.globalData.eventState
        });
        var a = e.id, n = this;
        wx.request({
            url: t.globalData.mainURL + "api/getEventDetail",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                event_id: a,
                user_id: t.globalData.userInfo.user_id
            },
            success: function(e) {
                console.log(e.data.booking), console.log(e.data.favor);
                var i = e.data.booking, s = 0;
                n.setData({
                    favourite_num: 1 * e.data.result[0].favor_state
                });
                for (r = 0; r < i.length; r++) console.log(i[r].nickname), i[r].user_id == t.globalData.userInfo.user_id && 1 * i[r].state == 0 ? (n.setData({
                    is_registered: !0,
                    is_disabled: !0,
                    btn_text: "已报名"
                }), s += 1 * i[r].reg_num) : 1 * i[r].state == 2 ? (i[r].user_id == t.globalData.userInfo.user_id && n.setData({
                    is_registered: !0,
                    is_disabled: !0,
                    btn_text: "已取消"
                }), i.splice(r, 1), r--) : s += 1 * i[r].reg_num;
                n.setData({
                    register_amount: s
                }), s >= e.data.result[0].limit && "立即参加" == n.data.btn_text && n.setData({
                    is_disabled: !0,
                    btn_text: "人数已满"
                });
                for (var o = 0; o < i.length; o++) null == i[o].name && (i[o].name = i[o].nickname);
                for (var r = 0; r < e.data.feedbacks.length; r++) {
                    "" == e.data.feedbacks[r].avatar && (e.data.feedbacks[r].avatar = "/image/user-unlogin.png");
                    u = e.data.feedbacks[r].submit_time.split(":");
                    e.data.feedbacks[r].submit_time = u[0] + ":" + u[1];
                }
                console.log(e.data.feedbacks), n.setData({
                    booking: i,
                    rating: 1 * e.data.favor[0],
                    feedbacks: e.data.feedbacks
                });
                var d = e.data.result[0];
                if (d.pic = t.globalData.uploadURL + d.pic, d.favor_state = 1 * d.favor_state, d.eventName.length > 15) {
                    var l = d.eventName;
                    l = l.slice(0, 15) + "..", d.eventName = l;
                }
                var u = d.start_time.split(":");
                d.start_time = u[0] + ":" + u[1], u = d.end_time.split(":"), d.end_time = u[0] + ":" + u[1], 
                wx.setNavigationBarTitle({
                    title: t.globalData.eventType[d.type] + "活动"
                }), n.setData({
                    event: d,
                    id: a
                }), "0" != e.data.result[0].state && n.setData({
                    is_disabled: !0,
                    btn_text: "活动完成"
                });
            }
        });
    },
    add_feedback: function() {
        var t = this;
        wx.redirectTo({
            url: "add_feedback?id=" + t.data.event.id
        });
    },
    phone_call: function() {
        var t = this;
        wx.makePhoneCall({
            phoneNumber: t.data.event.agent_phone,
            complete: function() {}
        });
    },
    set_preview: function() {
        var t = this;
        wx.previewImage({
            urls: [ t.data.event.pic ],
            complete: function() {}
        });
    },
    btn_Clicked_Personal_Input: function(t) {
        wx.redirectTo({
            url: "../personal_input/personal_input?id=" + t.currentTarget.id,
            success: function(t) {},
            fail: function(t) {},
            complete: function(t) {}
        });
    },
    btn_Clicked_Gym_Info: function(t) {
        wx.navigateTo({
            url: "../detail_gym/detail_gym?id=" + t.currentTarget.id,
            success: function(t) {},
            fail: function(t) {},
            complete: function(t) {}
        });
    },
    btn_Clicked_Favor: function() {
        var e = this.data.favourite_num;
        this.data.rating;
        0 == e ? (e = 1, this.setData({
            favourite_num: e
        }), this.data.rating++, this.setData({
            rating: this.data.rating
        })) : (e = 0, this.setData({
            favourite_num: e
        }), this.data.rating--, this.setData({
            rating: this.data.rating
        }));
        var a = this;
        wx.request({
            url: t.globalData.mainURL + "api/setFavouriteEvent",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id,
                event_id: a.data.event.id
            },
            success: function(t) {}
        });
    },
    onShareAppMessage: function(e) {
        console.log("SHARED"), "button" === e.from && console.log(e.target);
        var a = this;
        return {
            title: a.data.event.eventName,
            path: "/pages/index/detail_event/detail_event1?id=" + a.data.event.id + "&user_id=" + t.globalData.userInfo.user_id + "&nickname=" + t.globalData.userInfo.nickname + "&atype=1",
            success: function(t) {},
            fail: function(t) {}
        };
    }
});