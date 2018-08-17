var t = getApp();

Page({
    data: {
        image_withdrawal_next_src: "../../resources/next@2x.png",
        account_balance: 0,
        is_new_user: 1,
        cost: 0,
        receiver: "",
        credit_no: "",
        id_no: "",
        id_no_hidden: "",
        credit_no_hidden: "",
        isbtnclicked: 0
    },
    onLoad: function() {},
    onShow: function() {
        var a = this;
        wx.request({
            url: t.globalData.mainURL + "api/getBindingInfo",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id
            },
            success: function(t) {
                if (console.log(t), 0 != t.data.status && 1 == t.data.status) {
                    if (a.setData({
                        is_new_user: 0,
                        account_balance: t.data.result[0].amount,
                        receiver: t.data.result[0].receiver,
                        credit_no: t.data.result[0].credit_no,
                        id_no: t.data.result[0].id_no
                    }), null == t.data.result[0].id_no) return;
                    var n = t.data.result[0].id_no.slice(0, 4) + "********" + a.data.id_no.slice(a.data.id_no.length - 4, a.data.id_no.length);
                    a.setData({
                        id_no_hidden: n,
                        credit_no_hidden: a.data.credit_no.slice(a.data.credit_no.length - 4, a.data.credit_no.length)
                    });
                }
            }
        });
    },
    onCancel: function() {
        this.setData({
            showModal: !1
        });
    },
    onConfirm: function(a) {
        var n = 0;
        if (console.log("purse"), console.log(Number.isFinite(this.data.cost)), !Number.isFinite(1 * this.data.cost)) return wx.showToast({
            title: "输入金额比100元小！",
            icon: "none"
        }), void (n = 3);
        if (this.data.cost < 100) return wx.showToast({
            title: "输入金额比100元小！",
            icon: "none"
        }), void (n = 1);
        if (this.data.cost > 1 * this.data.account_balance) return wx.showToast({
            title: "余额不足",
            icon: "none"
        }), void (n = 2);
        if ((1 != this.data.isbtnclicked || 0 != n) && (0 == this.data.isbtnclicked && 0 == n && (this.data.isbtnclicked = 1), 
        0 == n)) {
            var e = this;
            wx.request({
                url: t.globalData.mainURL + "api/addBindingHistory",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    user_id: t.globalData.userInfo.user_id,
                    amount: e.data.cost
                },
                success: function(t) {
                    1 == t.data.status && wx.redirectTo({
                        url: "../final_cancel/final_cancel?method=purse",
                        success: function() {
                            e.data.isbtnclicked = 0;
                        }
                    });
                }
            });
        }
    },
    onCancel1: function() {
        this.setData({
            showModal1: !1
        });
    },
    onConfirm1: function() {
        this.setData({
            showModal1: !1
        }), wx.navigateTo({
            url: "add_New_Account/add_New_Account"
        });
    },
    on_Input_Cost: function(t) {
        this.setData({
            cost: t.detail.value
        });
    },
    on_Clicked_Cost: function() {
        null == this.data.receiver ? this.setData({
            showModal1: !0
        }) : this.setData({
            showModal: !0
        });
    },
    on_Clicked_Detail: function() {
        wx.navigateTo({
            url: "trans_detail/trans_detail"
        });
    }
});