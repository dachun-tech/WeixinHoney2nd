function a(a, t, e) {
    return t in a ? Object.defineProperty(a, t, {
        value: e,
        enumerable: !0,
        configurable: !0,
        writable: !0
    }) : a[t] = e, a;
}

var t, e = require("../../../utils/datetimePicker.js"), i = getApp();

Page({
    data: (t = {
        member_state: 0,
        role: 1,
        publicity: 1,
        event: {
            name: "",
            kind: 20,
            agent_name: "",
            agent_phone: "",
            start_time: "",
            end_time: "",
            address4: "",
            limit: "",
            cost: 0,
            event_pic: "../../../image/fengm@2x.png",
            comment: "",
            publicity: 1,
            additional: 1,
            showModal1: !1,
            showModal2: !1,
            textareastr: "",
            placestr: "请输入活动简介，不超过500字"
        },
        eventpic: "../../../image/fengm@2x.png",
        date: "2018-10-01",
        time: "12:00",
        dateTimeArray: null,
        dateTime: null,
        dateTimeArray1: null,
        dateTime1: null,
        startYear: 2e3,
        endYear: 2050,
        eventType: [],
        overimagecount: 0,
        longitude: 0,
        latitude: 0,
        province: [],
        city: [],
        area: [],
        select_province: 0,
        select_city: 0,
        select_area: 0
    }, a(t, "role", 1), a(t, "open", !1), a(t, "city_id", 0), a(t, "province_id", 0), 
    a(t, "area_id", 0), a(t, "province_name", ""), a(t, "city_name", ""), a(t, "area_name", ""), 
    a(t, "province_id", 0), a(t, "area_id", 0), a(t, "city_id", 0), a(t, "select_position_text", ""), 
    a(t, "showdetailaddress", 1), a(t, "isvip", 0), a(t, "lawstr", ""), a(t, "isfirstbtn", 0), 
    a(t, "is_cross", 0), a(t, "flag", 0), t),
    onLoad: function(a) {
        this.setData({
            textareastr: ""
        });
        var t = this;
        this.setData({
            placestr: "请输入活动简介，不超过500字"
        });
        var n = e.dateTimePicker(this.data.startYear, this.data.endYear), o = e.dateTimePicker(this.data.startYear, this.data.endYear);
        o.dateTimeArray.pop(), o.dateTime.pop();
        wx.request({
            url: i.globalData.mainURL + "api/getRules",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {
                console.log(a), i.globalData.rule = a.data.rule, console.log(i.globalData.rule);
            }
        }), console.log(i.globalData.rule), this.setData({
            dateTime: n.dateTime,
            dateTimeArray: n.dateTimeArray,
            dateTimeArray1: o.dateTimeArray,
            dateTime1: o.dateTime,
            honey: i.globalData.rule[8].value
        }), this.setData({
            isshow: 1
        }), void 0 != i.globalData.detailaddress && this.setData({
            detailaddress: i.globalData.detailaddress
        }), this.data.longitude = i.globalData.longitude, this.data.latitude = i.globalData.latitude, 
        this.setData({
            role: i.globalData.userInfo.role,
            eventType: i.globalData.eventType
        });
        var s = this;
        wx.hideTabBar({}), wx.request({
            url: i.globalData.mainURL + "api/getProvinces",
            success: function(a) {
                var t = a.data.result;
                t.unshift({
                    id: "0",
                    province: "请选择省"
                }), s.setData({
                    province: t,
                    select_province: 0,
                    city: [ {
                        id: "0",
                        city: "请选择市"
                    } ],
                    select_city: 0,
                    area: [ {
                        id: "0",
                        area: "请选择区"
                    } ],
                    select_area: 0,
                    member_state: i.globalData.userInfo.isVIP
                });
            }
        }), wx.request({
            url: i.globalData.mainURL + "api/getUserState",
            data: {
                nickname: i.globalData.userInfo.nickname
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {
                a.data.status && (t.setData({
                    role: a.data.result[0].role
                }), "1" == t.data.role && wx.request({
                    url: i.globalData.mainURL + "api/getUserDetail",
                    data: {
                        user_id: i.globalData.userInfo.user_id
                    },
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    success: function(a) {
                        t.setData({
                            province_name: a.data.result[0].province,
                            city_name: a.data.result[0].city,
                            area_name: a.data.result[0].area,
                            province_id: a.data.result[0].province_id,
                            city_id: a.data.result[0].city_id,
                            area_id: a.data.result[0].area_id,
                            detail_address: a.data.result[0].detail_address,
                            showdetailaddress: 0
                        }), s.data.event.address4 = a.data.result[0].detail_address;
                    }
                }));
            }
        });
    },
    scrollDown: function() {
        this.setData({
            flag: 1
        }), console.log("here"), wx.pageScrollTo({
            scrollTop: 1800,
            duration: 300
        });
    },
    onReady: function() {
        wx.hideTabBar({
            fail: function() {
                setTimeout(function() {
                    wx.hideTabBar();
                }, 500);
            }
        });
    },
    onShow: function() {
        i.globalData.iscreatepage = 1;
        var a = this;
        a.data.is_cross = 0, wx.request({
            url: i.globalData.mainURL + "api/getUserState",
            method: "post",
            data: {
                nickname: i.globalData.userInfo.nickname
            },
            success: function(t) {
                i.globalData.userInfo.state = t.data.result[0].state, 0 != i.globalData.userInfo.state ? 3 != i.globalData.userInfo.state ? 1 != i.globalData.userInfo.state ? 0 == wx.getStorageSync("have_stadium") && 1 * i.globalData.userInfo.role == 1 && wx.showModal({
                    title: "提示",
                    content: "请填写场馆资料",
                    success: function(t) {
                        t.confirm ? (wx.navigateTo({
                            url: "../../profile/register_stadium/register_stadium",
                            success: function() {
                                wx.showTabBar({});
                            }
                        }), a.data.is_cross = 1) : t.cancel && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    },
                    complete: function() {
                        0 == a.data.is_cross && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    }
                }) : wx.showModal({
                    title: "提示",
                    content: "您的认证资料已提交，请等待审核通过",
                    showCancel: !1,
                    complete: function() {
                        wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    }
                }) : wx.showModal({
                    title: "提示",
                    content: "您的身份认证审核未通过，请重新提交",
                    success: function(t) {
                        t.confirm ? (wx.navigateTo({
                            url: "../../profile/auth/auth"
                        }), a.data.is_cross = 1) : t.cancel && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    },
                    complete: function() {
                        0 == a.data.is_cross && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    }
                }) : wx.showModal({
                    title: "提示",
                    content: "请先进行身份认证",
                    success: function(t) {
                        t.confirm ? (wx.navigateTo({
                            url: "../../profile/auth/auth"
                        }), a.data.is_cross = 1) : t.cancel && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    },
                    complete: function() {
                        0 == a.data.is_cross && wx.switchTab({
                            url: "../../index/index",
                            success: function() {
                                wx.showTabBar({});
                            }
                        });
                    }
                });
            }
        });
    },
    navigateBack: function() {
        console.log("OKBACK");
    },
    showitem: function() {
        this.setData({
            open: !this.data.open,
            showModal2: !0
        });
    },
    on_click_type: function(a) {
        var t = this;
        t.data.event.kind = a.currentTarget.id, t.setData({
            event: t.data.event,
            showModal2: !1
        });
    },
    On_blur_detailaddress: function(a) {
        this.data.event.address4 = a.detail.value;
    },
    on_blur_limit: function(a) {
        this.data.event.limit = a.detail.value;
    },
    on_blur_cost: function(a) {
        this.data.event.cost = a.detail.value;
    },
    on_blur_comment: function(a) {
        this.setData({
            flag: 0
        }), this.data.event.comment = a.detail.value;
    },
    on_event_name: function(a) {
        this.data.event.name = a.detail.value;
    },
    on_agent_name: function(a) {
        this.data.event.agent_name = a.detail.value;
    },
    on_agent_phone: function(a) {
        this.data.event.agent_phone = a.detail.value;
    },
    On_click_registerimage: function(a) {
        var t = this;
        i.globalData.ischooseimage = 1, wx.chooseImage({
            count: 1,
            success: function(a) {
                a.tempFiles[0].size > 512e4 && t.data.overimagecount++, t.data.event.event_pic = a.tempFilePaths[0], 
                t.setData({
                    eventpic: a.tempFilePaths[0]
                });
            }
        });
    },
    On_click_map: function(a) {
        var t = this;
        i.globalData.ischooseimage = 1, wx.chooseLocation({
            success: function(a) {
                t.data.longitude = a.longitude, t.data.latitude = a.latitude, t.setData({
                    select_position_text: "已选择"
                });
            },
            complete: function(a) {
                console.log(a);
            }
        });
    },
    changeDate: function(a) {
        this.setData({
            date: a.detail.value
        });
    },
    changeTime: function(a) {
        this.setData({
            time: a.detail.value
        });
    },
    changeDateTime: function(a) {
        var t = this;
        t.setData({
            dateTime: a.detail.value
        }), t.data.event.end_time = t.data.dateTimeArray[0][t.data.dateTime[0]] + "-" + t.data.dateTimeArray[1][t.data.dateTime[1]] + "-" + t.data.dateTimeArray[2][t.data.dateTime[2]] + " " + t.data.dateTimeArray[3][t.data.dateTime[3]] + ":" + t.data.dateTimeArray[4][t.data.dateTime[4]], 
        t.setData({
            event: t.data.event
        });
    },
    changeDateTime1: function(a) {
        var t = this;
        t.setData({
            dateTime1: a.detail.value
        }), t.data.event.start_time = t.data.dateTimeArray1[0][t.data.dateTime1[0]] + "-" + t.data.dateTimeArray1[1][t.data.dateTime1[1]] + "-" + t.data.dateTimeArray1[2][t.data.dateTime1[2]] + " " + t.data.dateTimeArray1[3][t.data.dateTime1[3]] + ":" + t.data.dateTimeArray1[4][t.data.dateTime1[4]], 
        t.setData({
            event: t.data.event
        });
    },
    changeDateTimeColumn: function(a) {
        var t = this.data.dateTime, i = this.data.dateTimeArray;
        t[a.detail.column] = a.detail.value, i[2] = e.getMonthDay(i[0][t[0]], i[1][t[1]]), 
        this.setData({
            dateTimeArray: i,
            dateTime: t
        });
    },
    changeDateTimeColumn1: function(a) {
        var t = this.data.dateTime1, i = this.data.dateTimeArray1;
        t[a.detail.column] = a.detail.value, i[2] = e.getMonthDay(i[0][t[0]], i[1][t[1]]), 
        this.setData({
            dateTimeArray1: i,
            dateTime1: t
        });
    },
    radioChange: function(a) {
        var t = this;
        t.data.event.publicity = a.detail.value, t.setData({
            event: t.data.event,
            publicity: a.detail.value
        });
    },
    radioChange1: function(a) {
        var t = this;
        t.data.event.additional = a.detail.value, t.setData({
            event: t.data.event
        });
    },
    on_cancel: function() {
        wx.switchTab({
            url: "../../index/index",
            success: function() {
                wx.showTabBar({});
            }
        });
    },
    on_submit: function() {
        var a = this;
        2 == i.globalData.userInfo.role && (this.data.province_id = this.data.province[this.data.select_province].id, 
        this.data.city_id = this.data.city[this.data.select_city].id, this.data.area_id = this.data.area[this.data.select_area].id), 
        a.data.event.start_time = a.data.dateTimeArray1[0][a.data.dateTime1[0]] + "-" + a.data.dateTimeArray1[1][a.data.dateTime1[1]] + "-" + a.data.dateTimeArray1[2][a.data.dateTime1[2]] + " " + a.data.dateTimeArray1[3][a.data.dateTime1[3]] + ":" + a.data.dateTimeArray1[4][a.data.dateTime1[4]], 
        a.data.event.end_time = a.data.dateTimeArray[0][a.data.dateTime[0]] + "-" + a.data.dateTimeArray[1][a.data.dateTime[1]] + "-" + a.data.dateTimeArray[2][a.data.dateTime[2]] + " " + a.data.dateTimeArray[3][a.data.dateTime[3]] + ":" + a.data.dateTimeArray[4][a.data.dateTime[4]];
        var t = 0;
        a.data.event.name.length > 20 ? wx.showToast({
            title: "活动名称不应超过20个字",
            duration: 3e3,
            icon: "none"
        }) : 0 != a.data.event.name.length ? a.data.event.agent_name.length > 20 ? wx.showToast({
            title: "发起人的名字不应超过20个字",
            duration: 3e3,
            icon: "none"
        }) : 0 != a.data.event.agent_name.length ? 0 != a.data.event.agent_phone.length ? 11 == a.data.event.agent_phone.length ? "" != a.data.event.limit && 0 != a.data.event.limit ? "" != a.data.event.cost || "1" != i.globalData.userInfo.role ? a.data.event.cost < 0 && "1" == i.globalData.userInfo.role ? wx.showToast({
            title: "请填写活动费用",
            duration: 3e3,
            icon: "none"
        }) : isFinite(a.data.event.cost) || "1" != i.globalData.userInfo.role ? 20 != a.data.event.kind ? "" != a.data.select_position_text || 2 != a.data.role ? Date.parse(a.data.event.start_time.replace(/-/g, "/")) > Date.parse(a.data.event.end_time.replace(/-/g, "/")) ? wx.showToast({
            title: "活动结束时间必须晚于开始时间",
            duration: 3e3,
            icon: "none"
        }) : "../../../image/fengm@2x.png" != a.data.event.event_pic ? a.data.overimagecount ? wx.showToast({
            title: "上传的图片不能超过5M",
            duration: 3e3,
            icon: "none"
        }) : (console.log(a.data.province[a.data.select_province].province), 0 != a.data.select_province || 1 != a.data.showdetailaddress ? "" != a.data.event.address4 ? "" != a.data.event.comment ? ("2" == i.globalData.userInfo.role && 1 == a.data.event.publicity && 1 == a.data.event.additional && 0 == i.globalData.userInfo.isVIP && 1 * i.globalData.honey_info.total_honey < 1 * i.globalData.rule[8].value && (t = 8, 
        wx.showToast({
            title: "蜂蜜不足",
            icon: "none"
        })), 0 == t && (1 == wx.getStorageSync("isfirstcreate") ? (a.setData({
            showModal1: !0,
            textareastr: "",
            placestr: ""
        }), a.setData({
            is_disabled: !0
        })) : a.on_submit1())) : wx.showToast({
            title: "请填写活动简介",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写详细地址",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请选择省/市/区",
            duration: 3e3,
            icon: "none"
        })) : wx.showToast({
            title: "请上传活动封面",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请选择地图定位",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请选择活动类型",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写活动费用",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写活动费用",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "人数上限必须大于0",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写正确的手机号码",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写手机号码",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写发起人的名字",
            duration: 3e3,
            icon: "none"
        }) : wx.showToast({
            title: "请填写活动名称",
            duration: 3e3,
            icon: "none"
        });
    },
    on_submit1: function() {
        if (1 != this.data.isfirstbtn) {
            0 == this.data.isfirstbtn && (this.data.isfirstbtn = 1), wx.setStorageSync("isfirstcreate", 0);
            var a = this;
            wx.uploadFile({
                url: i.globalData.mainURL + "api/createEvent",
                filePath: a.data.event.event_pic,
                name: "file",
                formData: {
                    user_id: i.globalData.userInfo.user_id,
                    role: i.globalData.userInfo.role,
                    event_name: a.data.event.name,
                    event_type: a.data.event.kind,
                    agent_name: a.data.event.agent_name,
                    agent_phone: a.data.event.agent_phone,
                    start_time: a.data.event.start_time,
                    end_time: a.data.event.end_time,
                    province: a.data.province_id,
                    city: a.data.city_id,
                    area: a.data.area_id,
                    detail_address: a.data.event.address4,
                    longitude: a.data.longitude,
                    latitude: a.data.latitude,
                    limit: a.data.event.limit,
                    cost: a.data.event.cost,
                    comment: a.data.event.comment,
                    publicity: a.data.event.publicity,
                    additional: a.data.event.additional,
                    member_state: 1 * i.globalData.userInfo.isVIP
                },
                success: function(t) {
                    if (2 == i.globalData.userInfo.role && 1 == a.data.event.publicity && 1 == a.data.event.additional) {
                        var e = i.globalData.honey_info;
                        e.total_honey -= 1 * a.data.honey, i.globalData.honey_info = e;
                    }
                    wx.showToast({
                        title: "活动已创建成功",
                        icon: "success",
                        time: 3e3,
                        success: function() {
                            setTimeout(function() {
                                wx.switchTab({
                                    url: "../../activity/activity",
                                    success: function() {
                                        wx.showTabBar({});
                                    }
                                });
                            }, 1e3);
                        }
                    });
                }
            });
        }
    },
    bindprovincechange: function(a) {
        for (var t = this, e = 0; e < t.data.province.length; e++) t.data.province[e].id == a.detail.value && (t.data.province_id = t.data.province[e].id);
        this.setData({
            select_province: a.detail.value
        }), 0 != t.data.select_province && wx.request({
            url: i.globalData.mainURL + "api/getCities",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[t.data.select_province].province
            },
            success: function(a) {
                t.data.city_id = a.data.result[0].id, t.setData({
                    city: a.data.result,
                    select_city: 0
                }), wx.request({
                    url: i.globalData.mainURL + "api/getAreas",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        province: t.data.province[t.data.select_province].province,
                        city: t.data.city[t.data.select_city].city
                    },
                    success: function(a) {
                        t.data.area_id = a.data.result[0].id, t.setData({
                            area: a.data.result,
                            select_area: 0
                        });
                    }
                });
            }
        });
    },
    bindcitychange: function(a) {
        for (var t = this, e = 0; e < t.data.city.length; e++) t.data.city[e].id == a.detail.value && (t.data.city_id = t.data.city[e].id);
        this.setData({
            select_city: a.detail.value
        }), wx.request({
            url: i.globalData.mainURL + "api/getAreas",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[t.data.select_province].province,
                city: t.data.city[t.data.select_city].city
            },
            success: function(a) {
                t.data.area_id = a.data.result[0].id, t.setData({
                    area: a.data.result,
                    select_area: 0
                });
            }
        });
    },
    bindareachange: function(a) {
        for (var t = this, e = 0; e < t.data.area.length; e++) t.data.area[e].id == a.detail.value && (t.data.area_id = t.data.area[e].id);
        this.setData({
            select_area: a.detail.value
        });
    },
    on_click_newaddress: function() {
        this.setData({
            select_province: this.data.province_id,
            select_city: this.data.city_id,
            select_area: this.data.area_id
        }), this.setData({
            showdetailaddress: 1
        });
        var a = this;
        wx.request({
            url: i.globalData.mainURL + "api/getCities",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: a.data.province[a.data.province_id].province
            },
            success: function(t) {
                for (var e = t.data.result, n = 0; n < e.length; n++) e[n].id == a.data.city_id && a.setData({
                    select_city: n
                });
                a.setData({
                    city: t.data.result
                }), console.log(a.data.city_id), t.data.status && wx.request({
                    url: i.globalData.mainURL + "api/getAreas",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        province: a.data.province_name,
                        city: a.data.city_name
                    },
                    success: function(t) {
                        for (var e = t.data.result, i = 0; i < e.length; i++) e[i].id == a.data.area_id && a.setData({
                            select_area: i
                        });
                        a.setData({
                            area: t.data.result
                        });
                    }
                });
            }
        });
    },
    onCancel1: function() {
        this.setData({
            showModal1: !1,
            textareastr: this.data.event.comment,
            placestr: "请输入活动简介，不超过500字",
            is_disabled: !1
        }), this.setData({
            placestr: "请输入活动简介，不超过500字"
        });
    },
    onConfirm1: function() {
        this.on_submit1(), this.setData({
            showModal1: !1
        });
    },
    preventTouchMove: function() {
        console.log("Ok");
    }
});