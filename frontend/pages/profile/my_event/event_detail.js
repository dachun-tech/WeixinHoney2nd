// pages/booking/bookingCancel.js
const app = getApp();

Page({

    /**
     * 页面的初始数据
     */
    data: {
        img_black_start_src: '../../../image/star_n@2x.png',
        img_yellow_start_src: '../../../image/star_s@2x.png',
        count_yellowStar: 3,
        booking: [],
        eventType: [],
        userRole: [],
        bookingState: [],
        register_num: 0,
        bookingcanceltime: 1,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(query) {
        this.setData({
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole,
            bookingState: app.globalData.eventState
        });
        var that = this;
        var id = query.id;

        wx.request({
            url: app.globalData.mainURL + 'api/getBookingDetail',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'booking_id': id,
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {
                console.log(res)
                var book = res.data.result[0];
                if (book != null) {
                    var avatar = book.pic.split(",")[0];
                    book.avatar = app.globalData.uploadURL + avatar;
                    book.idshow = '0000000000'
                    book.idshow = book.idshow.slice(0, 10 - book.id.length) + book.id
                    var time = book.start_time.split(':');
                    var register = res.data.register_num[0].register_num
                    if (register == null) register = 0;
                    book.start_time = time[0] + ':' + time[1];
                    time = book.end_time.split(':')
                    book.end_time = time[0] + ':' + time[1]

                    if (book.name.length > 12) {
                        var name = book.name
                        name = name.slice(0, 12) + '..'
                        book.name = name
                    }
                    that.data.booking = book;
                    that.setData({
                        booking: book,
                        rating: res.data.rating,
                        register_num: register
                    })
                    console.log(book.cost * book.reg_num)
                }
            }
        })
    },

    phone_call: function() {
        app.phoneCall(this.data.booking.agent_phone);
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
})