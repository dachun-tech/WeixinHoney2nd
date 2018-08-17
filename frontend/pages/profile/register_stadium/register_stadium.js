var a = getApp();

Page({
    data: {
        icon_path: "",
        image_path: [ "", "", "", "", "" ],
        selected: 0,
        select: [ 1, 0, 0, 0, 0 ],
        display: [ "display:none;", "" ],
        introduction: "",
        service: "",
        method: "new",
        image_buf: [],
        icon_buf: "",
        isimage: 0,
        isavatar: 0,
        overimagecount: 0,
        overavatarsize: 0,
        showModal2: !1,
        eventid: 0
    },
    onLoad: function(e) {
        console.log("ONLOAD");
        var t = this;
        wx.request({
            url: a.globalData.mainURL + "api/getSiteStatus",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            success: function(e) {
                if (1 == e.data.status) {
                    console.log(e.data.result[0]), t.setData({
                        eventid: e.data.result[0].site_type,
                        introduction: e.data.result[0].site_introduction,
                        service: e.data.result[0].site_service
                    }), t.setData({
                        eventType: a.globalData.eventType
                    });
                    for (var i = t.data.select, o = t.data.image_path, n = 0, s = 0; s < e.data.picture.length; s++) i[s + 1] = 1, 
                    n++, o[s] = a.globalData.uploadURL + e.data.picture[s].picture;
                    t.data.isavatar = 1, t.data.isimage = e.data.picture.length, t.setData({
                        image_buf: o,
                        image_path: o,
                        select: i,
                        selected: n,
                        method: "change"
                    });
                }
            }
        });
    },
    onShow: function() {
        console.log("ONSHOW");
    },
    onReady: function() {
        console.log("ONREADY");
    },
    onHide: function() {
        console.log("ONHIDE");
    },
    on_click_selectavatar: function() {
        this.setData({
            showModal2: !0
        });
    },
    preventTouchMove: function() {
        console.log("Ok");
    },
    on_click_type: function(a) {
        for (var e = this, t = 0; t < this.data.eventType.length; t++) if (this.data.eventType[t] == a.currentTarget.id) {
            e.data.eventid = t;
            break;
        }
        console.log(a.currentTarget.id), console.log(e.data.eventid), e.setData({
            eventid: e.data.eventid,
            showModal2: !1
        });
    },
    on_click_image: function(a) {
        var e = this;
        a.target.id >= e.data.selected && wx.chooseImage({
            count: 1,
            success: function(a) {
                var t = e.data.image_path;
                a.tempFiles[0].size > 10485760 && e.data.overimagecount++, t[e.data.selected] = a.tempFilePaths[0], 
                e.setData({
                    image_path: t,
                    selected: e.data.selected + 1
                });
                var i = e.data.select;
                i[e.data.selected] = 1, e.data.isimage++, e.setData({
                    select: i
                });
            }
        });
    },
    on_click_delete: function(a) {
        var e = this, t = e.data.image_path, i = e.data.select, o = a.target.id;
        if (o < 4) {
            var n = 0;
            for (n = o; n < 4; n++) t[n] = t[1 * n + 1], i[n] = i[1 * n + 1];
            t[4] = "", i[4] = 0;
        } else t[4] = "", i[4] = 1;
        e.data.isimage--, e.setData({
            image_path: t,
            select: i,
            selected: e.data.selected - 1
        });
    },
    blur_on_introduction: function(a) {
        this.setData({
            introduction: a.detail.value
        });
    },
    blur_on_service: function(a) {
        this.setData({
            service: a.detail.value
        });
    },
    on_click_save: function() {
        var e = this;
        if (void 0 != e.data.introduction) if (void 0 != e.data.service.length) if (0 != e.data.introduction.length) if (0 != e.data.service.length) if (0 != e.data.isavatar) if (console.log(e.data.isimage), 
        0 != e.data.isimage) if (0 == e.data.overimagecount) if (0 == e.data.overavatarsize) {
            var t = a.globalData.mainURL + "api/";
            "new" == e.data.method ? t += "addSiteInfo" : t += "editSiteInfo";
            var i = e.data.icon_path;
            if (console.log(t), i != e.data.icon_buf) wx.request({
                url: t,
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    site_type: e.data.eventid,
                    introduction: e.data.introduction,
                    service: e.data.service,
                    user_id: a.globalData.userInfo.user_id
                },
                success: function(t) {
                    for (var o = 0; o < e.data.image_path.length; o++) {
                        i = e.data.image_path[o], console.log(i);
                        var n = 0;
                        if ("" != i) if ("new" != e.data.method) {
                            for (;n < e.data.image_buf.length; n++) if (i == e.data.image_buf[n]) {
                                var s = e.data.image_buf[n].split("/");
                                i = s[s.length - 1], wx.request({
                                    url: a.globalData.mainURL + "api/addSitePictureURL",
                                    method: "POST",
                                    header: {
                                        "content-type": "application/json"
                                    },
                                    data: {
                                        user_id: a.globalData.userInfo.user_id,
                                        image: i
                                    }
                                });
                                break;
                            }
                            n == e.data.image_buf.length && wx.uploadFile({
                                url: a.globalData.mainURL + "api/addSitePicture",
                                filePath: i,
                                name: "file",
                                formData: {
                                    user_id: a.globalData.userInfo.user_id
                                }
                            });
                        } else wx.uploadFile({
                            url: a.globalData.mainURL + "api/addSitePicture",
                            filePath: i,
                            name: "file",
                            formData: {
                                user_id: a.globalData.userInfo.user_id
                            }
                        });
                    }
                    wx.showLoading({
                        title: "上传中"
                    }), setTimeout(function() {
                        wx.hideLoading(), a.globalData.have_stadium = 1, wx.setStorageSync("have_stadium", 1), 
                        wx.switchTab({
                            url: "../profile"
                        });
                    }, 3e3);
                }
            }); else {
                var o = e.data.icon_path.split("/");
                i = o[o.length - 1], wx.request({
                    url: t + "1",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        site_type: e.data.eventid,
                        introduction: e.data.introduction,
                        service: e.data.service,
                        user_id: a.globalData.userInfo.user_id
                    },
                    success: function() {
                        for (var t = 0; t < e.data.image_path.length; t++) {
                            i = e.data.image_path[t], console.log(i);
                            var o = 0;
                            if ("" != i) if ("new" != e.data.method) {
                                for (;o < e.data.image_buf.length; o++) if (i == e.data.image_buf[o]) {
                                    var n = e.data.image_buf[o].split("/");
                                    i = n[n.length - 1], wx.request({
                                        url: a.globalData.mainURL + "api/addSitePictureURL",
                                        method: "POST",
                                        header: {
                                            "content-type": "application/json"
                                        },
                                        data: {
                                            user_id: a.globalData.userInfo.user_id,
                                            image: i
                                        }
                                    });
                                    break;
                                }
                                o == e.data.image_buf.length && wx.uploadFile({
                                    url: a.globalData.mainURL + "api/addSitePicture",
                                    filePath: i,
                                    name: "file",
                                    formData: {
                                        user_id: a.globalData.userInfo.user_id
                                    }
                                });
                            } else wx.uploadFile({
                                url: a.globalData.mainURL + "api/addSitePicture",
                                filePath: i,
                                name: "file",
                                formData: {
                                    user_id: a.globalData.userInfo.user_id
                                }
                            });
                        }
                        wx.showLoading({
                            title: "上传中"
                        }), setTimeout(function() {
                            wx.hideLoading(), a.globalData.have_stadium = 1, wx.setStorageSync("have_stadium", 1), 
                            wx.switchTab({
                                url: "../profile"
                            });
                        }, 3e3);
                    }
                });
            }
        } else wx.showToast({
            title: "上传的场馆图标不能超过5M",
            icon: "none"
        }); else wx.showToast({
            title: "上传的场馆图片不能超过5M",
            icon: "none"
        }); else wx.showToast({
            title: "请上传场馆图片",
            icon: "none"
        }); else wx.showToast({
            title: "请上传场馆图标",
            icon: "none"
        }); else wx.showToast({
            title: "请填写服务介绍",
            icon: "none"
        }); else wx.showToast({
            title: "请填写场馆介绍",
            icon: "none"
        }); else wx.showToast({
            title: "请填写服务介绍",
            icon: "none"
        }); else wx.showToast({
            title: "请填写场馆介绍",
            icon: "none"
        });
    }
});