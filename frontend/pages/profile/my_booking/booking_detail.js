var a = getApp();

Page({
    data: {
        img_black_start_src: "../../../image/star_n@2x.png",
        img_yellow_start_src: "../../../image/star_s@2x.png",
        count_yellowStar: 3,
        booking: [],
        eventType: [],
        userRole: [],
        bookingState: [],
        register_num: 0,
        bookingcanceltime: 1
    },
    onLoad: function(e) {
        this.setData({
            eventType: a.globalData.eventType,
            userRole: a.globalData.userRole,
            bookingState: a.globalData.eventState
        });
        var t = this, o = e.id;
        wx.request({
            url: a.globalData.mainURL + "api/getBookingDetail",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                booking_id: o,
                user_id: a.globalData.userInfo.user_id
            },
            success: function(a) {
                console.log(a);
                var e = a.data.result[0];
                if (null != e) {
                    e.idshow = "0000000000", e.idshow = e.idshow.slice(0, 10 - e.id.length) + e.id;
                    var o = e.start_time.split(":"), n = a.data.register_num[0].register_num;
                    null == n && (n = 0), e.start_time = o[0] + ":" + o[1], o = e.end_time.split(":"), 
                    e.end_time = o[0] + ":" + o[1];
                    var i = Date.now(), s = e.start_time;
                    if (Date.parse(s.replace(/-/g, "/")) - i < 216e5 && t.setData({
                        bookingcanceltime: 0
                    }), e.name.length > 12) {
                        var l = e.name;
                        l = l.slice(0, 12) + "..", e.name = l;
                    }
                    t.setData({
                        booking: e,
                        rating: a.data.rating,
                        register_num: n
                    }), console.log(e.cost * e.reg_num);
                }
            }
        });
    },
    phone_call: function() {
        var a = this;
        wx.makePhoneCall({
            phoneNumber: a.data.booking.agent_phone,
            complete: function() {}
        });
    },
    final_cancel: function() {
        var e = this;
        wx.showModal({
            content: "是否取消蜂约？",
            success: function(t) {
                if (t.confirm) if ("1" == e.data.booking.pay_type) {
                    var o = e.data.booking.cost * e.data.booking.reg_num, n = a.globalData.mch_id + Date.now();
                    wx.login({
                        success: function(t) {
                            t.code && wx.request({
                                url: a.globalData.mainURL + "api/refund",
                                data: {
                                    id: wx.getStorageSync("openid"),
                                    fee: o,
                                    user_id: a.globalData.userInfo.user_id,
                                    out_trade_no: e.data.booking.out_trade_no,
                                    out_refund_no: n
                                },
                                method: "POST",
                                header: {
                                    "content-type": "application/json"
                                },
                                success: function(t) {
                                    wx.request({
                                        url: a.globalData.mainURL + "api/cancelBooking",
                                        method: "POST",
                                        header: {
                                            "content-type": "application/json"
                                        },
                                        data: {
                                            booking_id: e.data.booking.id,
                                            out_refund_no: n
                                        },
                                        success: function(a) {
                                            1 == a.data.status && wx.navigateTo({
                                                url: "./booking"
                                            });
                                        }
                                    });
                                }
                            });
                        }
                    });
                } else wx.request({
                    url: a.globalData.mainURL + "api/cancelBooking",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        booking_id: e.data.booking.id
                    },
                    success: function(a) {
                        wx.navigateTo({
                            url: "./booking"
                        });
                    }
                }); else t.cancel;
            }
        });
    },
    btn_write_comment: function(a) {
        wx.navigateTo({
            url: "../../other/evaluation/evaluation?id=" + a.currentTarget.id
        });
    }
});