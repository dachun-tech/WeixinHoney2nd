var e = getApp();

Page({
    data: {
        address: [],
        isback: 0,
        id: 0,
        showModal1: 0,
        deleteid: 0
    },
    onLoad: function(e) {
        "beebuy" == e.kind && (console.log("ok"), this.data.id = e.id, this.data.isback = 1), 
        this.getData();
    },
    getData: function() {
        var a = this;
        wx.request({
            url: e.globalData.mainURL + "api/getAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: e.globalData.userInfo.user_id
            },
            success: function(e) {
                if (null != e.data.result) {
                    for (var t = e.data.result, i = 0; i < t.length; i++) t[i].showphone = t[i].phone.slice(0, 3) + "*****" + t[i].phone.slice(8, 11);
                    a.setData({
                        address: t
                    });
                }
            },
            fail: function(e) {}
        });
    },
    checkMainAddress: function(a) {
        var t = this, i = a.currentTarget.id, d = t.data.address, s = d[i].no;
        wx.request({
            url: e.globalData.mainURL + "api/checkAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                address_id: s,
                user_id: e.globalData.userInfo.user_id
            },
            success: function(e) {}
        });
        for (var n = 0; n < d.length; n++) d[n].state = n == i ? 1 : 0;
        t.setData({
            address: d
        });
    },
    on_click_edit: function(e) {
        var a = e.currentTarget.id, t = this.data.address[a];
        console.log(t), wx.navigateTo({
            url: "editdelivery?no=" + t.no + "&name=" + t.name + "&phone=" + t.phone + "&detail_address=" + t.detail_address + "&province=" + t.province + "&city=" + t.city + "&area=" + t.area + "&email=" + t.email + "&pid=" + t.province_id + "&cid=" + t.city_id + "&aid=" + t.area_id
        });
    },
    on_click_delete: function(e) {
        this.data.deleteid = e.currentTarget.id, this.setData({
            showModal1: !0
        });
    },
    on_click_new: function(e) {
        var a = this;
        1 == a.data.isback ? wx.navigateTo({
            url: "editdelivery?kind=edit&id=" + a.data.id
        }) : wx.navigateTo({
            url: "editdelivery?no=0"
        });
    },
    onCancel1: function() {
        this.setData({
            showModal1: !1
        });
    },
    onConfirm1: function(a) {
        var t = this;
        wx.request({
            url: e.globalData.mainURL + "api/deleteAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                address_id: t.data.deleteid,
                user_id: e.globalData.userInfo.user_id
            },
            success: function(e) {
                if (0 == e.data.status) t.setData({
                    address: []
                }); else {
                    for (var a = e.data.result, i = 0; i < a.length; i++) a[i].showphone = a[i].phone.slice(0, 3) + "*****" + a[i].phone.slice(8, 11);
                    t.setData({
                        address: a
                    });
                }
            }
        }), this.setData({
            showModal1: !1
        });
    }
});