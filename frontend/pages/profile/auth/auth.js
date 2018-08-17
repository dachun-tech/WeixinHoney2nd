function e(e, a, t) {
    return a in e ? Object.defineProperty(e, a, {
        value: t,
        enumerable: !0,
        configurable: !0,
        writable: !0
    }) : e[a] = t, e;
}

var a, t = getApp();

Page((a = {
    data: {
        nickname: "",
        user_role: "场馆主",
        user: {
            name: "",
            phone: "",
            site_name: "",
            detail_address: "",
            id_no: "",
            allow_pic: "../../../image/002@2x.png",
            id_pic1: "../../../image/sfz@2x.png",
            id_pic2: "../../../image/sfb@2x.png"
        },
        hide: 0,
        role: 1,
        overimagecount: 0,
        longitude: 0,
        latitude: 0,
        sms_state: 0,
        sms_button_text: [ "获取验证码", "s后重发" ],
        sms_count_state: 1,
        second_count: 60,
        check_code: 0,
        sms_check_state: !1,
        province: [],
        city: [],
        select_address: !1,
        area: [],
        userRole: [],
        select_province: "",
        select_city: "",
        select_area: "",
        select_location_text: "",
        method: "new",
        check_image: 0,
        check_auth_image1: 0,
        check_auth_image2: 0,
        disable: 1,
        istrue: 1
    },
    On_clicked_role: function() {
        "new" != this.data.method && "rewrite" != this.data.method || (this.data.hide = !this.data.hide, 
        this.setData({
            hide: this.data.hide
        }));
    },
    onLoad: function(e) {
        this.setData({
            userRole: t.globalData.userRole
        });
        var a = e.method;
        if (this.setData({
            nickname: t.globalData.userInfo.nickname
        }), t.globalData.userInfo.nickname) {
            var i = this;
            null == a && (a = "new");
            var o = this;
            "new" != a && ("rewrite" == a && (this.setData({
                disable: 0
            }), this.data.check_image = 1, this.data.check_auth_image1 = 1, this.data.check_auth_image2 = 1), 
            wx.request({
                url: t.globalData.mainURL + "api/getUserDetail",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    user_id: t.globalData.userInfo.user_id
                },
                success: function(e) {
                    if (console.log(e), 1 == e.data.status) {
                        var n = e.data.result[0];
                        "2" == n.role && i.setData({
                            istrue: 0
                        }), console.log("ok"), console.log(n), 1 == n.role && (n.allow_pic = t.globalData.uploadURL + n.allow_pic, 
                        n.id_pic1 = t.globalData.uploadURL + n.id_pic1, n.id_pic2 = t.globalData.uploadURL + n.id_pic2), 
                        void 0 == n.allow_pic && (n.allow_pic = "../../../image/002@2x.png", n.id_pic1 = "../../../image/sfz@2x.png", 
                        n.id_pic2 = "../../../image/sfb@2x.png"), "rewrite" == a && void 0 != n.province_id && (i.setData({
                            select_province: n.province_id
                        }), wx.request({
                            url: t.globalData.mainURL + "api/getCities",
                            method: "POST",
                            header: {
                                "content-type": "application/json"
                            },
                            data: {
                                province: n.province
                            },
                            success: function(e) {
                                for (var a = 0; a < e && e.data.result[a].id != n.city_id; a++) ;
                                i.setData({
                                    city: e.data.result,
                                    select_city: a
                                }), wx.request({
                                    url: t.globalData.mainURL + "api/getAreas",
                                    method: "POST",
                                    header: {
                                        "content-type": "application/json"
                                    },
                                    data: {
                                        province: n.province,
                                        city: n.city
                                    },
                                    success: function(e) {
                                        for (var a = 0; a < e && e.data.result[a].id != n.area_id; a++) ;
                                        i.setData({
                                            area: e.data.result,
                                            select_area: a
                                        });
                                    }
                                });
                            }
                        })), o.setData({
                            user: n,
                            role: n.role,
                            user_role: o.data.userRole[n.role],
                            method: a
                        });
                    }
                }
            })), wx.request({
                url: t.globalData.mainURL + "api/getProvinces",
                success: function(e) {
                    console.log(e);
                    var a = e.data.result;
                    a.unshift({
                        id: "0",
                        province: "请选择省"
                    }), i.setData({
                        province: a,
                        select_province: 0
                    }), i.setData({
                        city: [ {
                            id: "0",
                            city: "请选择市"
                        } ],
                        select_city: 0
                    }), i.setData({
                        area: [ {
                            id: "0",
                            area: "请选择区"
                        } ],
                        select_area: 0
                    });
                }
            });
        } else wx.showModal({
            title: "获取用户信息失败",
            content: "由于无法获取您的信息，所以您无法进行身份认证",
            showCancel: !1,
            complete: function(e) {
                wx.switchTab({
                    url: "../../profile/profile",
                    success: function() {
                        wx.showTabBar({});
                    }
                });
            }
        });
    },
    on_click_radio: function(e) {
        "new" != this.data.method && "rewrite" != this.data.method || ("radio2" == e.currentTarget.id ? (this.data.user_role = "个人", 
        this.data.role = 2, this.data.istrue = 0) : (this.data.role = 1, this.data.istrue = 1, 
        this.data.user_role = "场馆主"), this.setData({
            istrue: this.data.istrue
        }), this.setData({
            role: this.data.role
        }), this.setData({
            user_role: this.data.user_role
        }));
    },
    On_blur_stadiuminfo: function(e) {
        this.data.user.site_name = e.detail.value;
    },
    On_blur_name: function(e) {
        this.data.user.name = e.detail.value;
    },
    On_blur_phone: function(e) {
        this.data.user.phone = e.detail.value;
    },
    On_blur_authnumber: function(e) {
        this.data.user.authnumber = e.detail.value;
    },
    On_blur_detailaddress: function(e) {
        this.data.user.detail_address = e.detail.value;
    },
    On_click_authnumber: function(e) {
        var a = this;
        if (0 == a.data.sms_state) {
            if (0 == a.data.user.phone.length) return void wx.showToast({
                title: "请填写手机号码",
                icon: "none",
                time: 3e3
            });
            if (11 == a.data.user.phone.length) {
                var i = Math.ceil(9e5 * Math.random()) + 99999;
                wx.request({
                    url: t.globalData.smsURL,
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        phonenumber: a.data.user.phone,
                        random: i
                    },
                    success: function(e) {
                        if ("fail" != e.result) {
                            var t = setInterval(function() {
                                a.setData({
                                    second_count: a.data.second_count - 1
                                }), 0 == a.data.second_count && (a.setData({
                                    second_count: 60,
                                    sms_state: 0
                                }), clearInterval(t));
                            }, 1e3);
                            a.setData({
                                sms_state: 1,
                                check_code: i
                            });
                        }
                    }
                });
            } else wx.showToast({
                title: "请填写正确的手机号码",
                icon: "none",
                duration: 3e3
            });
        }
    },
    On_click_map: function(e) {
        if ("edit" != this.data.method) {
            var a = this;
            wx.chooseLocation({
                success: function(e) {
                    a.data.longitude = e.longitude, a.data.latitude = e.latitude, a.setData({
                        select_location_text: "已选择"
                    });
                }
            });
        }
    },
    On_click_registerimage: function(e) {
        if ("new" == this.data.method || "rewrite" == this.data.method) {
            var a = this;
            wx.chooseImage({
                count: 1,
                success: function(e) {
                    e.tempFiles[0].size > 512e4 && a.data.overimagecount++, a.data.check_image = 1, 
                    a.data.user.allow_pic = e.tempFilePaths[0], a.setData({
                        user: a.data.user
                    }), console.log("########   UserId ################", t.globalData.userInfo.user_id), 
                    wx.uploadFile({
                        url: t.globalData.mainURL + "api/addAllowPic",
                        filePath: e.tempFilePaths[0],
                        name: "file",
                        formData: {
                            user_id: t.globalData.userInfo.user_id
                        },
                        success: function(e) {
                            console.log(e);
                        }
                    });
                }
            });
        }
    },
    On_blur_idcard: function(e) {
        this.data.user.id_no = e.detail.value;
    },
    On_click_frontimage: function(e) {
        if ("new" == this.data.method || "rewrite" == this.data.method) {
            var a = this;
            wx.chooseImage({
                count: 1,
                success: function(e) {
                    e.tempFiles[0].size > 512e4 && a.data.overimagecount++, a.data.check_auth_image1 = 1, 
                    a.data.user.id_pic1 = e.tempFilePaths[0], a.setData({
                        user: a.data.user
                    }), wx.uploadFile({
                        url: t.globalData.mainURL + "api/addIDPic1",
                        filePath: e.tempFilePaths[0],
                        name: "file",
                        formData: {
                            user_id: t.globalData.userInfo.user_id
                        },
                        success: function() {}
                    });
                }
            });
        }
    },
    On_click_backimage: function(e) {
        if ("new" == this.data.method || "rewrite" == this.data.method) {
            var a = this;
            wx.chooseImage({
                count: 1,
                success: function(e) {
                    e.tempFiles[0].size > 512e4 && a.data.overimagecount++, a.data.check_auth_image2 = 1, 
                    a.data.user.id_pic2 = e.tempFilePaths[0], a.setData({
                        user: a.data.user
                    }), wx.uploadFile({
                        url: t.globalData.mainURL + "api/addIDPic2",
                        filePath: a.data.user.id_pic2,
                        name: "file",
                        formData: {
                            user_id: t.globalData.userInfo.user_id
                        },
                        success: function(e) {}
                    });
                }
            });
        }
    },
    On_click_submit: function(e) {
        var a = this;
        if ("new" == a.data.method || "rewrite" == a.data.method) {
            var i = 0;
            if (1 == a.data.role) {
                if (a.data.overimagecount > 0) return i += 1, void wx.showToast({
                    title: "上传的照片请不要超过5M",
                    duration: 3e3,
                    icon: "none"
                });
                if (0 == a.data.user.site_name.length) return void wx.showToast({
                    title: "请填写场馆名称",
                    duration: 3e3,
                    icon: "none"
                });
                if (a.data.user.site_name.length > 20) return i += 1, void wx.showToast({
                    title: "场馆名称不应超过20个字",
                    duration: 3e3,
                    icon: "none"
                });
                if (0 == a.data.user.name.length) return i += 1, void wx.showToast({
                    title: "请填写馆主姓名",
                    duration: 3e3,
                    icon: "none"
                });
                if (a.data.user.name.length > 4) return i += 1, void wx.showToast({
                    title: "馆主姓名不应超过4个字",
                    duration: 3e3,
                    icon: "none"
                });
                if (0 == a.data.user.detail_address.length) return i += 1, void wx.showToast({
                    title: "请填写详细地址",
                    duration: 3e3,
                    icon: "none"
                });
                if (a.data.user.detail_address.length > 20) return i += 1, void wx.showToast({
                    title: "详细地址不要超过20个字",
                    duration: 3e3,
                    icon: "none"
                });
                if (0 == a.data.user.id_no.length) return i += 1, void wx.showToast({
                    title: "请填写身份证号",
                    duration: 3e3,
                    icon: "none"
                });
                if (a.data.user.id_no.length > 18 || a.data.user.id_no.length < 15) return i += 1, 
                void wx.showToast({
                    title: "请填写正确的身份证号",
                    duration: 3e3,
                    icon: "none"
                });
                if (1 != a.data.check_image) return i += 1, void wx.showToast({
                    title: "请上传营业执照照片",
                    duration: 3e3,
                    icon: "none"
                });
                if (1 != a.data.check_auth_image1) return i += 1, void wx.showToast({
                    title: "请上传两张身份证照片（正反面各一张）",
                    duration: 3e3,
                    icon: "none"
                });
                if (1 != a.data.check_auth_image2) return i += 1, void wx.showToast({
                    title: "请上传两张身份证照片（正反面各一张）",
                    duration: 3e3,
                    icon: "none"
                });
                if ("请选择省" == a.data.province[a.data.select_province].value) return i += 1, void wx.showToast({
                    title: "请选择省/市/区",
                    duration: 3e3,
                    icon: "none"
                });
            } else {
                if (0 == a.data.user.name.length) return i += 1, void wx.showToast({
                    title: "请填写真实姓名",
                    duration: 3e3,
                    icon: "none"
                });
                if (a.data.user.name.length > 4) return i += 1, void wx.showToast({
                    title: "真实姓名不应超过4个字",
                    duration: 3e3,
                    icon: "none"
                });
            }
            if (1 * a.data.check_code != 1 * a.data.user.authnumber) return i += 1, void wx.showToast({
                title: "验证码错误!",
                duration: 3e3,
                icon: "none"
            });
            0 == i && (2 == a.data.role ? (t.globalData.role = 2, t.globalData.state = 1, wx.request({
                url: t.globalData.mainURL + "api/registerUser",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    user_id: t.globalData.userInfo.user_id,
                    role: 2,
                    name: a.data.user.name,
                    phone: a.data.user.phone
                },
                success: function(e) {
                    1 == e.data.status && (t.globalData.userInfo.state = 1, t.globalData.userInfo.name = a.data.user.name, 
                    t.globalData.userInfo.phone = a.data.user.phone, t.globalData.userInfo.role = 2, 
                    wx.redirectTo({
                        url: "./auth-text/auth_text"
                    }));
                }
            })) : (wx.showLoading({
                title: "加载中",
                mask: !0
            }), setTimeout(function() {
                wx.hideLoading();
            }, 1e3), t.globalData.role = 1, t.globalData.state = 1, wx.request({
                url: t.globalData.mainURL + "api/registerBoss",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    role: 1,
                    user_id: t.globalData.userInfo.user_id,
                    name: a.data.user.name,
                    phone: a.data.user.phone,
                    site_name: a.data.user.site_name,
                    province: a.data.province[a.data.select_province].id,
                    city: a.data.city[a.data.select_city].id,
                    area: a.data.area[a.data.select_area].id,
                    detail_address: a.data.user.detail_address,
                    longitude: a.data.longitude,
                    latitude: a.data.latitude,
                    id_no: a.data.user.id_no
                },
                success: function(e) {}
            }), console.log(a.data.user.allow_pic), t.globalData.userInfo.state = 1, t.globalData.userInfo.name = a.data.user.name, 
            t.globalData.userInfo.phone = a.data.user.phone, t.globalData.userInfo.role = 1, 
            wx.redirectTo({
                url: "./auth-text/auth_text"
            })));
        } else {
            if (1 * a.data.check_code != 1 * a.data.user.authnumber) return void wx.showToast({
                title: "验证码错误！",
                duration: 3e3,
                icon: "none"
            });
            t.globalData.state = 1, wx.request({
                url: t.globalData.mainURL + "api/updateUserPhone",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    user_id: t.globalData.userInfo.user_id,
                    phone: a.data.user.phone
                },
                success: function(e) {
                    wx.redirectTo({
                        url: "./auth-text/auth_text"
                    });
                }
            });
        }
    },
    On_blur_name1: function(e) {
        this.data.user.name = e.detail.value;
    },
    On_blur_phone1: function(e) {
        this.data.user.phone = e.detail.value;
    }
}, e(a, "On_blur_authnumber", function(e) {
    this.data.user.authnumber = e.detail.value;
}), e(a, "bindprovincechange", function(e) {
    var a = this;
    this.setData({
        select_province: e.detail.value
    }), 0 != a.data.select_province && wx.request({
        url: t.globalData.mainURL + "api/getCities",
        method: "POST",
        header: {
            "content-type": "application/json"
        },
        data: {
            province: a.data.province[a.data.select_province].province
        },
        success: function(e) {
            console.log(e), a.setData({
                city: e.data.result,
                select_city: 0
            }), wx.request({
                url: t.globalData.mainURL + "api/getAreas",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    province: a.data.province[a.data.select_province].province,
                    city: a.data.city[a.data.select_city].city
                },
                success: function(e) {
                    a.setData({
                        area: e.data.result,
                        select_area: 0
                    });
                }
            });
        }
    });
}), e(a, "bindcitychange", function(e) {
    var a = this;
    this.setData({
        select_city: e.detail.value
    }), wx.request({
        url: t.globalData.mainURL + "api/getAreas",
        method: "POST",
        header: {
            "content-type": "application/json"
        },
        data: {
            province: a.data.province[a.data.select_province].province,
            city: a.data.city[a.data.select_city].city
        },
        success: function(e) {
            a.setData({
                area: e.data.result,
                select_area: 0
            });
        }
    });
}), e(a, "bindareachange", function(e) {
    this.setData({
        select_area: e.detail.value
    });
}), a));