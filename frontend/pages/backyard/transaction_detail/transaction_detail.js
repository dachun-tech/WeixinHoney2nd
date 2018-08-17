var a = getApp();

Page({
    data: {
        goodnumber: "",
        sendtime: "",
        interval: "",
        left_day: "",
        seventime: "00:00:00"
    },
    onLoad: function(t) {
        var e = this;
        console.log(t.id), wx.request({
            url: a.globalData.mainURL + "api/getExchangeDetail",
            data: {
                user_id: a.globalData.userInfo.user_id,
                exchange_id: t.id
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(t) {
                if (console.log(t), 0 != t.data.status) {
                    "1" == t.data.result[0].state && (e.data.sendtime = t.data.result[0].send_time, 
                    e.data.interval = setInterval(e.time_set, 1e3)), e.data.goodnumber = t.data.result[0].no;
                    var n = "0000000000";
                    n = n.slice(0, 10 - e.data.goodnumber.length) + e.data.goodnumber, e.setData({
                        goodnumber: n
                    }), e.setData({
                        array: t.data.result[0],
                        upload_url: a.globalData.uploadURL,
                        productState: a.globalData.productState
                    });
                }
            },
            fail: function() {}
        });
    },
    time_set: function() {
        var t = 6048e5 - (Date.now() - Date.parse(this.data.sendtime.replace(/-/g, "/")));
        if (t <= 0) {
            var e = this;
            wx.request({
                url: a.globalData.mainURL + "api/endExchange",
                data: {
                    no: e.data.goodnumber
                },
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                success: function(a) {
                    clearInterval(e.data.interval);
                },
                fail: function() {}
            }), clearInterval(e.data.interval), wx.navigateTo({
                url: "../transaction/transaction"
            });
        } else {
            var n = "", o = Math.floor(t / 864e5);
            o = 0 != o ? o : "0", this.setData({
                left_day: o
            });
            var i = Math.floor((t - 864e5 * o) / 36e5);
            n += i < 10 ? "0" + i : i, n += ":";
            var r = t - 864e5 * o - 36e5 * i;
            n += (r = Math.floor(r / 6e4)) < 10 ? "0" + r : r, n += ":";
            var s = (t - 864e5 * o - 36e5 * i - 6e4 * r) / 1e3;
            n += (s = Math.floor(s)) < 10 ? "0" + s : s, this.setData({
                seventime: n
            });
        }
    },
    onCancel1: function() {
        this.setData({
            showModal1: !1
        });
    },
    onConfirm1: function() {
        var t = this;
        this.setData({
            showModal1: !1
        }), wx.request({
            url: a.globalData.mainURL + "api/endExchange",
            data: {
                no: t.data.goodnumber
            },
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(a) {},
            fail: function() {}
        }), wx.navigateTo({
            url: "../transaction/transaction"
        });
    },
    btn_submit: function() {
        this.setData({
            showModal1: !0
        });
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {},
    on_click_product: function(a) {
        wx.navigateTo({
            url: "../product_detail/product_detail?id=" + a.currentTarget.id
        });
    }
});