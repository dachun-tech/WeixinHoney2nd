var e = getApp();

Page({
    data: {
        img_black_star_src: "../../../image/star_n@2x.png",
        img_yellow_star_src: "../../../image/star_s@2x.png",
        star_img_position: 25,
        id: 0,
        event: [],
        booking: [],
        rating: [],
        userInfo: [],
        eventType: [],
        userRole: [],
        eventState: [],
        register_num: 0,
        favourite_num: 0,
        isshowcancel: 1
    },
    onLoad: function(t) {
        this.setData({
            userInfo: e.globalData.userInfo,
            eventType: e.globalData.eventType,
            userRole: e.globalData.userRole,
            eventState: e.globalData.eventState
        });
        var a = this, n = t.id;
        wx.request({
            url: e.globalData.mainURL + "api/getEventDetail",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                event_id: n,
                user_id: e.globalData.userInfo.user_id
            },
            success: function(t) {
                console.log("DETAIL"), console.log(t), a.setData({
                    pay_type: [ "线下支付", "线上支付" ]
                });
                for (var i = t.data.booking, o = t.data.rating_detail, l = 0; l < i.length; l++) i[l].pay_type = 1 * i[l].pay_type, 
                null == i[l].name && (i[l].name = i[l].nickname);
                for (l = 0; l < o.length; l++) null == o[l].name && (o[l].name = o[l].nickname), 
                o[l].comment.length > 10 && (o[l].comment = o[l].comment.slice(0, 10) + "..");
                a.setData({
                    booking: i,
                    rating: o
                });
                var c = t.data.result[0];
                c.pic = e.globalData.uploadURL + c.pic, null == c.favourite_num && (c.favourite_num = 0);
                var r = t.data.result[0].current_member;
                null == r && (r = 0);
                var s = c.start_time.split(":");
                if (c.start_time = s[0] + ":" + s[1], s = c.end_time.split(":"), c.end_time = s[0] + ":" + s[1], 
                c.eventName.length > 15) {
                    var u = c.eventName;
                    u = u.slice(0, 15) + "..", c.eventName = u;
                }
                var m = Date.now(), d = c.start_time;
                Date.parse(d.replace(/-/g, "/")) - m < 216e5 && a.setData({
                    isshowcancel: 0
                }), 0 != c.state && wx.hideShareMenu(), a.setData({
                    event: c,
                    id: n,
                    register_num: r,
                    favourite_num: t.data.favor[0]
                });
            }
        });
    },
    phone_call: function() {
        var e = this;
        wx.makePhoneCall({
            phoneNumber: e.data.event.agent_phone,
            complete: function() {}
        });
    },
    phone_call1: function(e) {
        var t = this;
        wx.makePhoneCall({
            phoneNumber: t.data.booking[e.currentTarget.id].phone,
            complete: function() {}
        });
    },
    onShareAppMessage: function(e) {
        return console.log("SHARED"), "button" === e.from && console.log(e.target), {
            title: this.data.event.eventName,
            path: "/pages/index/detail_event/detail_event1?id=" + this.data.id + "&atype=1",
            success: function(e) {},
            fail: function(e) {}
        };
    },
    show_preview: function() {
        var e = this;
        wx.previewImage({
            urls: [ e.data.event.pic ]
        });
    },
    on_click_booking: function() {
        wx.navigateTo({
            url: "showmember?id=" + this.data.id
        });
    },
    on_click_rating: function() {
        var e = this;
        wx.navigateTo({
            url: "../../other/comment/comment?id=" + e.data.id + "&kind=event"
        });
    },
    on_click_cancel_btn: function() {
        var t = this;
        wx.showModal({
            content: "是否取消蜂约？",
            success: function(a) {
                a.confirm ? (wx.request({
                    url: e.globalData.mainURL + "api/cancelEvent",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        event_id: t.data.event.id
                    },
                    success: function(e) {}
                }), wx.redirectTo({
                    url: "../final_cancel/final_cancel?type=1",
                    success: function(e) {},
                    fail: function(e) {},
                    complete: function(e) {}
                })) : a.cancel;
            }
        });
    }
});