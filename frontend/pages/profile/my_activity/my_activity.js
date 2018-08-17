var t = getApp();

Page({
    data: {
        active1: "active",
        active2: "",
        active3: "",
        bookingArray: new Array(),
        selectedtab: "booked",
        events: [],
        selected_state: 0,
        userInfo: [],
        eventType: [],
        userRole: [],
        eventState: []
    },
    onLoad: function(e) {
        this.setData({
            userInfo: t.globalData.userInfo,
            eventType: t.globalData.eventType,
            userRole: t.globalData.userRole,
            eventState: t.globalData.eventState
        });
        var a = this;
        wx.request({
            url: t.globalData.mainURL + "api/getAllEvents",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id
            },
            success: function(e) {
                var n = e.data.result;
                if (console.log(e), null != n) {
                    for (var s = 0; s < n.length; s++) {
                        Date.parse(n[s].start_time.replace(/-/g, "/")) - Date.now() < 216e5 ? n[s].isbtn = 0 : n[s].isbtn = 1, 
                        n[s].avatar = t.globalData.uploadURL + n[s].pic;
                        var i = n[s].start_time.split(":");
                        n[s].start_time = i[0] + ":" + i[1];
                        var r = n[s].end_time.split(":");
                        if (n[s].end_time = r[0] + ":" + r[1], null == n[s].register_num && (n[s].register_num = 0), 
                        n[s].name.length > 10) {
                            var o = n[s].name;
                            o = o.slice(0, 10) + "..", n[s].name = o;
                        }
                        a.data.events = n;
                    }
                    a.showarray(0);
                }
            }
        });
    },
    showarray: function() {
        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0, e = this.data.events;
        if (null != e) if (e.length < 2) this.setData({
            events: e
        }); else {
            var a;
            if (0 == t) for (n = 0; n < e.length - 1; n++) for (s = n + 1; s < e.length; s++) e[n].start_time < e[s].start_time && (a = e[n], 
            e[n] = e[s], e[s] = a);
            if (1 == t) for (var n = 0; n < e.length - 1; n++) for (var s = n + 1; s > e.length; s++) e[n].end_time < e[s].end_time && (a = e[n], 
            e[n] = e[s], e[s] = a);
            this.setData({
                events: e
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
                selected_state: 0
            }), this.showarray(0);
            break;

          case "btn2":
            this.setData({
                active2: "active"
            }), this.setData({
                selected_state: 1
            }), this.showarray(1);
            break;

          case "btn3":
            this.setData({
                active3: "active"
            }), this.setData({
                selected_state: 2
            }), this.showarray(2);
        }
    },
    btn_remove_booking: function(e) {
        var a = e.target.id, n = this;
        wx.showModal({
            content: "是否取消活动？",
            success: function(e) {
                if (e.confirm) {
                    var s = Date.now();
                    if (Date.parse(n.data.events[a].start_time.replace(/-/g, "/")) - s < 86400) return void wx.showToast({
                        title: "现在距离活动开始时间已不到24小时，无法取消活动",
                        icon: "none",
                        time: 3e3
                    });
                    wx.request({
                        url: t.globalData.mainURL + "api/cancelEvent",
                        method: "POST",
                        header: {
                            "content-type": "application/json"
                        },
                        data: {
                            event_id: n.data.events[a].id
                        },
                        success: function(t) {
                            var e = n.data.events;
                            e[a].state = 2, n.setData({
                                events: e
                            }), wx.redirectTo({
                                url: "../final_cancel/final_cancel?type=1",
                                success: function(t) {},
                                fail: function(t) {},
                                complete: function(t) {}
                            });
                        }
                    });
                } else e.cancel;
            }
        });
    },
    click_detail_event: function(t) {
        wx.navigateTo({
            url: "eventdetail?id=" + t.currentTarget.id
        });
    },
    btn_write_comment: function(t) {
        wx.navigateTo({
            url: "../../evaluation/evaluation"
        });
    }
});