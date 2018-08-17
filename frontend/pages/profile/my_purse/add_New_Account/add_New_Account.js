var e = getApp();

Page({
    data: {
        img_note_src: "../../../../image/t@2x.png",
        realname: "",
        cardnum: 0,
        idnumber: "",
        phonenumber: "",
        bankname: "",
        error: ""
    },
    input_Realname: function(e) {
        this.setData({
            realname: e.detail.value
        });
    },
    input_Bankcardnumber: function(e) {
        this.setData({
            cardnum: e.detail.value
        });
    },
    input_Idcardnumber: function(e) {
        this.setData({
            idnumber: e.detail.value
        });
    },
    input_Phonenumber: function(e) {
        this.setData({
            phonenumber: e.detail.value
        });
    },
    input_Bankname: function(e) {
        this.setData({
            bankname: e.detail.value
        });
    },
    on_Clicked_OK: function() {
        var t = this, n = 0;
        return 0 == this.data.realname.length ? (n++, void wx.showToast({
            title: "请填写持卡人姓名",
            icon: "none",
            time: 3e3
        })) : this.data.realname.length > 5 || this.data.realname.length < 2 ? (n++, void wx.showToast({
            title: "持卡人姓名应为2-5个字",
            icon: "none",
            time: 3e3
        })) : 0 == t.data.cardnum.toString().length ? (n++, void wx.showToast({
            title: "请填写银行卡号",
            icon: "none",
            time: 3e3
        })) : t.data.cardnum.toString().length > 21 || t.data.cardnum.toString().length < 16 ? (n++, 
        void wx.showToast({
            title: "请填写正确的银行卡号",
            icon: "none",
            time: 3e3
        })) : 0 == t.data.phonenumber.length ? (n++, void wx.showToast({
            title: "请填写银行预留手机号码",
            icon: "none",
            time: 3e3
        })) : 11 != t.data.phonenumber.length ? (n++, void wx.showToast({
            title: "请填写正确的银行预留手机号码",
            icon: "none",
            time: 3e3
        })) : 0 == t.data.idnumber.length ? (n++, void wx.showToast({
            title: "请填写身份证号",
            icon: "none",
            time: 3e3
        })) : t.data.idnumber.length > 18 || t.data.idnumber.length < 15 ? (n++, void wx.showToast({
            title: "请填写正确的身份证号",
            icon: "none",
            time: 3e3
        })) : 0 == t.data.bankname.length ? (n++, void wx.showToast({
            title: "请填写开户行名称",
            icon: "none",
            time: 3e3
        })) : t.data.bankname.length > 10 ? (n++, void wx.showToast({
            title: "开户行名称应不超过10个字",
            icon: "none",
            time: 3e3
        })) : void (0 == n && (this.setData({
            error: ""
        }), wx.request({
            url: e.globalData.mainURL + "api/addBindingInfo",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: e.globalData.userInfo.user_id,
                receiver: t.data.realname,
                credit_no: t.data.cardnum,
                id_no: t.data.idnumber,
                bank_phone: t.data.phonenumber,
                bank: t.data.bankname
            },
            success: function(e) {
                wx.navigateTo({
                    url: "../my_purse"
                });
            }
        })));
    }
});