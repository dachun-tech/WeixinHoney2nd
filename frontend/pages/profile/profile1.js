//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    user_id:'',      
    userInfo: {},
    sex_images: ["../../image/man@2x.png",
    "../../image/women@2x.png"],
    type_array:[],
    event_types: app.globalData.eventType
  },
  onLoad: function (option) {
    var that = this;
    that.setData({
        user_id:option.id
    })
  },
  onShow: function () {
    wx.showTabBar({
    })
    //Setting Nickname and avatar of User    
    var that = this;
    wx.request({
      url: app.globalData.mainURL + 'api/getUserDetail',
      method: 'POST',
      header: {
        'content-type': 'application/json'
      },
      data: {        
        'user_id': that.data.user_id
      },
      success: function (res) {        
        var user = res.data.result;         
        that.setData({ userInfo: user[0] });
        console.log(that.data.userInfo);
      }
    });

    wx.request({
      url: app.globalData.mainURL + 'api/datamanage/getTypeListById',
      method: 'POST',
      header: {
        'content-type': 'application/json'
      },
      data: {        
        'user_id': that.data.user_id
      },
      success: function (res) {        
        var type_array = res.data.result;         
        that.setData({ type_array: type_array });
        console.log(that.data.userInfo);
      }
    })


  },

  on_clicked_edit_info: function (event) {
    //go to edit info screen
    wx.navigateTo({
      url: 'my_info/my_info'
    });
  },
  //listener of tabbar
  //footer function
  whichpress: function (event) {
    switch (event.currentTarget.id) {
      case 'my_activity':
        wx.navigateTo({
          url: 'my_activity/my_activity'
        });
        break;


      case 'my_event':
        wx.navigateTo({
          url: 'my_event/my_event'
        });
        break;
      case 'my_booking':
        wx.navigateTo({
          url: 'my_booking/booking'
        });
        break;




      case 'my_purse':
        wx.navigateTo({
          url: 'my_purse/my_purse'
        });
        break;
      case 'delivery_address':
        wx.navigateTo({
          url: 'delivery/delivery',
        })
        break;
      case 'my_membership':
        wx.navigateTo({
          url: 'my_membership/my_membership',
        })
        break;
      case 'my_focus':
        wx.navigateTo({
          url: 'my_focus/my_focus',
        })
        break;
      case 'auth_me':
        if(app.globalData.userInfo.state==0){
          wx.navigateTo({
            url: 'auth/auth',
          })
        }
        else{
          wx.navigateTo({
            url: 'auth/auth-text/auth_text',
          })
        }
        break;
      
      case 'about_stadium':
      wx.navigateTo({
        url: 'register_stadium/register_stadium',
      })
        break;
      default:
        break;
    }
  }
})
