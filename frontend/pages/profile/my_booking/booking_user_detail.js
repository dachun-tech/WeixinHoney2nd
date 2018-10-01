// pages/booking/bookingCancel.js
const app = getApp();

Page({

    /**
     * 页面的初始数据
     */
    data: {
        id: '',
        book_date: '',
        img_black_start_src: '../../../image/star_n@2x.png',
        img_yellow_start_src: '../../../image/star_s@2x.png',
        count_yellowStar: 3,
        booking: {},
        eventType: [],
        site_info: [],
        userRole: [],
        options: [],
        curBossId: 0,
        curUserId: 0,
        bookList: [],
        bookingState: ["已支付", "进行中", "已完成", "已取消"],
        tmrID: 0,
        isFirstInit: true,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(option) {

        var that = this;
        that.data.options = option;
        that.data.curBossId = option.id;
        that.setData({
            id: option.id, // applied user id
        })

    },
    onShow: function() {
        var that = this;
        var option = that.data.options;
        if (app.globalData.userInfo.user_id == 0) {
            if (!that.data.isFirstInit) app.onLaunch();
            clearTimeout(that.data.tmrID)
            that.data.tmrID = setTimeout(function() {
                that.data.isFirstInit = false;
                if (!app.globalData.initDisabled)
                    that.onShow();
            }, 4000);
        } else {
            that.onInitStart(option);
        }
    },

    onInitStart: function(options) {
        var that = this;

        that.data.curUserId = app.globalData.userInfo.user_id;

        var book_date = wx.getStorageSync('book_date');
        var tDate = new Date(book_date + ' 00:00:00');
        that.data.book_date = tDate.getFullYear() + '-' + (tDate.getMonth() + 1) + '-' + tDate.getDate();
        that.data.bookList = wx.getStorageSync('book_info');

        this.setData({
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole,
            bookingState: app.globalData.eventState,
            eventState: app.globalData.eventState,
            book_date: this.data.book_date,
        });
        var id = this.data.curBossId;

        wx.request({
            url: app.globalData.mainURL + 'api/getSiteDetail',
            header: {
                'content-type': 'application/json'
            },
            method: 'POST',
            data: {
                'boss_id': id,
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {
                console.log(res.data);
                if (res.data.status) {
                    that.data.site_info = res.data;
                    that.setData({
                        booking: that.data.site_info.site[0]
                    })
                }
            }
        })
        wx.request({
            url: app.globalData.mainURL + 'api/getUserDetail',
            header: {
                'content-type': 'application/json'
            },
            method: 'POST',
            data: {
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {
                console.log(res.data);
                if (res.data.status) {
                    that.setData({
                        user: res.data.result[0]
                    })

                }
            }
        })
        var bookList = that.data.bookList;
        var totalPrice = 0;
        for (var i = 0; i < bookList.length; i++) {
            var item = bookList[i];
            if (parseFloat(item.cost) < 0) continue;
            totalPrice += parseFloat(item.cost);
        }
        totalPrice = totalPrice.toFixed(2);
        totalPrice = parseFloat(totalPrice);
        that.setData({
            bookList: bookList
        })
        app.globalData.userInfo.honey = parseInt(app.globalData.userInfo.honey);
        app.globalData.userInfo.amount = parseFloat(app.globalData.userInfo.amount);
        that.prepare_payment(totalPrice, app.globalData.userInfo.honey, app.globalData.userInfo.amount, 2); // price, honey, wallet, pay_type(0-offline, 1-online pay)
        // set swiper image
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
                                                        wx.navigateBack({
                                                            delta: 2
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
                                    wx.navigateBack({
                                        delta: 2
                                    })
                                }
                            }
                        })
                    }
                } else if (res.cancel) {}
            }
        })
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

    ///////////////////////// pay_template processor //////////////////////////////////
    prepare_payment: function(price, honey, wallet, pay_type) {

        if (price == undefined) price = 0; // total price for pay needed
        if (honey == undefined) honey = 0; // user's honey
        if (wallet == undefined) wallet = 0; // user's wallet
        if (pay_type == undefined) pay_type = 0; // 0-offline paymeng, 1-online payment

        if (pay_type == 2) pay_type = 1;
        var that = this;
        that.data.price = price;
        that.data.old_wallet = wallet;

        that.data.phone = '';
        that.data.name = '';

        var honey_list = [];
        var honey_unit = parseInt(app.globalData.rule[8].value);
        var honey_price_unit = parseFloat(app.globalData.rule[9].value);
        if (app.globalData.userInfo.isVIP == 1) {
            honey_unit = parseInt(app.globalData.rule[10].value);
            honey_price_unit = parseFloat(app.globalData.rule[11].value);
        }
        for (var i = honey_unit; i <= honey; i += honey_unit) {
            honey_list.push(i);
        }
        that.setData({
            total_cost: price,

            pay_price: price,
            honey_list: honey_list,
            honey_id: 0,
            wallet: wallet,

            pay_type: pay_type, //0-offline, 1-online payment
            book_id: 918, // record id for booking
            book_type: 2, // 0-activity booking, 1-event booking, 2-room booking

            select_honey: 0,
            chk_imgs: ["../../../image/hook_n@2x.png", "../../../image/hook_s.png"],
            check_honey: 0,
            check_wallet: 0,
            honey_price_unit: honey_price_unit,

        });
        that.calculate_pay_price();
    },
    show_select_honey: function(event) {
        var that = this;
        if (that.data.check_honey == 1)
            that.setData({
                select_honey: 1
            })
    },
    select_honey_price: function(event) {
        var that = this;
        var idx = parseInt(event.currentTarget.dataset.id);
        that.setData({
            select_honey: 0,
            honey_id: idx,
        })
        that.calculate_pay_price();
    },
    payment_check: function(event) {
        var that = this;
        var type = event.currentTarget.dataset.type;
        switch (type) {
            case 'honey':
                that.data.check_honey = 1 - that.data.check_honey;

                break;
            case 'wallet':
                that.data.check_wallet = 1 - that.data.check_wallet;
                break;
        }
        that.calculate_pay_price();
        if (type == 'honey' && that.data.check_honey == 0.0) {
            wx.showToast({
                title: '当总价大于蜂蜜价时，可以使用蜂蜜!',
                icon: 'none',
                duration: 2000
            });
        }
    },
    calculate_pay_price: function() {
        var that = this;
        that.data.price = that.data.total_cost * 1;
        that.data.pay_price = that.data.price;
        that.data.wallet = that.data.old_wallet;
        if (that.data.check_honey == 1 && that.data.pay_price * 1 >= (that.data.honey_id * 1 + 1) * that.data.honey_price_unit)
            that.data.pay_price = that.data.pay_price - (that.data.honey_id * 1 + 1) * that.data.honey_price_unit;
        else if (that.data.honey_id == 0)
            that.data.check_honey = 0;

        if (that.data.check_wallet == 1) { // if wallet pay selected
            if (that.data.pay_price >= that.data.wallet * 1) { // if pay price > wallet 
                that.data.pay_price = that.data.pay_price - that.data.wallet;
                that.data.wallet = 0;
            } else { // wallet > pay price
                that.data.wallet -= that.data.pay_price;
                that.data.pay_price = 0;
            }
        }

        that.data.check_honey = parseFloat(that.data.check_honey.toFixed(2))
        that.data.check_wallet = parseFloat(that.data.check_wallet.toFixed(2))
        that.data.pay_price = parseFloat(that.data.pay_price.toFixed(2))
        that.data.wallet = parseFloat(that.data.wallet.toFixed(2))

        that.setData({
            check_honey: that.data.check_honey,
            check_wallet: that.data.check_wallet,
            pay_price: that.data.pay_price,
            wallet: that.data.wallet
        })
        that.data.isProcessing = 0;
    },
    perform_pay: function(event) {
        var that = this;
        var type = that.data.pay_type;
        var item_id = that.data.book_id;
        var book_mode = that.data.book_type;
        if (that.data.isProcessing != 0) return;
        that.data.isProcessing = 1;

        if (that.data.pay_type == 1 && that.data.pay_price != 0) {
            console.log(that.data.pay_price)
            var ordercode = that.data.pay_price;
            var out_trade_no = app.globalData.mch_id + Date.now() + (10000 + Math.floor(Math.random() * 90000))
            console.log(ordercode)
            wx.login({
                success: function(res) {
                    if (res.code) {
                        wx.request({
                            url: app.globalData.mainURL + 'api/pay',
                            data: {
                                id: wx.getStorageSync('openid'), //要去换取openid的登录凭证
                                fee: ordercode,
                                user_id: app.globalData.userInfo.user_id,
                                out_trade_no: out_trade_no
                            },
                            method: 'POST',
                            header: {
                                'content-type': 'application/json'
                            },
                            success: function(res) {
                                wx.requestPayment({
                                    timeStamp: res.data.timeStamp,
                                    nonceStr: res.data.nonceStr,
                                    package: res.data.package,
                                    signType: 'MD5',
                                    paySign: res.data.paySign,
                                    success: function(res) {
                                        if (res.errMsg.length <= 20) {
                                            that.data.out_trade_no = out_trade_no;
                                            that.add_booking();
                                        }
                                    },
                                    fail: function(res) {
                                        // fail
                                    },
                                    complete: function(res) {
                                        that.data.isfirstbtn = 0
                                    }
                                })
                            }
                        })
                    } else {
                        // no weixin returned code
                    }
                }
            });
        } else {
            // offline payment
            that.data.out_trade_no = '';
            that.add_booking();
        }

    },

    add_booking: function() {
        var that = this;
        var share_day = (new Date(that.data.book_date.replace(/-/g, '/') + ' 00:00:00')).getDay();
        var bookDate = new Date(that.data.book_date.replace(/-/g, '/') + ' 00:00:00');
        var info1 = "",
            info2 = "";
        info1 = that.data.site_info.site[0].site_name + ',' +
            bookDate.getFullYear() + '年' +
            (bookDate.getMonth() + 1) + '月' +
            bookDate.getDate() + '日';
        for (var i = 0; i < that.data.bookList.length; i++) {
            var item = that.data.bookList[i];
            if (i != 0) info2 += ',';
            info2 += item.room_name + '(' + item.start + ' - ' + item.end + ')';
        }

        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/addRoomBooking',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                user_id: app.globalData.userInfo.user_id,
                book_date: that.data.book_date,
                share_day: share_day,
                boss_id: that.data.curBossId,
                book_info: that.data.bookList,
                pay_type: that.data.pay_type,
                role: app.globalData.userInfo.role,
                out_trade_no: that.data.out_trade_no,
                phone: that.data.phone,
                name: that.data.name,

                wallet: that.data.wallet,
                pay_cost: that.data.price,
                pay_online: that.data.pay_price,
                pay_honey: ((that.data.check_honey == 1) ? (that.data.honey_id * 1 + 1) * that.data.honey_price_unit : 0),

            },
            success: function(res) {
                // wx.showModal({
                //     content:JSON.stringify(res.data)             
                // })
                // return;
                if (!app.checkValidPhone(that.data.site_info.site[0].phone)) {
                    wx.showToast({
                        title: '电话号不正确，短信无法发送',
                        icon: 'none',
                        duration: 2000
                    })
                    that.data.isProcessing = 0;
                } else {
                    wx.request({
                        url: app.globalData.smsURL,
                        method: 'POST',
                        header: {
                            'content-type': 'application/json'
                        },
                        data: {
                            'phonenumber': that.data.site_info.site[0].phone,
                            'random': '-1',
                            'info1': info1,
                            'info2': info2,
                        },
                        success: function(res) {
                            wx.redirectTo({
                                url: 'booking_final?bid=' + that.data.curBossId + '&uid=' + app.globalData.userInfo.user_id + '&sday=' + share_day,
                                success: function() {
                                    that.data.isfirstbtn = 0
                                }
                            })
                        },
                        complete: function() {
                            that.data.isProcessing = 0;
                        }
                    })
                }
            }
        })
    },

    ////////////////////////////////////////////////////////////////////////

})