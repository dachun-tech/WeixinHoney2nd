// pages/booking/bookingCancel.js
const app = getApp();

Page({

    /**
     * 页面的初始数据
     */
    data: {
        id: '',
        img_black_start_src: '../../../image/star_n@2x.png',
        img_yellow_start_src: '../../../image/star_s@2x.png',
        count_yellowStar: 3,
        booking: {},
        eventType: [],
        userRole: [],
        bookingState: ["已支付", "进行中", "已完成", "已取消"],
        tmrID: 0,
        isFirstInit: true,
        user_id: 0,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(query) {
        this.setData({
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole,
        });
        var that = this;
        that.setData({
            id: query.id
        })

    },
    getUserModalHide: function() {
        this.setData({
            getUserInfoDisabled: false
        })
        this.data.isFirstInit = false;
        app.globalData.initDisabled = false;
        this.onShow();
        // setTimeout(function() {

        // }, 100);
    },
    onShow: function(option) {
        var that = app;
        var _this = this;
        wx.getSetting({
            success: function(res) {
                var perm = res;

                that.globalData.getUserInfoDisabled = !perm.authSetting['scope.userInfo'];
                that.globalData.getUserLocationDisabled = !perm.authSetting['scope.userLocation'];
                that.globalData.getWerunDataDisabled = !perm.authSetting['scope.werun'];

                if (!that.globalData.getUserInfoDisabled && !that.globalData.getUserLocationDisabled && !that.globalData.getWerunDataDisabled) {
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
                            wx.authorize({
                                scope: 'scope.werun',
                                fail: function() {
                                    that.globalData.initDisabled = true;
                                },
                                complete: function() {
                                    if (that.globalData.initDisabled)
                                        that.go2Setting();
                                    else {
                                        that.globalData.getUserInfoDisabled = false;
                                        _this.onPrepare();
                                        isFirstLaunch = false;
                                    }
                                }
                            })
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
        var id = that.data.id;

        that.setData({
            user_id: app.globalData.userInfo.user_id
        })

        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/getRoomBookingDetail',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'booking_id': id
            },
            success: function(res) {
                console.log(res);
                var book = res.data.result[0];
                if (book != null) {
                    var tempdate;
                    tempdate = book.end_time.split(" ")
                    book.end_time = tempdate[1];
                    var time = book.start_time.split(':');

                    book.start_time = time[0] + ':' + time[1];

                    var cur_date = new Date();
                    var start_date = new Date(book.start_time.replace(/-/g, '/'));
                    var timeDiff = start_date.getTime() - cur_date.getTime();
                    var diffhours = Math.floor(timeDiff / (1000 * 3600));
                    if (book.cancel_time > 100) {
                        that.setData({
                            cancel_state: ''
                        })
                    } else {
                        if (book.cancel_time < diffhours) {
                            that.setData({
                                cancel_state: 'enable'
                            })
                        } else {
                            that.setData({
                                cancel_state: ''
                            })
                        }
                    }



                    time = book.end_time.split(':')
                    book.end_time = time[0] + ':' + time[1]

                    if (book.site_name.length > 14) {
                        var site_name = book.site_name
                        site_name = site_name.slice(0, 14) + '..'
                        book.site_name = site_name
                    }

                    that.setData({
                        booking: book
                    })
                }
            }
        })
    },


    //called when user clicked cancel booking button
    onclick_cancel_booking: function() {

        var that = this;
        if (that.data.cancel_state == '') {
            return;
        }
        wx.showModal({
            content: '是否取消预订？',
            success: function(res) {
                if (res.confirm) {
                    var ordercode = that.data.booking.paid_price;
                    var out_refund_no = app.globalData.mch_id + Date.now()
                    if (false && that.data.booking.paid_price > 0.0) {
                        wx.login({
                            success: function(res) {
                                if (res.code) {
                                    wx.request({
                                        url: app.globalData.mainURL + 'api/refund',
                                        data: {
                                            id: wx.getStorageSync('openid'), //要去换取openid的登录凭证
                                            fee: ordercode,
                                            user_id: app.globalData.userInfo.user_id,
                                            out_trade_no: that.data.booking.out_trade_no,
                                            out_refund_no: out_refund_no
                                        },
                                        method: 'POST',
                                        header: {
                                            'content-type': 'application/json'
                                        },
                                        success: function(res) {

                                            wx.request({
                                                url: app.globalData.mainURL + 'api/datamanage/cancelRoomBooking',
                                                method: 'POST',
                                                header: {
                                                    'content-type': 'application/json'
                                                },
                                                data: {
                                                    booking_id: that.data.booking.id,
                                                    out_refund_no: out_refund_no
                                                },
                                                success: function(res) {

                                                    if (res.data.status == true) {
                                                        app.globalData.selected_booking_tab = 2;
                                                        wx.navigateBack({
                                                            delta: 1
                                                        })
                                                    }
                                                }
                                            })
                                        }
                                    })
                                }
                            }
                        });
                    } else {
                        wx.request({
                            url: app.globalData.mainURL + 'api/datamanage/cancelRoomBooking',
                            method: 'POST',
                            header: {
                                'content-type': 'application/json'
                            },
                            data: {
                                booking_id: that.data.booking.id,
                                out_refund_no: out_refund_no
                            },
                            success: function(res) {

                                if (res.data.status == true) {
                                    app.globalData.selected_booking_tab = 2;
                                    wx.navigateBack({
                                        delta: 1
                                    })
                                }
                            }
                        })
                    }
                } else if (res.cancel) {}
            }
        })
    },

    goto_mapView: function() {
        //view event location in map
        var that = this;
        wx.openLocation({
                latitude: parseFloat(that.data.booking.latitude),
                longitude: parseFloat(that.data.booking.longitude)
            })
            // wx.navigateTo({
            //     url: "view_map?latitude=" + that.data.booking.latitude + "&longitude=" + that.data.booking.longitude
            // })


    },

    phone_call: function() {
        app.phoneCall(this.data.booking.user_phone)
    },

    //called when user go to detail gym page
    go_to_place: function(event) {
        wx.navigateTo({
            url: '../../index/detail_gym/detail_gym?id=' + this.data.booking.boss_id
        })
    },

    on_clicked_share_info: function() {
        console.log('share button clicked');

    },
    //called when user wants to write comment
    btn_write_comment: function(event) {
        wx.navigateTo({
            url: 'book_evaluation?id=' + this.data.booking.id + '&room_id=' + this.data.booking.room_id
        })
    },

    onShareAppMessage: function(res) {
        console.log("SHARED")
        if (res.from === 'button') {
            console.log(res.target)
        }
        var that = this;
        var sport = parseInt(that.data.booking.site_type);
        var title = "这家" + app.globalData.eventType[sport] + "场馆不错哦, 快来预定吧";
        if (sport == 28)
            title = "这家" + app.globalData.eventType[sport] + "场馆不错哦, 快来购买吧"
        else if (sport == 31)
            title = "这家综合运动场馆不错哦, 快来预定吧"
        else if (sport == 32)
            title = "这家运动场馆不错哦, 快来预定吧"

        return {
            title: title,
            path: 'pages/profile/my_booking/booking_detail?id=' + that.data.id,
            success: function(res) {},
            fail: function(res) {}
        }
    }
})