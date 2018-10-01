//index.js
//获取应用实例
const app = getApp()

Page({
    data: {
        title: [
            '申请提现', //0
            '申请报名活动', //1
            '申请提现', //2
            '用户报名活动', //3
            '用户取消活动', //4
            '取消活动', //5
            '取消活动', //6
            '报名活动', //7
            '取消活动', //8
            '申请预订场馆', //9
            '用户预订场馆', //10
            '用户取消预订', //11
            '申请报名赛事', //12
            '用户报名赛事', //13
            '取消预订', //14
        ],
        sub_title: [
            '提现中',
            '提现成功',
            '提现失败'
        ], //////0    1    2    3    4    5    6    7    8    9   10   11   12   13  14
        plus: ['-', '-', '+', '+', '-', '-', '+', '-', '+', '-', '+', '-', '-', '+', '+'],
        payment: [],
    },
    onLoad: function() {
        var that = this;
        wx.request({
            url: app.globalData.mainURL + 'api/getPaymentHistory',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {
                console.log("asdf")
                if (res.data.status == true) {
                    var payment = res.data.payment
                    for (var index = 0; index < payment.length; index++) {
                        if (Math.floor(payment[index].amount) == payment[index].amount) {
                            // payment[index].amount +='.00'
                        }
                        payment[index].amount = Math.abs(payment[index].amount);
                    }
                    that.setData({
                        payment: payment,
                    })
                }
            }
        })
    }
})