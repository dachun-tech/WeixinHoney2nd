var a = getApp();

Page({
    data: {
        favourite: []
    },
    onLoad: function(e) {
        var t = this;
        wx.request({
            url: a.globalData.mainURL + "api/getFavouriteSite",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            success: function(a) {
                var e = a.data.result;
                null != e && t.setData({
                    favourite: e
                });
            }
        });
    },
    phone_call: function(a) {
        var e = this;
        wx.makePhoneCall({
            phoneNumber: e.data.favourite[a.currentTarget.id].phone,
            complete: function() {}
        });
    },
    onShareAppMessage: function() {},
    btn_Clicked_Focus: function(a) {
        var e = this;
        wx.navigateTo({
            url: "../../index/detail_gym/detail_gym?id=" + e.data.favourite[a.currentTarget.id].boss_id,
            success: function(a) {},
            fail: function(a) {},
            complete: function(a) {}
        });
        new Array();
    },
    on_cancel: function(e) {
        var t = this;
        wx.request({
            url: a.globalData.mainURL + "api/cancelFavouriteSite",
            header: {
                "content-type": "application/json"
            },
            method: "POST",
            data: {
                boss_id: t.data.favourite[e.currentTarget.id].boss_id,
                user_id: a.globalData.userInfo.user_id
            },
            success: function(a) {
                wx.redirectTo({
                    url: "./my_focus"
                });
            }
        });
    }
});