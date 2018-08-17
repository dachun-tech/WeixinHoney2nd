var a, e = getApp();

new (require("../../lib/amap-wx.js").AMapWX)({
    key: "F8f1f5c8a20c199dd0f70f5a6b162280"
});

Page({
    data: {
        current_latitude: 0,
        current_longitude: 0,
        select_kind: 0,
        view_type: 0,
        select_able_type: "../../image/mapview_icon.png",
        item_array: [ {
            id: 0,
            src: "../../image/move00@2x.png"
        }, {
            id: 1,
            src: "../../image/move01@2x.png"
        }, {
            id: 2,
            src: "../../image/move02@2x.png"
        }, {
            id: 3,
            src: "../../image/move03@2x.png"
        }, {
            id: 4,
            src: "../../image/move04@2x.png"
        }, {
            id: 5,
            src: "../../image/move05@2x.png"
        }, {
            id: 6,
            src: "../../image/move06@2x.png"
        }, {
            id: 7,
            src: "../../image/move07@2x.png"
        }, {
            id: 8,
            src: "../../image/move08@2x.png"
        }, {
            id: 9,
            src: "../../image/move09@2x.png"
        }, {
            id: 10,
            src: "../../image/move10@2x.png"
        }, {
            id: 11,
            src: "../../image/move11@2x.png"
        }, {
            id: 12,
            src: "../../image/move12@2x.png"
        }, {
            id: 13,
            src: "../../image/move13@2x.png"
        }, {
            id: 14,
            src: "../../image/move14@2x.png"
        }, {
            id: 15,
            src: "../../image/move15@2x.png"
        }, {
            id: 16,
            src: "../../image/move16@2x.png"
        }, {
            id: 17,
            src: "../../image/move17@2x.png"
        }, {
            id: 18,
            src: "../../image/move18@2x.png"
        } ],
        show_array: [ {
            id: 0,
            src: "../../image/move00@2x.png"
        }, {
            id: 1,
            src: "../../image/move01@2x.png"
        }, {
            id: 2,
            src: "../../image/move02@2x.png"
        }, {
            id: 3,
            src: "../../image/move03@2x.png"
        }, {
            id: 4,
            src: "../../image/move04@2x.png"
        }, {
            id: 5,
            src: "../../image/move05@2x.png"
        }, {
            id: 6,
            src: "../../image/move06@2x.png"
        }, {
            id: 7,
            src: "../../image/move07@2x.png"
        }, {
            id: 8,
            src: "../../image/move08@2x.png"
        } ],
        uppoint: 0,
        downpoint: 8,
        currentkind: "../../image/move00@2x.png",
        marker: [],
        newscount: 0,
        events: [],
        currentid: 0,
        num: 0,
        flag: 100,
        file_paths: []
    },
    onLoad: function(e) {
        a = wx.createMapContext("mymap");
    },
    onShow: function(a) {
        this.data.num = 0, wx.showTabBar({}), 1 == e.globalData.userInfo.forbidden && wx.showModal({
            title: "您的账号已被禁用",
            showCancel: !1,
            complete: function() {
                wx.navigateBackMiniProgram({});
            }
        }), wx.setNavigationBarTitle({
            title: "蜂巢"
        }), wx.setNavigationBarColor({
          frontColor: '#ffffff',
          backgroundColor: '#e6b53c'
        }), (t = this).data.show_array = [ {
            id: 0,
            src: "../../image/move00@2x.png"
        }, {
            id: 1,
            src: "../../image/move01@2x.png"
        }, {
            id: 2,
            src: "../../image/move02@2x.png"
        }, {
            id: 3,
            src: "../../image/move03@2x.png"
        }, {
            id: 4,
            src: "../../image/move04@2x.png"
        }, {
            id: 5,
            src: "../../image/move05@2x.png"
        }, {
            id: 6,
            src: "../../image/move06@2x.png"
        }, {
            id: 7,
            src: "../../image/move07@2x.png"
        }, {
            id: 8,
            src: "../../image/move08@2x.png"
        }], t.data.select_kind = 0, t.data.uppoint = 0, t.data.downpoint = 8, t.data.currentkind = "../../image/move00@2x.png", 
        t.data.marker = [], t.data.newscount = 0, t.data.events = [], t.data.currentid = 0, 
        t.setData({
            show_array: t.data.show_array,
            currentkind: t.data.currentkind,
            currentid: 0,
            select_kind: t.data.select_kind,
            file_paths: e.globalData.file_paths
        }), wx.getLocation({
            type: "wgs84",
            success: function(a) {
                0 == e.globalData.issearch ? (t.data.current_latitude = a.latitude, t.data.current_longitude = a.longitude) : (t.data.current_latitude = e.globalData.searchlat, 
                t.data.current_longitude = e.globalData.searchlong, e.globalData.issearch = 0), 
                t.setData({
                    current_latitude: t.data.current_latitude,
                    current_longitude: t.data.current_longitude
                }), wx.request({
                    url: e.globalData.mainURL + "api/getItemsOnMap",
                    data: {
                        latitude: t.data.current_latitude,
                        longitude: t.data.current_longitude
                    },
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    success: function(a) {
                        a.data.status && (t.data.events = a.data.event, wx.getSystemInfo({
                            success: function(e) {
                                var i = 0, n = 0;
                                "iPhone" == e.brand && (i = -50, n = 20);
                                var o;
                                for (o = 0; o < a.data.honey.length; o++) {
                                    var r = a.data.honey[o].amount + "ml", s = "h" + a.data.honey[o].no;
                                    t.data.marker[o] = {
                                        iconPath: "../../image/honey.png",
                                        id: s,
                                        latitude: 1 * a.data.honey[o].latitude,
                                        longitude: 1 * a.data.honey[o].longitude,
                                        width: 100 / 750 * e.screenWidth,
                                        height: 50 / 1344 * e.screenHeight,
                                        anchor: {
                                            x: 0,
                                            y: 1
                                        },
                                        kind: "honey",
                                        label: {
                                            content: r,
                                            color: "#000000",
                                            fontSize: 20 / 750 * e.screenWidth,
                                            bgColor: "#e6b53c",
                                            padding: .004 * e.screenWidth,
                                            borderWidth: 1 / 750 * e.screenWidth,
                                            borderColor: "#000000",
                                            borderRadius: .004 * e.screenWidth,
                                            x: (35 + i) / 750 * e.screenWidth,
                                            y: (-36 + n) / 1344 * e.screenHeight
                                        }
                                    };
                                }
                                if (o == a.data.honey.length) {
                                    var d = a.data.site;
                                    o = 0;
                                    for (var l = 0; l < d.length; l++) t.data.marker.push({
                                        iconPath: "/image/" + (1 * d[l].site_type + 1) + ".png",
                                        id: "o" + d[l].boss_id,
                                        latitude: 1 * d[l].latitude,
                                        longitude: 1 * d[l].longitude,
                                        width: .092 * e.screenWidth,
                                        height: 73 / 1344 * e.screenHeight,
                                        kind: "site"
                                    });
                                    t.show_marker();
                                }
                            }
                        }));
                    }
                });
            },
            fail: function(a) {}
        });
        var t = this;
        wx.request({
            url: e.globalData.mainURL + "api/getNewAlarm",
            data: {
                user_id: e.globalData.userInfo.user_id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {
                a.data.status && t.setData({
                    newscount: 1 * a.data.news[0].amount
                });
            }
        }), e.checkDate();
    },
    sleep: function(a) {
        for (var e = new Date().getTime(), t = 0; t < 1e7 && !(new Date().getTime() - e > a); t++) ;
    },
    download_honey: function(a, e, t, i, n) {
        setTimeout(function() {
            console.log(t);
        }, 1e3);
    },
    getUserinfo: function(a) {
        console.log(a), e.globalData.userInfo.nickname = a.detail.userInfo.nickName, e.globalData.userInfo.avatar = a.detail.userInfo.avatarUrl;
        
    },
    show_marker: function() {
        var a = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0;
        arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        setTimeout(function() {
            wx.hideLoading();
        }, 2e3);
        var e = new Array();
        if (0 == a) this.setData({
            markers: this.data.marker
        }); else {
            for (var t = 0; t < this.data.marker.length; t++) if ("honey" == this.data.marker[t].kind) e.push(this.data.marker[t]); else if ("site" == this.data.marker[t].kind) {
                if (0 == a) {
                    e.push(this.data.marker[t]);
                    continue;
                }
                var i = this.data.marker[t].iconPath.split("/"), n = i[i.length - 1].split(".");
                if (console.log(n), a == 1 * n[0]) {
                    e.push(this.data.marker[t]);
                    continue;
                }
            }
            console.log(e), this.setData({
                markers: e
            });
        }
    },
    on_Click_maker: function(a) {
        if ("h" == a.markerId[0]) {
            for (var t = e.globalData.userInfo.isVIP + 1, i = 0; i < this.data.marker.length && this.data.marker[i].id != a.markerId; i++) ;
            var n = [ this.data.marker[i] ], o = n[0].label.content;
            o = 1 * o.slice(0, o.length - 2);
            var r = this.distance(n[0].latitude, n[0].longitude, this.data.current_latitude, this.data.current_longitude), s = 0, d = 0;
            "" == e.globalData.user_step && (e.globalData.user_step = 0);
            var l = e.globalData.user_step / 2 * t;
            if (console.log("------markersin =  ------" + l), "" == e.globalData.daily_honey && (e.globalData.daily_honey = [ 0, 0 ]), 
            !(r < l)) return void wx.showToast({
                title: "距离不够，无法采集",
                icon: "none",
                duration: 2e3
            });
            var c = 1 + Math.ceil(Math.random() * (1 * e.globalData.rule[5].value - e.globalData.daily_honey[0]) - 1), g = Math.ceil(parseInt(o) * (.1 + .4 * Math.random()));
            if (g < c && (c = g), c < 3 ? (s = 1, d = o) : (o -= c, d = c), e.globalData.daily_honey[0] >= e.globalData.rule[5].value) return void wx.showToast({
                title: "您今天已经收获了" + e.globalData.rule[5].value + "ml蜂蜜，明天再来哦",
                icon: "none",
                duration: 1e3
            });
            if (0 == e.globalData.isactivetime) return void wx.showToast({
                title: "从早上7点开始可以收集蜂蜜",
                icon: "none",
                duration: 2e3
            });
            var u = e.globalData.todayselected;
            "" == u && (u = []);
            for (i = 0; i < u.length; i++) if (u[i] == a.markerId) return void wx.showToast({
                title: "您已经采集过了",
                icon: "none",
                duration: 2e3
            });
            var h = e.globalData.honey_info;
            e.globalData.daily_honey[0] += d, h.total_honey = 1 * h.total_honey + d;
            var m = h.total_honey;
            e.globalData.honey_info = h, u.push(a.markerId), e.globalData.todayselected = u;
            v = a.markerId.slice(1, a.markerId.length);
            e.globalData.honey_info = h, console.log(d);
            var p = "成功收取" + d + "ml蜂蜜";
            wx.showToast({
                title: p,
                duration: 2e3,
                icon: "none"
            }), wx.request({
                url: e.globalData.mainURL + "api/catchHoney",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    amount: m,
                    no: v,
                    user_id: e.globalData.userInfo.user_id,
                    honey: d
                },
                success: function(a) {}
            }), 0 == s && (n[0].label.content = o + "ml", this.data.marker.push(n[0])), this.setData({
                markers: this.data.marker
            });
        } else if ("o" == a.markerId[0]) {
            var v = a.markerId.slice(1, a.markerId.length);
            wx.navigateTo({
                url: "detail_gym/detail_gym?id=" + v
            });
        }
    },
    distance: function(a, e, t, i) {
        var n = .017453292519943295, o = Math.cos, r = .5 - o((t - a) * n) / 2 + o(a * n) * o(t * n) * (1 - o((i - e) * n)) / 2;
        return 12742e3 * Math.asin(Math.sqrt(r));
    },
    on_click_down: function(a) {
        this.data.downpoint < 18 && (this.data.show_array.shift(), this.data.downpoint++, 
        this.data.uppoint++, this.data.show_array.push(this.data.item_array[this.data.downpoint]), 
        this.setData({
            show_array: this.data.show_array
        }));
    },
    on_click_up: function(a) {
        this.data.uppoint > 0 && (this.data.show_array.pop(), this.data.downpoint--, this.data.uppoint--, 
        this.data.show_array.unshift(this.data.item_array[this.data.uppoint]), this.setData({
            show_array: this.data.show_array
        }));
    },
    on_selectkind: function(a) {
        this.setData({
            currentkind: this.data.item_array[a.currentTarget.id].src,
            select_kind: 0,
            currentid: 1 * a.currentTarget.id
        }), console.log(a.currentTarget.id), this.show_marker(1 * a.currentTarget.id);
    },
    on_click_select_menu: function() {
        this.setData({
            select_kind: 1
        });
    },
    on_click_search: function () {
      wx.navigateTo({
        url: "search/search"
      });
    },
    on_click_viewstyle: function () {
      if (this.data.view_type == 0)
      {
        this.setData({
          view_type: 1,
          select_able_type: "../../image/tableview_icon.png",
        });
      }else{
        this.setData({
          view_type: 0,
          select_able_type: "../../image/mapview_icon.png",
        });
      }     
    },
    on_click_create_event: function() {
        wx.request({
            url: e.globalData.mainURL + "api/getUserState",
            method: "post",
            data: {
                nickname: e.globalData.userInfo.nickname
            },
            success: function(a) {
                e.globalData.userInfo.state = a.data.result[0].state, 0 != e.globalData.userInfo.state ? 3 != e.globalData.userInfo.state ? 1 != e.globalData.userInfo.state ? wx.navigateTo({
                    url: "../other/create_event/create_event"
                }) : wx.showModal({
                    title: "提示",
                    content: "您的认证资料已提交，请等待审核通过",
                    showCancel: !1
                }) : wx.showModal({
                    title: "提示",
                    content: "您的身份认证审核未通过，请重新提交",
                    success: function(a) {
                        a.confirm ? wx.navigateTo({
                            url: "../profile/auth/auth"
                        }) : a.cancel;
                    }
                }) : wx.showModal({
                    title: "提示",
                    content: "请先进行身份认证",
                    success: function(a) {
                        a.confirm ? wx.navigateTo({
                            url: "../profile/auth/auth"
                        }) : a.cancel;
                    }
                });
            }
        });
    },
    on_click_news: function() {
        wx.navigateTo({
            url: "news/news"
        });
    },
    onGotUserInfo: function (e) {
      console.log(e.detail.errMsg)
      console.log(e.detail.userInfo)
      console.log(e.detail.rawData)
    }
});