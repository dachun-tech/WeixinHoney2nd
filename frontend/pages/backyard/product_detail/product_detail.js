// pages/backyard/product_detail/product_detail.js
var WxParse = require('../../../wxParse/wxParse.js');
var app = getApp()
Page({

    /**
     * 页面的初始数据
     */
    data: {
        id: 0,
        disable: 1,
        btn_text: "立即兑换",
        comment: ''
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

        var that = this
        that.data.options = options;
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },
    getUserModalHide: function() {
        this.setData({
            getUserInfoDisabled: false
        })
        this.data.isFirstInit = false;
        this.onShow();
        // setTimeout(function() {

        // }, 100);
    },
    onShow: function(option) {
        var that = app;
        var _this = this;
        that.globalData.initDisabled = false;
        wx.getSetting({
            success: function(res) {
                var perm = res;

                that.globalData.getUserInfoDisabled = !perm.authSetting['scope.userInfo'];
                that.globalData.getUserLocationDisabled = !perm.authSetting['scope.userLocation'];

                if (!that.globalData.getUserInfoDisabled && !that.globalData.getUserLocationDisabled) {
                    _this.onPrepare();
                    return;
                }

                if (perm.authSetting['scope.userInfo'] != true && that.globalData.initDisabled == false) {
                    that.globalData.initDisabled = true;
                    _this.setData({
                        getUserInfoDisabled: true
                    })
                    wx.hideTabBar({})
                } else {
                    wx.authorize({
                        scope: 'scope.userLocation',
                        fail: function() {
                            that.globalData.initDisabled = true;
                        },
                        complete: function() {
                            if (that.globalData.initDisabled)
                                that.go2Setting();
                            else {
                                that.globalData.getUserInfoDisabled = false;
                                _this.onPrepare();
                                app.globalData.isFirstLaunch = false;
                            }
                            // wx.authorize({
                            //     scope: 'scope.werun',
                            //     fail: function() {
                            //         that.globalData.initDisabled = true;
                            //     },
                            //     complete: function() {

                            //     }
                            // })
                        }
                    });
                }
            }
        });
    },
    onPrepare: function() {
        var that = this;
        app.onInitialize();
        if (app.globalData.userInfo.user_id == 0) {
            clearTimeout(that.data.tmrID);
            that.data.tmrID = setTimeout(function() {
                that.onPrepare();
            }, 1000);
        } else {
            that.onInitStart();
        }
    },
    onInitStart: function() {
        var that = this;
        that.setData({
            user_id: app.globalData.userInfo.user_id
        })
        var options = that.data.options;
        wx.request({
            url: app.globalData.mainURL + 'api/getGoodDetail',
            data: {
                id: options.id
            },
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            success: function(res) {
                console.log(res.data.result[0])
                if (!res.data.status) return;
                that.data.id = res.data.result[0].id
                that.data.cost = res.data.result[0].cost
                var comment = res.data.result[0].comment
                WxParse.wxParse('comment', 'html', comment, that)
                that.setData({ btn_text: "立即兑换", disable: 0 })
                if (1 * res.data.result[0].cost > 1 * app.globalData.honey_info.total_honey) {
                    that.setData({ btn_text: "蜂蜜不足", disable: 1 })
                }
                if (res.data.result[0].amount == 0) {
                    that.setData({ btn_text: "缺货", disable: 1 })
                }
                var url = app.globalData.uploadURL + res.data.result[0].pic;
                res.data.result[0].pic = url
                    /*
                    if (res.data.result[0].amount == '0')
                    {
                      that.setData({ btn_text: "缺货", disable: 1})
                    }
                    */
                that.data.product = res.data.result[0];
                that.setData({ product: res.data.result[0] })
            },
            fail: function() {}
        })
    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    On_click_order: function() {
        var that = this
        wx.redirectTo({
            url: '../product_order/product_order?id=' + that.data.id,
        })
    },
    onShareAppMessage: function(res) {
        console.log("SHARED")
        if (res.from === 'button') {
            console.log(res.target)
        }
        var that = this;

        var title = "每天采集蜂蜜，免费兑换" + that.data.product.name + "哦";

        return {
            title: title,
            path: '/pages/backyard/product_detail/product_detail?id=' + that.data.options.id,
            success: function(res) {},
            fail: function(res) {}
        }
    }
})