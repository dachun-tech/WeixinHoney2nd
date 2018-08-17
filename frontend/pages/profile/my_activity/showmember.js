var t = getApp();

Page({
    data: {
        booking: [],
        pay_content: [ "线下支付", "线上支付" ]
    },
    onLoad: function(a) {
        var e = this, n = a.id;
        wx.request({
            url: t.globalData.mainURL + "api/getBookingDetailByEvent",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                event_id: n
            },
            success: function(t) {
                var a = t.data.booking;
                e.setData({
                    booking: a
                });
            }
        });
    },
    phone_call: function(t) {
        var a = this;
        wx.makePhoneCall({
            phoneNumber: a.data.booking[t.currentTarget.id].phone,
            complete: function() {}
        });
    }
});