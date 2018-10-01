// pages/booking/booking.js
const app = getApp();

Page({

    /**
     * 页面的初始数据
     */
    data: {
        active1: "active",
        active2: "",
        active3: "",
        booking: [],
        selectedtab: 1,
        eventType: [],
        userRole: [],
        bookingState: ["已支付", "进行中", "已完成", "已取消"],
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(query) {
        this.setData({
            userInfo: app.globalData.userInfo,
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole
        });

    },
    onShow: function() {
        var that = this;
        var active_tab = app.globalData.selected_booking_tab;
        switch (active_tab) {
            case 0:
                that.setData({
                    selectedtab: 1,
                    active1: "active",
                    active2: "",
                    active3: ""
                })
                break;
            case 1:
                that.setData({
                    selectedtab: 2,
                    active1: "",
                    active2: "active",
                    active3: ""
                })
                break;
            case 2:
                that.setData({
                    selectedtab: 3,
                    active1: "",
                    active2: "",
                    active3: "active"
                })
                break;
            default:
                break;
        }
        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/getMyRoomBooking',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {
                if (res.data.status == true) {
                    console.log(res.data)
                    var book = res.data.result;
                    if (book != null) {
                        for (var index = 0; index < book.length; index++) {
                            var tempdate;
                            tempdate = book[index].end_time.split(" ")
                            book[index].end_time = tempdate[1];
                            if (book[index].site_name.length > 14) {
                                var site_name = book[index].site_name
                                site_name = site_name.slice(0, 14) + '..'
                                book[index].site_name = site_name
                            }
                            if (book[index].is_rating == null) {
                                book[index].is_rating = 0;
                            }

                            var time = book[index].start_time.split(':');
                            book[index].start_time = time[0] + ':' + time[1];

                            var time1 = book[index].end_time.split(':');
                            book[index].end_time = time1[0] + ':' + time1[1];
                            book[index].roll_state = 0; //my room booked state
                        }
                        that.setData({
                            booking: book
                        })
                    }
                } else {
                    that.setData({ booking: [] });
                }
                wx.request({
                    url: app.globalData.mainURL + 'api/datamanage/getRoomBookingByBossID',
                    method: 'POST',
                    header: {
                        'content-type': 'application/json'
                    },
                    data: {
                        'user_id': app.globalData.userInfo.user_id
                    },
                    success: function(res1) {
                        if (res1.data.status == false) return
                        var book_order = res1.data.result;
                        if (book_order != null) {
                            for (var index = 0; index < book_order.length; index++) {
                                var tempdate;
                                tempdate = book_order[index].end_time.split(" ")
                                book_order[index].end_time = tempdate[1];
                                if (book_order[index].site_name.length > 14) {
                                    var site_name = book_order[index].site_name
                                    site_name = site_name.slice(0, 14) + '..'
                                    book_order[index].site_name = site_name
                                }
                                if (book_order[index].is_rating == null) {
                                    book_order[index].is_rating = 0;
                                }

                                var time = book_order[index].start_time.split(':');
                                book_order[index].start_time = time[0] + ':' + time[1];

                                var time1 = book_order[index].end_time.split(':');
                                book_order[index].end_time = time1[0] + ':' + time1[1];
                                book_order[index].roll_state = 1; //my room booked state
                                if (!that.data.booking._find(item => item.id == book_order[index].id)) {
                                    that.data.booking.push(book_order[index])
                                }
                            }
                            that.setData({
                                booking: that.data.booking
                            })
                            console.log(that.data.booking);
                            that.showevent(0)
                        }
                    }
                })
            }
        })
    },
    showevent: function(tabtype) {
        var book = this.data.booking
        if (book == null) return
        if (book.length < 2) {
            this.setData({
                booking: book,
            })
            return;
        }
        var temp
        console.log(book[0].start_time > book[1].start_time)
        if (tabtype == 0) {
            for (var i = 0; i < book.length - 1; i++) {
                for (var j = i + 1; j < book.length; j++) {
                    if (book[i].start_time < book[j].start_time) {
                        temp = book[i]
                        book[i] = book[j]
                        book[j] = temp
                    }
                }
            }
        }
        if (tabtype == 1) {
            for (var i = 0; i < book.length - 1; i++) {
                for (var j = i + 1; j < book.length; j++) {
                    if (book[i].end_time < book[j].end_time) {
                        temp = book[i]
                        book[i] = book[j]
                        book[j] = temp
                    }
                }
            }
        }
        this.setData({
            booking: book
        })
    },
    /**
     * This function is called after user select one of the tabs
     */
    selectTab: function(event) {
        this.setData({ active1: " " });
        this.setData({ active2: " " });
        this.setData({ active3: " " });
        switch (event.currentTarget.id) {
            case "btn1":
                this.setData({ active1: "active" });
                this.setData({ selectedtab: 1 });
                app.globalData.selected_booking_tab = 0;
                this.showevent(0)
                break;
            case "btn2":
                this.setData({ active2: "active" });
                this.setData({ selectedtab: 2 });
                app.globalData.selected_booking_tab = 1;
                this.showevent(1)
                break;
            case "btn3":
                this.setData({ active3: "active" });
                this.setData({ selectedtab: 3 });
                app.globalData.selected_booking_tab = 2;
                this.showevent(2)
                break;
        }
    },
    //called when user wants to see detail
    click_detail_event: function(event) {
        wx.navigateTo({
            url: 'booking_detail?id=' + event.currentTarget.id,
        })
    },
    //called when user wants to write comment
    btn_write_comment: function(event) {
        var index = event.currentTarget.id;
        wx.navigateTo({
            url: 'book_evaluation?id=' + this.data.booking[index].id + '&room_id=' + this.data.booking[index].room_id
        })
    }
})