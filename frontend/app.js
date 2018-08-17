var a = require("./utils/RdWXBizDataCrypt.js");

App({
    globalData: {
        appid: "wxea381fb0ca7c2a24",
        secret: "fengtiWeixin17642518820android12",
        mch_id: "1500220062",
        userInfo: {
            nickname: "WeiXin",
            avatar: "",
            user_id: 0,
            name: "",
            phone: "",
            honey: 0,
            state: 0,
            forbidden: 0,
            isVIP: 0,
            eventData: {
                ground_image: "",
                act_type: "",
                act_status: "",
                favourite: 0,
                act_name: "",
                member_count: 0,
                cost: 0,
                act_date: " ",
                address: "",
                ground_name: "",
                ground_owner: "",
                max_member: 0,
                act_intro: ""
            }
        },
        address: [],
        productState: [ "待发货", "待收货", "交易成功" ],
        eventState: [ "进行中", "已完成", "已取消" ],
        userRole: [ "无", "场馆主", "个人" ],
        eventType: [ "足球", "篮球", "排球", "羽毛球", "乒乓球", "台球", "网球", "保龄球", "健身馆", "瑜伽", "游泳", "射击射箭", "跆拳道", "休闲桌游", "滑冰", "滑雪", "运动装备", "其他" ],
        memberState: [ "使用中", "已过期" ],
        exchangeState: [ "待发货", "待收货", "交易成功" ],
        bindingState: [ "提现中", "提现成功", "提现失败" ],
        //mainURL: "http://192.168.2.6/backend/",
        //smsURL: "http://192.168.2.6/sms/SendTemplateSMS.php",
        uploadURL: "https://www.fengteam.cn/backend_test/uploads/",
        mainURL: "https://www.fengteam.cn/backend_test/",
        smsURL: "https://www.fengteam.cn/sms/SendTemplateSMS.php",
        // uploadURL: "https://www.fengteam.cn/backend/uploads/",
        honey_info: {
            total_honey: 0,
            honeybox_array: []
        },
        daily_honey: [ 0, 0 ],
        todayfirst: 0,
        openid: "",
        session_key: "",
        user_step: 0,
        last_step: 0,
        isactivetime: 1,
        rule: "",
        step: 0,
        laststep: 0,
        see_news: 0,
        have_stadium: 0,
        issearch: 0,
        searchlat: 0,
        searchlong: 0,
        ischooseimage: 0,
        iscreatepage: 0,
        nickname_buf: "",
        map_idx: 0,
        file_paths: []
    },
    onLaunch: function() {
        wx.setTabBarStyle({
            color: "#888888",
            selectedColor: "#472E00",
            backgroundColor: "#ffffff"
        }), wx.setNavigationBarColor({
            frontColor: "#000000",
            backgroundColor: "#ffffff"
        }), wx.showLoading({
            title: "加载中"
        }), setTimeout(function() {
            wx.hideLoading();
        }, 3e3);
        var e = this;
        e.globalData.todayfirst = new Date().getDate(), wx.request({
            url: e.globalData.mainURL + "api/getRules",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {
                e.globalData.rule = a.data.rule;
            }
        }), wx.login({
            success: function(t) {
                e.globalData.user_code = t.code, wx.request({
                    url: e.globalData.mainURL + "api/getopenid",
                    data: {
                        code: e.globalData.user_code
                    },
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    success: function(t) {
                        var o = {};
                        wx.setStorageSync('openid', t.data.openid);
                        o.openid = t.data.openid, console.log(o.openid), o.expires_in = Date.now() + t.data.expires_in, 
                        e.globalData.openid = t.data.openid, e.globalData.session_key = t.data.session_key, 
                        wx.getSetting({
                            success: function(t) {
                                1 != t.authSetting["scope.werun"] && wx.authorize({
                                    scope: "scope.werun"
                                }), wx.getWeRunData({
                                    success: function(t) {
                                        var o = t.encryptedData, n = t.iv, s = new a(e.globalData.appid, e.globalData.session_key).decryptData(o, n);
                                        e.globalData.user_step = 1 * s.stepInfoList.pop().step, e.globalData.last_step = 1 * s.stepInfoList.pop().step;
                                    }
                                });
                            }
                        }), wx.getUserInfo({
                            success: function(a) {
                                var t = e.globalData.userInfo;
                                t.nickname = a.userInfo.nickName, e.globalData.nickname = t.nickname, t.avatar = a.userInfo.avatarUrl, 
                                wx.request({
                                    url: e.globalData.mainURL + "api/getUserStateByOpenId",
                                    data: {
                                        open_id: o.openid
                                    },
                                    method: "POST",
                                    header: {
                                        "content-type": "application/json"
                                    },
                                    success: function(a) {
                                        if (0 == a.data.status) {
                                            var t = new Date();
                                            e.globalData.todayfirst = t.getDate(), e.globalData.todayselected = [], e.globalData.honey_info = {
                                                total_honey: 0,
                                                honeybox_array: []
                                            }, e.globalData.daily_honey = [ 0, 0 ], e.globalData.favorinputtext = [], wx.setStorageSync("have_stadium", 0), 
                                            wx.setStorageSync("isfirstcreate", 1), setTimeout(function() {
                                                e.onLaunch();
                                            }, 2e3), wx.request({
                                                method: "POST",
                                                header: {
                                                    "content-type": "application/json"
                                                },
                                                url: e.globalData.mainURL + "api/addNewUser",
                                                data: {
                                                    nickname: e.globalData.userInfo.nickname,
                                                    avatar: e.globalData.userInfo.avatar,
                                                    open_id: o.openid
                                                },
                                                success: function(a) {}
                                            });
                                        } else {
                                            console.log(a.data.result[0].daily_honey), "" != a.data.result[0].daily_honey ? e.globalData.daily_honey = JSON.parse(a.data.result[0].daily_honey) : e.globalData.daily_honey = [ 0, 0 ], 
                                            e.globalData.todayfirst = a.data.result[0].todayfirst, e.globalData.have_stadium = wx.getStorageSync("have_stadium"), 
                                            void 0 == e.globalData.honey_info.honeybox_array && (e.globalData.honey_info = {
                                                total_honey: 0,
                                                honeybox_array: []
                                            });
                                            var n = new Date();
                                            a.data.result[0].todayfirst, n.getDate(), e.globalData.honey_info.total_honey = 1 * a.data.result[0].honey;
                                            var s = e.globalData.userInfo;
                                            1 == a.data.result[0].forbidden && wx.showModal({
                                                title: "您的账号已被禁用",
                                                showCancel: !1,
                                                complete: function() {
                                                    wx.navigateBackMiniProgram({});
                                                }
                                            }), s.user_id = a.data.result[0].no, s.phone = a.data.result[0].phone, s.state = a.data.result[0].state, 
                                            s.forbidden = a.data.result[0].forbidden, s.honey = a.data.result[0].honey, s.role = a.data.result[0].role, 
                                            1 == s.role && wx.request({
                                                url: e.globalData.mainURL + "api/haveStadium",
                                                method: "POST",
                                                header: {
                                                    "content-type": "application/json"
                                                },
                                                data: {
                                                    user_id: s.user_id
                                                },
                                                success: function(a) {
                                                    "" != a.data.result[0].site_introduction && wx.setStorageSync("have_stadium", 1);
                                                }
                                            }), 1 * s.state != 2 && (s.name = e.globalData.userInfo.nickname), "" == s.avatar && (s.avatar = "/image/user-unlogin.png"), 
                                            null == a.data.member[0].state && (s.isVIP = 0), 1 == a.data.member[0].state && (s.isVIP = 1), 
                                            e.globalData.userInfo = s;
                                            var i = new Date();
                                            i.getHours() >= 0 && i.getHours() < 7 ? e.globalData.isactivetime = 0 : e.globalData.isactivetime = 1;
                                        }
                                        setInterval(e.checkDate, 1e3);
                                    },
                                    fail: function() {}
                                });
                            }
                        });
                    }
                });
            }
        }), this.globalData.userInfo.nickname = this.globalData.nickname;
    },
    showHint: function() {
        wx.showModal({
            title: "提示",
            content: "开启微信计步权限，有机会获取蜂蜜哦",
            success: function(a) {
                a.confirm && wx.openSetting({});
            }
        });
    },
    checkDate: function() {
        var e = this, t = new Date(), o = e.globalData.todayfirst;
        if (t.getHours() < 7 && (this.globalData.isactivetime = 0), t.getHours() >= 7) {
            this.globalData.isactivetime = 1, o != t.getDate() && "" != o && (console.log(o), 
            e.globalData.todayfirst = t.getDate(), e.globalData.todayselected = [], wx.login({
                success: function(t) {
                    wx.request({
                        url: e.globalData.mainURL + "api/getopenid",
                        data: {
                            code: t.code
                        },
                        method: "POST",
                        header: {
                            "content-type": "application/json"
                        },
                        success: function(t) {
                            var o = {};
                            o.openid = t.data.openid, o.expires_in = Date.now() + t.data.expires_in, e.globalData.session_key = t.data.session_key, 
                            wx.getSetting({
                                success: function(t) {
                                    1 != t.authSetting["scope.werun"] && wx.authorize({
                                        scope: "scope.werun"
                                    }), wx.getWeRunData({
                                        success: function(t) {
                                            var o = t.encryptedData, n = t.iv, s = new a(e.globalData.appid, e.globalData.session_key).decryptData(o, n);
                                            e.globalData.step = 1 * s.stepInfoList.pop().step, e.globalData.laststep = 1 * s.stepInfoList.pop().step, 
                                            console.log(e.globalData.laststep);
                                            new Date();
                                            var i = new Date();
                                            e.globalData.daily_honey = [ 0, 0 ];
                                            var l = 1 * e.globalData.laststep * (1 * e.globalData.rule[3].value);
                                            l = 1 * Math.floor(l), wx.request({
                                                url: e.globalData.mainURL + "api/setTodayFirst",
                                                method: "POST",
                                                header: {
                                                    "content-type": "application/json"
                                                },
                                                data: {
                                                    todayfirst: i.getDate(),
                                                    user_id: e.globalData.userInfo.user_id,
                                                    honey: l
                                                },
                                                success: function() {
                                                    console.log("success");
                                                }
                                            });
                                        },
                                        fail: function(a) {}
                                    });
                                }
                            });
                        }
                    });
                }
            }));
        }
        for (var n = 0; n < this.globalData.honey_info.honeybox_array.length; n++) Date.now() - this.globalData.honey_info.honeybox_array[n].start_time > 1728e5 && this.globalData.honey_info.honeybox_array.splice(n, 1);
    }
});