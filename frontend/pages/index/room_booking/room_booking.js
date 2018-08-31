var app = getApp();

require('../../../utils/global.js');

Page({
    data: {
        site: [],
        rooturl: "../../../",
        event: [],
        isFavourite: false,
        pictures: [],
        eventType: [],
        options: [],
        userRole: [],
        eventState: [],
        favourite_image: ['../../../image/favoriting.png', '../../../image/favorited.png'],
        image_favs: ['../../../image/good_n@2x.png', '../../../image/good_s@2x.png'],
        starparam: {
            stars: [0, 1, 2, 3, 4],

            srcImage_0: '../../../image/star-0.png',
            srcImage_1: '../../../image/star-1.png',
            srcImage_2: '../../../image/star-2.png',
            srcImage_3: '../../../image/star-3.png',
            srcImage_4: '../../../image/star-4.png',

            score: 4.3,
            srcImage: '',
        },
        weekStr: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        curDate: '',
        curBossId: '',
        curUserId: '',
        dateList: [],
        timeList: [],
        roomList: [],
        weekList: [],
        bookList: [
            { "room_name": "一号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
            { "room_name": "二号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
            { "room_name": "三号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
            { "room_name": "四号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
            { "room_name": "五号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
            { "room_name": "六号场", "cost": "150", "status": "0" }, // status ==0:enabled, 1:disabled, 2:booked
        ],
        totalPrice: 0,
        originalPrice: 0,
    },
    onLoad: function(option) {
        var that = this;
        that.data.options = option;
        that.data.curBossId = option.id;
        that.data.curUserId = app.globalData.userInfo.user_id;
        that.data.curDate = new Date();
    },

    onShow: function() {
        var that = this;

        if (app.globalData.userInfo.user_id == 0) {
            app.onLaunch();
            setTimeout(function() {
                that.onInitStart(that.data.options);
            }, 4000);
        } else {
            that.onInitStart(that.data.options);
        }
        wx.hideTabBar({})
    },

    makeList: function() {

        var that = this;
        var da = new Date();
        var data = that.data.site;
        var cur = that.data.curDate;
        that.data.refDate = that.data.curDate.toDateString() + ' ';
        var weekStr = that.data.weekStr;
        that.data.dateList = [];
        for (var index = 0; index < 7; index++) {
            var month = da.getMonth() + 1;
            var day = da.getDate();
            var str = '';
            var isToday = '';
            if (day == (new Date()).getDate()) {
                str += '今天';

            }
            if (day == that.data.curDate.getDate()) {
                isToday = 'cur';
            }

            str += '(' + month + '-' + day + ')';
            that.data.dateList.push({
                date: str,
                istoday: isToday,
                weekday: weekStr[da.getDay()]
            });

            da.setDate(da.getDate() + 1);
        }

        var site = data.site[0];
        var room = data.site_room;
        var booking = data.site_booking;

        var start1_time = new Date(that.data.refDate + ' ' + site.start1);
        var end1_time = new Date(that.data.refDate + site.end1);
        var start2_time = new Date(that.data.refDate + site.start2);
        var end2_time = new Date(that.data.refDate + site.end2);
        var diff1 = end1_time.getHours() - start1_time.getHours();
        var diff2 = end2_time.getHours() - start2_time.getHours();
        var time_step = parseFloat(site.service_unit); // unit:hour
        var service_time = site.service_time.split(',');


        that.data.timeList = [];

        var tmp = new Date(start1_time.toString());
        for (var i = 0; i < diff1 + time_step; i += time_step) {
            if (tmp > end1_time) tmp = new Date(end1_time.toString());
            var hr = tmp.getHours();
            var min = tmp.getMinutes();
            that.data.timeList.push(that.setDigit(hr, 2) + ':' + that.setDigit(min, 2));
            tmp.setTime(tmp.getTime() + time_step * 3600000);
        }
        var tmp = new Date(start2_time.toString());
        for (var i = 0; i < diff2 + time_step; i += time_step) {
            if (tmp > end2_time) tmp = new Date(end2_time.toString());
            var hr = tmp.getHours();
            var min = tmp.getMinutes();
            that.data.timeList.push(that.setDigit(hr, 2) + ':' + that.setDigit(min, 2));
            tmp.setTime(tmp.getTime() + time_step * 3600000);
        }

        that.data.roomList = [];
        that.data.bookList = [];

        for (var i = 0; i < room.length; i++) {
            that.data.roomList.push(room[i].room_name);
        }

        that.data.totalPrice = 0;
        for (var kk = 0; kk < that.data.timeList.length - 1; kk++) {
            var arr = [];
            for (var i = 0; i < room.length; i++) {
                var cost = room[i].cost;

                var status = 0; // 0 - disabled, 1- booked, 2- enabled
                var curstart = new Date(that.data.refDate + that.data.timeList[kk]);
                var curend = new Date(that.data.refDate + that.data.timeList[kk + 1]);

                if (curstart >= start1_time && curend <= end1_time) {
                    status = 1;
                }
                if (curstart >= start2_time && curend <= end2_time) {
                    status = 1;
                }
                for (var mm = 0; mm < service_time.length; mm++) {
                    if (status == 0) continue;
                    if (curstart.getDay() == (parseInt(service_time[mm]) % 7)) {
                        status = 2;
                        break;
                    }
                }
                if (status == 1) {
                    status = 0;
                }

                for (var mm = 0; mm < booking.length; mm++) {
                    var item = booking[mm];
                    if (status == 0) continue;
                    if (item.room_id != room[i].id) continue;
                    if (curstart >= (new Date(item.start_time)) &&
                        curend <= (new Date(item.end_time))) {
                        status = 1;
                        room[i].user_id = item.user_id;
                        room[i].book_id = item.id;
                        break;
                    }
                }
                arr.push({
                    cost: '￥' + cost,
                    status: status,
                    room_id: room[i].id,
                    book_id: room[i].book_id,
                    user_id: room[i].user_id,
                    room_name: room[i].room_name,
                    start: that.data.timeList[kk],
                    end: that.data.timeList[kk + 1],
                    start_time: curstart.getTime(),
                    end_time: curend.getTime(),
                });
                if (status == 1) that.data.totalPrice += parseFloat(cost);
            }

            that.data.originalPrice = that.data.totalPrice;

            that.data.bookList.push(arr);
        }

        that.setData({
            dateList: that.data.dateList,
            roomList: that.data.roomList,
            timeList: that.data.timeList,
            bookList: that.data.bookList,
            totalPrice: that.data.totalPrice
        });
    },
    bookRoom: function(event) {
        var that = this;
        var param = event.target.id;
        var rowid = parseInt(param.split('-')[0]);
        var timeid = parseInt(param.split('-')[1]);
        var start = that.data.timeList[timeid];
        var end = that.data.timeList[timeid + 1];
        var room = that.data.bookList[rowid][timeid];

        switch (room.status) {
            case 0: // disabled
                wx.showToast({
                    title: '这个情况下不能被预订',
                    icon: 'none',
                    duration: 2000
                });
                break;
            case 1: // booked
                // that.data.bookList[rowid][timeid].status = 2;
                if (room.user_id != app.globalData.userInfo.user_id) {
                    wx.showToast({
                        title: '此号场已经被预订了',
                        icon: 'none',
                        duration: 2000
                    });
                } else {
                    that.data.bookList[rowid][timeid].status = 2;
                }
                break;
            case 2: //enabled
                that.data.bookList[rowid][timeid].status = 1;
                that.data.bookList[rowid][timeid].user_id = app.globalData.userInfo.user_id;
                that.data.bookList[rowid][timeid].book_id = (room.book_id == undefined) ? '' : room.book_id;
                break;
        }
        if (room.status == '0')
            console.log(room);
        that.setData({
            bookList: that.data.bookList
        })
    },
    applyBooking: function() {
        var that = this;
        var bookData = that.data.bookList;
        var uploads = [];
        var curTime = new Date();
        for (let i = 0; i < bookData.length; i++) {
            var element = [];
            element.push(bookData[i]);
            element = element[0];
            for (let j = 0; j < element.length; j++) {
                var item = [];
                item.push(element[j]);
                item = item[0];
                if (item.user_id == app.globalData.userInfo.user_id) {
                    var start = new Date(item.start_time);
                    var end = new Date(item.end_time);
                    item.state = 0;
                    if (item.status == 2) //already cancelled
                        item.state = 3;
                    else if (item.status == 1 && curTime <= start) // already booked
                        item.state = 0;
                    else if (curTime >= end) // already expired
                        item.state = 2;

                    uploads.push(item);
                }
            }
        }
        wx.request({
            url: app.globalData.mainURL + 'api/setBookData',
            header: {
                'content-type': 'application/json'
            },
            method: 'POST',
            data: {
                'user_id': app.globalData.userInfo.user_id,
                'bookData': JSON.stringify(uploads)
            },
            success: function(res) {
                console.log(res.data);
                if (res.data.status) {
                    wx.switchTab({
                        url: '../index'
                    })
                }
            }
        })
    },
    selectDate: function(event) {
        var that = this;
        var id = event.currentTarget.id;
        id = parseInt(id.split('-')[1]);
        that.data.curDate = (new Date()).setDate((new Date()).getDate() + id);
        that.data.curDate = new Date(that.data.curDate);
        that.makeList();
    },
    onInitStart: function(options) {
        this.setData({
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole,
            bookingState: app.globalData.eventState,
            eventState: app.globalData.eventState
        });
        var id = this.data.curBossId;
        var that = this;
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
                        that.data.site = res.data;
                        that.makeList();
                    }
                }
            })
            // set swiper image
    },
    setDigit: function(num, length) {
        var r = "" + num;
        while (r.length < length) {
            r = "0" + r;
        }
        return r;
    },
    onShareAppMessage: function(res) {
        console.log("SHARED")
        if (res.from === 'button') {
            console.log(res.target)
        }
        var that = this;
        return {
            title: that.data.site.site_name, // '../detail_gym/detail_gym?id='+ event.currentTarget.id,
            path: '/pages/index/detail_gym/detail_gym?id=' + that.data.site.boss_id +
                '&user_id=' + app.globalData.userInfo.user_id +
                '&nickname=' + app.globalData.userInfo.nickname +
                '&atype=1',
            success: function(res) {},
            fail: function(res) {}
        }
    },
})