var a = getApp();

Page({
    data: {
        user_info: [],
        userState: [ "", "认证中", "认证通过", "认证未通过" ],
        userRole: []
    },
    onLoad: function(t) {
        this.setData({
            userRole: a.globalData.userRole
        }), console.log(a.globalData.userRole);
        var e = this;
        console.log("auth-text"), console.log(a.globalData.userInfo.user_id), wx.request({
            url: a.globalData.mainURL + "api/getUserDetail",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            success: function(t) {
                if (console.log(t), 1 == t.data.status) {
                    var o = t.data.result[0];
                    1 == o.role && (o.allow_pic = a.globalData.uploadURL + o.allow_pic, o.id_pic1 = a.globalData.uploadURL + o.id_pic1, 
                    o.id_pic2 = a.globalData.uploadURL + o.id_pic2), console.log(o), 0 == o.state ? wx.showModal({
                        title: "下载身份认证资料失败",
                        showCancel: !1,
                        complete: function() {
                            wx.redirectTo({
                                url: "../../profile"
                            });
                        }
                    }) : e.setData({
                        user_info: o
                    });
                }
            }
        });
    },
    On_click_submit: function(a) {
        3 == this.data.user_info.state ? wx.redirectTo({
            url: "../../auth/auth?method=rewrite"
        }) : wx.redirectTo({
            url: "../../auth/auth?method=edit"
        });
    }
});