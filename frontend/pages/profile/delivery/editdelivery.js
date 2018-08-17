var a = getApp();

Page({
    data: {
        method: "",
        address: {
            no: 0,
            detail_address: "",
            province: "",
            city: "",
            area: "",
            name: "",
            email: "",
            phone: ""
        },
        province: [],
        city: [],
        area: [],
        select_province: 0,
        select_city: 0,
        select_area: 0,
        address_no: 0,
        kind: 0,
        product_id: 0,
        select_address: 0,
        detail_input: "",
        pid: 0,
        cid: 0,
        aid: 0
    },
    onLoad: function(e) {
        var t = this;
        if (t.data.address_no = e.no, wx.request({
            url: a.globalData.mainURL + "api/getProvinces",
            success: function(a) {
                var e = a.data.result;
                e.unshift({
                    id: "0",
                    province: "请选择省"
                }), t.setData({
                    province: e,
                    select_province: 0
                }), t.setData({
                    city: [ {
                        id: "0",
                        city: "请选择市"
                    } ],
                    select_city: 0
                }), t.setData({
                    area: [ {
                        id: "0",
                        area: "请选择区"
                    } ],
                    select_area: 0
                });
            }
        }), 0 != e.no) {
            var d = this.data.address;
            d.no = e.no, d.name = e.name, d.phone = e.phone, d.province = e.province, d.city = e.city, 
            d.area = e.area, d.detail_address = e.detail_address, d.email = e.email, this.data.pid = e.pid, 
            this.data.cid = e.cid, this.data.aid = e.aid;
            for (var s = 0; s < this.data.province.length; s++) this.data.province[s].value == d.province && (this.data.select_province = this.data.province[s].id);
            this.setData({
                address: d
            }), this.setData({
                method: "change"
            });
        } else this.setData({
            method: "new"
        });
        null != e.kind && (t.data.kind = e.kind, t.data.product_id = e.id, t.data.method = "new", 
        t.setData({
            method: "new"
        }));
    },
    On_clicked_address: function(e) {
        if (this.data.select_address = !this.data.select_address, this.data.select_address) {
            var t = this;
            this.data.address.detail_address = "", wx.request({
                url: a.globalData.mainURL + "api/getProvinces",
                success: function(a) {
                    var e = a.data.result;
                    e.unshift({
                        id: "0",
                        province: "请选择省"
                    }), t.setData({
                        province: e,
                        select_province: 0
                    }), t.setData({
                        city: [ {
                            id: "0",
                            city: "请选择市"
                        } ],
                        select_city: 0
                    }), t.setData({
                        area: [ {
                            id: "0",
                            area: "请选择区"
                        } ],
                        select_area: 0
                    });
                }
            });
        }
        this.setData({
            select_address: this.data.select_address
        });
    },
    bindChange: function(e) {
        var t = this, d = e.detail.value[0];
        d != t.data.select_province ? (t.setData({
            select_province: d
        }), wx.request({
            url: a.globalData.mainURL + "api/getCities",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[d].province
            },
            success: function(e) {
                t.setData({
                    city: e.data.result,
                    select_city: 0
                }), wx.request({
                    url: a.globalData.mainURL + "api/getAreas",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        province: t.data.province[d].province,
                        city: t.data.city[t.data.select_city].city
                    },
                    success: function(a) {
                        t.setData({
                            area: a.data.result,
                            select_area: 0
                        });
                    }
                });
            }
        })) : e.detail.value[1] != t.data.select_city ? (t.setData({
            select_city: e.detail.value[1]
        }), wx.request({
            url: a.globalData.mainURL + "api/getAreas",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[d].province,
                city: t.data.city[t.data.select_city].city
            },
            success: function(a) {
                t.setData({
                    area: a.data.result,
                    select_area: 0
                });
            }
        })) : t.setData({
            select_area: e.detail.value[2]
        });
    },
    on_blur_postname: function(a) {
        this.data.address.name = a.detail.value;
    },
    on_blur_phonenumber: function(a) {
        this.data.address.phone = a.detail.value;
    },
    on_blur_address: function(a) {
        this.data.address.detail_address = a.detail.value;
    },
    on_blur_mail: function(a) {
        this.data.address.email = a.detail.value;
    },
    on_click_submit: function(e) {
        var t = this;
        0 != this.data.address.name.length ? this.data.address.name.length < 2 || this.data.address.name.length > 6 ? wx.showToast({
            title: "姓名应为2-6个字",
            icon: "none"
        }) : (console.log(this.data.select_province), 0 != this.data.select_province || "new" != t.data.method ? 0 != this.data.address.phone.toString().length ? 11 == this.data.address.phone.toString().length ? (console.log(this.data.select_province), 
        0 != this.data.select_province || 1 != this.data.select_address ? 0 != this.data.address.email.length ? 0 != this.data.address.detail_address.length ? "new" == t.data.method ? wx.request({
            url: a.globalData.mainURL + "api/addAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id,
                name: t.data.address.name,
                phone: t.data.address.phone,
                province: t.data.province[t.data.select_province].id,
                city: t.data.city[t.data.select_city].id,
                area: t.data.area[t.data.select_area].id,
                detail_address: t.data.address.detail_address,
                email: t.data.address.email
            },
            success: function(a) {
                0 == t.data.kind ? wx.switchTab({
                    url: "../profile"
                }) : wx.redirectTo({
                    url: "../../backyard/product_order/product_order?id=" + t.data.product_id
                });
            }
        }) : 1 == t.data.select_address ? (console.log(t.data.province[t.data.select_province].id), 
        wx.request({
            url: a.globalData.mainURL + "api/changeAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                address_id: this.data.address_no,
                user_id: a.globalData.userInfo.user_id,
                name: t.data.address.name,
                phone: t.data.address.phone,
                province: t.data.province[t.data.select_province].id,
                city: t.data.city[t.data.select_city].id,
                area: t.data.area[t.data.select_area].id,
                detail_address: t.data.address.detail_address,
                email: t.data.address.email
            },
            success: function(a) {
                console.log(a), 0 == t.data.kind ? wx.switchTab({
                    url: "../profile"
                }) : wx.redirectTo({
                    url: "../../backyard/product_order/product_order?id=" + t.data.product_id
                });
            }
        })) : wx.request({
            url: a.globalData.mainURL + "api/changeAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                address_id: this.data.address_no,
                user_id: a.globalData.userInfo.user_id,
                name: t.data.address.name,
                phone: t.data.address.phone,
                province: t.data.pid,
                city: t.data.cid,
                area: t.data.aid,
                detail_address: t.data.address.detail_address,
                email: t.data.address.email
            },
            success: function(a) {
                console.log(a), 0 == t.data.kind ? wx.switchTab({
                    url: "../profile"
                }) : wx.redirectTo({
                    url: "../../backyard/product_order/product_order?id=" + t.data.product_id
                });
            }
        }) : wx.showToast({
            title: "请填写详细地址",
            icon: "none"
        }) : wx.showToast({
            title: "请填写邮政编码",
            icon: "none"
        }) : wx.showToast({
            title: "请选择省/市/区",
            icon: "none"
        })) : wx.showToast({
            title: "请填写正确的手机号码",
            icon: "none"
        }) : wx.showToast({
            title: "请填写手机号码",
            icon: "none"
        }) : wx.showToast({
            title: "请选择省/市/区",
            duration: 3e3,
            icon: "none"
        })) : wx.showToast({
            title: "请填写姓名",
            icon: "none"
        });
    },
    bindprovincechange: function(e) {
        var t = this;
        this.setData({
            select_province: e.detail.value
        }), wx.request({
            url: a.globalData.mainURL + "api/getCities",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[t.data.select_province].province
            },
            success: function(e) {
                t.setData({
                    city: e.data.result,
                    select_city: 0
                }), wx.request({
                    url: a.globalData.mainURL + "api/getAreas",
                    method: "POST",
                    header: {
                        "content-type": "application/json"
                    },
                    data: {
                        province: t.data.province[t.data.select_province].province,
                        city: t.data.city[t.data.select_city].city
                    },
                    success: function(a) {
                        t.setData({
                            area: a.data.result,
                            select_area: 0
                        });
                    }
                });
            }
        });
    },
    bindcitychange: function(e) {
        var t = this;
        this.setData({
            select_city: e.detail.value
        }), wx.request({
            url: a.globalData.mainURL + "api/getAreas",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                province: t.data.province[t.data.select_province].province,
                city: t.data.city[t.data.select_city].city
            },
            success: function(a) {
                t.setData({
                    area: a.data.result,
                    select_area: 0
                });
            }
        });
    },
    bindareachange: function(a) {
        this.setData({
            select_area: a.detail.value
        });
    }
});