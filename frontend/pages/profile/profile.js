var e = getApp();

Page({
    data: {
        userInfo: {}
    },
    onShow: function() {
        wx.showTabBar({}), e.checkDate(), this.setData({
            userInfo: e.globalData.userInfo
        });
    },
    whichpress: function(a) {
        switch (a.currentTarget.id) {
          case "about_my_bee":
            wx.navigateTo({
                url: "my_booking/booking"
            });
            break;

          case "my_event":
            wx.navigateTo({
                url: "my_activity/my_activity"
            });
            break;

          case "my_purse":
            wx.navigateTo({
                url: "my_purse/my_purse"
            });
            break;

          case "my_membership":
            wx.navigateTo({
                url: "my_membership/my_membership"
            });
            break;

          case "my_focus":
            wx.navigateTo({
                url: "my_focus/my_focus"
            });
            break;

          case "auth_me":
            0 == e.globalData.userInfo.state ? wx.navigateTo({
                url: "auth/auth"
            }) : wx.navigateTo({
                url: "auth/auth-text/auth_text"
            });
            break;

          case "delivery_address":
            wx.navigateTo({
                url: "delivery/delivery"
            });
            break;

          case "about_stadium":
            wx.navigateTo({
                url: "register_stadium/register_stadium"
            });
        }
    }
});