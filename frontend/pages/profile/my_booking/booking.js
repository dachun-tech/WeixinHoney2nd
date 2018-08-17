var t = getApp();

Page({
    data: {
        active1: "active",
        active2: "",
        active3: "",
        booking: [],
        selectedtab: 0,
        eventType: [],
        userRole: [],
        bookingState: [],
        register_num: []
    },
    onLoad: function(e) {
        this.setData({
            userInfo: t.globalData.userInfo,
            eventType: t.globalData.eventType,
            userRole: t.globalData.userRole,
            bookingState: t.globalData.eventState
        });
        var a = this;
        wx.request({
            url: t.globalData.mainURL + "api/getMyBooking",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id
            },
            success: function(t) {
                if (0 != t.data.status) {
                    console.log(t);
                    var e = t.data.result;
                    if (null != e) {
                        for (var i = 0; i < e.length; i++) {
                            if (Date.parse(e[i].start_time.replace(/-/g, "/")) - Date.now() < 216e5 ? e[i].isbtn = 0 : e[i].isbtn = 1, 
                            null == e[i].favor_state && (e[i].favor_state = 0, e[i].idshow = "0000000000", e[i].idshow = e[i].idshow.slice(0, 10 - e[i].id.length) + e[i].id), 
                            e[i].name.length > 12) {
                                var o = e[i].name;
                                o = o.slice(0, 12) + "..", e[i].name = o;
                            }
                            var n = e[i].start_time.split(":");
                            e[i].start_time = n[0] + ":" + n[1];
                            var s = e[i].end_time.split(":");
                            e[i].end_time = s[0] + ":" + s[1], a.data.booking = e, a.data.register_num = t.data.register_num;
                        }
                        a.showevent(0);
                    }
                }
            }
        });
    },
    showevent: function(t) {
        var e = this.data.booking, a = this.data.register_num;
        if (null != e) if (e.length < 2) this.setData({
            booking: e
        }); else {
            var i;
            if (console.log(e[0].start_time > e[1].start_time), 0 == t) for (o = 0; o < e.length - 1; o++) for (n = o + 1; n < e.length; n++) e[o].start_time < e[n].start_time && (i = e[o], 
            e[o] = e[n], e[n] = i, i = a[o], a[o] = a[n], a[n] = i);
            if (1 == t) for (var o = 0; o < e.length - 1; o++) for (var n = o + 1; n < e.length; n++) e[o].end_time < e[n].end_time && (i = e[o], 
            e[o] = e[n], e[n] = i, i = a[o], a[o] = a[n], a[n] = i);
            this.setData({
                booking: e,
                register_num: a
            });
        }
    },
    selectTab: function(t) {
        switch (this.setData({
            active1: " "
        }), this.setData({
            active2: " "
        }), this.setData({
            active3: " "
        }), t.currentTarget.id) {
          case "btn1":
            this.setData({
                active1: "active"
            }), this.setData({
                selectedtab: 0
            }), this.showevent(0);
            break;

          case "btn2":
            this.setData({
                active2: "active"
            }), this.setData({
                selectedtab: 1
            }), this.showevent(1);
            break;

          case "btn3":
            this.setData({
                active3: "active"
            }), this.setData({
                selectedtab: 2
            }), this.showevent(2);
        }
        console.log(this.data.register_num[0]);
    },
    btn_remove_booking: function(e) {
        var a = e.currentTarget.id, i = this;
        wx.showModal({
            content: "是否取消蜂约？",
            success: function(e) {
                if (e.confirm) if ("1" == i.data.booking[a].pay_type) {
                    var o = i.data.booking[a].cost * i.data.booking[a].reg_num, n = t.globalData.mch_id + Date.now();
                    wx.login({
                        success: function(e) {
                            e.code && (wx.request({
                                url: t.globalData.mainURL + "api/refund",
                                data: {
                                    id: wx.getStorageSync("openid"),
                                    fee: o,
                                    user_id: t.globalData.userInfo.user_id,
                                    out_trade_no: i.data.booking[a].out_trade_no,
                                    out_refund_no: n
                                },
                                method: "POST",
                                header: {
                                    "content-type": "application/json"
                                },
                                success: function(e) {
                                    wx.request({
                                        url: t.globalData.mainURL + "api/cancelBooking",
                                        method: "POST",
                                        header: {
                                            "content-type": "application/json"
                                        },
                                        data: {
                                            booking_id: i.data.booking[a].id,
                                            out_refund_no: n
                                        },
                                        success: function(t) {
                                            if (1 == t.data.status) {
                                                var e = i.data.booking;
                                                e[a].out_refund_no = n, e[a].state = 2, i.setData({
                                                    booking: e
                                                });
                                            }
                                        }
                                    });
                                }
                            }), i.onLoad());
                        }
                    });
                } else wx.request({
                    url: t.globalData.mainURL + "api/cancelBooking",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        booking_id: i.data.booking[a].id
                    },
                    success: function(t) {
                        if (1 == t.data.status) {
                            var e = i.data.booking;
                            e[a].out_refund_no = n, e[a].state = 2, i.setData({
                                booking: e
                            });
                        }
                    }
                }); else e.cancel;
            }
        });
    },
    click_detail_event: function(t) {
        wx.navigateTo({
            url: "booking_detail?id=" + t.currentTarget.id
        });
    },
    btn_write_comment: function(t) {
        wx.navigateTo({
            url: "../../other/evaluation/evaluation?id=" + t.currentTarget.id
        });
    }
});