var a = getApp();

Page({
    data: {
        comment: "",
        cost: 0,
        id: 0,
        show: 0,
        isfirstbtn: 0
    },
    onLoad: function(t) {
        var e = this;
        e.setData({
            id: t.id
        }), console.log(t.id), this.setData({
            upload_url: a.globalData.uploadURL
        }), wx.request({
            url: a.globalData.mainURL + "api/orderExchange",
            data: {
                good_id: t.id,
                user_id: a.globalData.userInfo.user_id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {
                console.log(a);
                var t = 1;
                void 0 == a.data.address ? t = 0 : (t = 1, e.data.cost = a.data.good[0].cost, e.setData({
                    status: a.data.status,
                    address: a.data.address[0],
                    good: a.data.good[0]
                })), e.setData({
                    show: t
                });
            },
            fail: function() {}
        });
    },
    onShow: function() {
        var t = this;
        wx.request({
            url: a.globalData.mainURL + "api/getAcceptAddress",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            success: function(a) {
                if (null == a.data.result && t.setData({
                    show: 0
                }), null != a.data.result) {
                    var e = a.data.result;
                    console.log(e);
                    for (var o = 0; o < e.length; o++) "1" == e[o].state && t.setData({
                        address: e[o]
                    });
                    t.setData({
                        show: 1
                    });
                }
            },
            fail: function(a) {}
        });
    },
    onBlurtextarea: function(a) {
        this.data.comment = a.detail.value;
    },
    onBtnsubmit: function(t) {
        if (1 != this.data.isfirstbtn) {
            0 == this.data.isfirstbtn && (this.data.isfirstbtn = 1);
            var e = this;
            wx.request({
                url: a.globalData.mainURL + "api/setExchange",
                data: {
                    good_id: t.currentTarget.id,
                    user_id: a.globalData.userInfo.user_id,
                    comment: e.data.comment,
                    address_no: e.data.address.no
                },
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                success: function(t) {
                    a.globalData.honey_info.total_honey -= 1 * e.data.cost, wx.redirectTo({
                        url: "../ordercomplete/ordercomplete",
                        success: function() {
                            e.data.isfirstbtn = 0;
                        }
                    });
                },
                fail: function() {}
            });
        }
    },
    on_click_address: function() {
        var a = this;
        this.data.show ? wx.navigateTo({
            url: "../../profile/delivery/delivery?kind=beebuy&id=" + a.data.id
        }) : wx.redirectTo({
            url: "../../profile/delivery/editdelivery?kind=edit&id=" + a.data.id
        });
    }
});