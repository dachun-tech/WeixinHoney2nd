//index.js
//获取应用实例
const app = getApp()
var util = require('../../../../utils/util.js')
Page({
    data: {
        img_note_src: '../../../../image/t@2x.png',
        realname: "",
        cardnum: 0,
        idnumber: "",
        phonenumber: "",
        bankname: "",
        error: "",
        userInputCardNo: '',
    },
    input_Realname: function(e) {
        this.setData({ realname: e.detail.value })
    },
    input_Bankcardnumber: function(e) {
        var card = e.detail.value;
        card = card.replace(/\s/g, '').replace(/[^\d]/g, '').replace(/(\d{4})(?=\d)/g, '$1 ')

        this.setData({
            userInputCardNo: card.trim()
        });

        this.setData({
            cardnum: e.detail.value.replace(/ /g, '')
        })
        console.log(this.checkCard(this.data.cardnum));
        // var temp = util.bankCardAttribution(this.data.cardnum)
        // if (temp == Error) {
        //     temp.bankName = '';
        //     temp.cardTypeName = '';
        // } else {
        //     this.setData({
        //         cardType: temp.bankName + temp.cardTypeName,
        //         cardBankName: temp.bankName
        //     })
        // }
    },
    input_Idcardnumber: function(e) {
        this.setData({ idnumber: e.detail.value })
    },
    input_Phonenumber: function(e) {
        this.setData({ phonenumber: e.detail.value })
    },
    input_Bankname: function(e) {
        this.setData({ bankname: e.detail.value })
    },
    checkCard(cardNo) {
        if (isNaN(cardNo)) return false;
        if (cardNo.length < 12) { return false; }
        var nums = cardNo.split("");
        var sum = 0;
        var index = 1;
        for (var i = 0; i < nums.length; i++) {
            if ((i + 1) % 2 == 0) {
                var tmp = Number(nums[nums.length - index]) * 2;
                if (tmp >= 10) {
                    var t = tmp + "".split("");
                    tmp = Number(t[0]) + Number(t[1]);
                }
                sum += tmp;
            } else { sum += Number(nums[nums.length - index]); }
            index++;
        }
        if (sum % 10 != 0) { return false; }
        return true;
    },

    on_Clicked_OK: function() {
        var that = this;
        var x = 0;
        var compare = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        that.data.cardnum = that.data.cardnum.replace(/ /g, '');
        if (this.data.realname.length == 0) {
            x++
            wx.showToast({ title: '请填写持卡人姓名', icon: 'none', time: 3000 })
            return
        }
        if (this.data.realname.length > 5 || this.data.realname.length < 2) {
            x++
            wx.showToast({ title: "持卡人姓名应为2-5个字", icon: 'none', time: 3000 })
            return
        }
        if (that.data.cardnum.toString().length == 0) {
            x++
            wx.showToast({ title: '请填写银行卡号', icon: 'none', time: 3000 })
            return
        }
        if (that.data.cardnum.toString().length > 21 || that.data.cardnum.toString().length < 16) {
            x++
            wx.showToast({ title: "请填写正确的银行卡号为16-21个字", icon: 'none', time: 3000 })
            return
        }
        if (that.data.bankname.length == 0) {
            x++
            wx.showToast({ title: "请填写开户行名称", icon: 'none', time: 3000 })
            return
        }
        if (that.data.bankname.length > 10) {
            x++
            wx.showToast({ title: "开户行名称应不超过10个字", icon: 'none', time: 3000 })
            return
        }
        if (!that.checkCard(that.data.cardnum)) {
            x++
            wx.showToast({ title: "不支持该类型的银行卡，请更换", icon: 'none', time: 3000 })
            return
        }
        // if (!that.data.cardType) {
        //     x++
        //     wx.showToast({ title: "不支持该类型的银行卡，请更换", icon: 'none', time: 3000 })
        //     return
        // }
        // if (that.data.cardBankName != that.data.bankname) {
        //     x++
        //     wx.showToast({ title: "银行卡不属于" + that.data.bankname, icon: 'none', time: 3000 })
        //     return
        // }
        if (that.data.phonenumber.length == 0) {
            x++
            wx.showToast({ title: "请填写银行预留手机号码", icon: 'none', time: 3000 })
            return
        }
        if (that.data.phonenumber.length != 11) {
            x++
            wx.showToast({ title: "请填写正确的银行预留手机号码为11个字", icon: 'none', time: 3000 })
            return
        }
        if (!app.checkValidPhone(that.data.phonenumber)) {
            x++
            wx.showToast({ title: "请填写正确的银行预留手机号码", icon: 'none', time: 3000 })
            return
        }
        if (that.data.idnumber.length == 0) {
            x++
            wx.showToast({ title: "请填写身份证号", icon: 'none', time: 3000 })
            return
        }
        if (that.data.idnumber.length > 18 || that.data.idnumber.length < 15) {
            x++
            wx.showToast({ title: "请填写正确的身份证号为15-18个字", icon: 'none', time: 3000 })
            return
        }
        if (x == 0) {
            this.setData({ error: "" })
            wx.request({
                url: app.globalData.mainURL + 'api/addBindingInfo',
                method: 'POST',
                header: {
                    'content-type': 'application/json'
                },
                data: {
                    user_id: app.globalData.userInfo.user_id,
                    receiver: that.data.realname,
                    credit_no: that.data.cardnum,
                    id_no: that.data.idnumber,
                    bank_phone: that.data.phonenumber,
                    bank: that.data.bankname
                },
                success: function(res) {
                    wx.navigateTo({
                        url: '../my_purse',
                    })
                }
            })
        }
    }
})