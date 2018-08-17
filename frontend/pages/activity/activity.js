var t = getApp();

Page({
    data: {
        sport_kind_text: [ "足球", "篮球", "排球", "羽毛球", "乒乓球", "台球", "网球", "保龄球", "健身馆", "瑜伽", "游泳", "射击射箭", "跆拳道", "滑冰", "滑雪", "休闲桌游", "运动装备", "其他" ],
        active1: "active",
        active2: "",
        modal_active1: "active",
        modal_active2: "",
        showModal: 0,
        events: [],
        selected_state: 0,
        userInfo: [],
        eventType: [],
        userRole: [],
        eventState: [],
        favor: [],
        select_tab: 0,
        filter_role: 1,
        filter_type: 0,
        select_type: 0,
        select_role: 1,
        select_start: "",
        select_end: "",
        starttime: "开始时间",
        endtime: "结束时间",
        isfilterset: 0
    },
    onLoad: function() {},
    onShow: function() {
        var e = this;
        e.data.active1 = "active", e.data.active2 = "", e.data.modal_active1 = "active", 
        e.data.modal_active2 = "", e.data.showModal = 0, e.data.select_tab = 0, e.data.filter_role = 1, 
        e.data.filter_type = 0, e.data.select_type = 0, e.data.select_role = 1, e.data.select_start = "", 
        e.data.select_end = "", e.data.starttime = "开始时间", e.data.endtime = "结束时间", e.data.isfilterset = 0, 
        e.data.selected_state = 0, this.setData({
            active1: e.data.active1,
            active2: e.data.active2,
            modal_active1: e.data.modal_active1,
            modal_active2: e.data.modal_active2,
            showModal: e.data.showModal,
            select_tab: e.data.select_tab,
            filter_role: e.data.filter_role,
            filter_type: e.data.filter_type,
            select_type: e.data.select_type,
            select_role: e.data.select_role,
            select_start: e.data.select_start,
            select_end: e.data.select_end,
            starttime: e.data.starttime,
            endtime: e.data.endtime,
            isfilterset: e.data.isfilterset,
            selected_state: e.data.selected_state
        }), wx.getLocation({
            success: function(a) {
                var i = "https://restapi.amap.com/v3/geocode/regeo?key=8eb63e36d0b6d7d29a392503a4a80f6c&location=" + a.longitude + "," + a.latitude + "&poitype=&radius=&extensions=all&batch=false&roadlevel=0";
                wx.request({
                    url: i,
                    success: function(a) {
                        var i = a.data.regeocode.addressComponent.city, s = a.data.regeocode.addressComponent.province;
                        console.log(a), wx.request({
                            url: t.globalData.mainURL + "api/getEventsByProvince",
                            method: "POST",
                            header: {
                                "content-type": "application/json"
                            },
                            data: {
                                city: i,
                                province: s,
                                user_id: t.globalData.userInfo.user_id
                            },
                            success: function(a) {
                                console.log(a);
                                var i = a.data.result;
                                if (null != i) {
                                    for (var s = 0; s < i.length; s++) {
                                        var l = i[s].start_time.split(":");
                                        i[s].start_time = l[0] + ":" + l[1], l = i[s].end_time.split(":"), i[s].end_time = l[0] + ":" + l[1];
                                        var o = i[s].start_time.split(" ");
                                        if (i[s].start_time_now = Date.parse(o[0].replace(/-/g, "/")), i[s].end_time_now = Date.parse(i[s].end_time.replace(/-/g, "/")), 
                                        null == i[s].current_member && (i[s].current_member = 0), i[s].name.length > 10) {
                                            var c = i[s].name;
                                            c = c.slice(0, 10) + "..", i[s].name = c;
                                        }
                                    }
                                    e.setData({
                                        events: i,
                                        favor: a.data.favor,
                                        userInfo: t.globalData.userInfo,
                                        eventType: t.globalData.eventType,
                                        userRole: t.globalData.userRole,
                                        eventState: t.globalData.eventState
                                    });
                                }
                            }
                        });
                    }
                });
            }
        }), t.checkDate();
    },
    On_click_favourite: function(t) {},
    On_click_modal_open: function(t) {
        this.data.showModal = 1, wx.hideTabBar({}), this.setData({
            showModal: this.data.showModal
        });
    },
    selectTab: function(t) {
        "tab-btn1" == t.currentTarget.id & "" == this.data.active1 && (this.setData({
            active1: "active",
            active2: ""
        }), this.setData({
            select_tab: 0,
            isfilterset: 0
        })), "tab-btn2" == t.currentTarget.id & "" == this.data.active2 && (this.setData({
            active1: "",
            active2: "active"
        }), this.setData({
            select_tab: 1,
            isfilterset: 0
        }));
    },
    On_click_hide: function() {
        this.data.showModal = 0, wx.showTabBar({}), this.setData({
            showModal: 0
        });
    },
    click_detail_event: function(t) {
        wx.navigateTo({
            url: "../index/detail_event/detail_event?id=" + t.currentTarget.id
        });
    },
    click_cancel: function() {
        this.setData({
            isfilterset: 0
        }), this.hideModal();
    },
    hideModal: function() {
        this.data.showModal = 0, wx.showTabBar({
            animation: !1
        }), this.setData({
            showModal: 0
        });
    },
    on_click_role: function(t) {
        2 == t.currentTarget.id ? this.setData({
            modal_active1: "",
            modal_active2: "active",
            filter_role: 2
        }) : this.setData({
            modal_active1: "active",
            modal_active2: "",
            filter_role: 1
        });
    },
    on_click_type: function(t) {
        var e = t.currentTarget.id;
        this.setData({
            filter_type: e
        });
    },
    change_filter: function() {
        var t = 0, e = 0;
        t = "开始时间" == this.data.starttime ? Date.parse("2000-01-01") : Date.parse(this.data.starttime.replace(/-/g, "/")), 
        console.log(this.data.starttime), console.log(t), e = "结束时间" == this.data.endtime ? Date.parse("2100-01-01") : Date.parse(this.data.endtime.replace(/-/g, "/")) + 864e5, 
        console.log(this.data.endtime), console.log(e), console.log(Date.parse("2018-05-13")), 
        this.setData({
            select_type: this.data.filter_type.toString(),
            select_role: this.data.filter_role.toString(),
            select_start: t,
            select_end: e,
            isfilterset: 1
        }), this.hideModal();
    },
    starttime_picker: function(t) {
        this.setData({
            starttime: t.detail.value
        });
    },
    endtime_picker: function(t) {
        this.setData({
            endtime: t.detail.value
        });
    }
});