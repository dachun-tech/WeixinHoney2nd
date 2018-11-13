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
        cancel_time: 0,
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
        curDate: 0,
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
        tmrID: 0,
        isFirstInit: true,
    },
    onLoad: function(option) {
        var that = this;
        that.data.options = option;
        that.data.curBossId = option.id;
        that.data.curUserId = app.globalData.userInfo.user_id;
        that.data.curDate = new Date();
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
        var options = this.data.options;
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
        that.data.cancel_time = site.cancel_time;
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
          if (i == 0 && site.end1 == site.start2) {
              tmp.setTime(tmp.getTime() + time_step * 3600000);
              continue;
            }
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
                for (var jj = 0; jj < booking.length; jj++) {
                    var bookRecord = JSON.parse(booking[jj].book_info);
                    var isBreak = false;
                    if (booking[jj].state == 3) continue;
                    for (var mm = 0; mm < bookRecord.length; mm++) {
                        var item = bookRecord[mm];
                        if (status == 0) continue;
                        if (item.room_id != room[i].id) continue;
                        if (item.state == 3) continue;
                        if (curstart >= (new Date(item.start_time.replace(/-/g, '/'))) &&
                            curend <= (new Date(item.end_time.replace(/-/g, '/')))) {
                            status = 4;
                            cost = -cost;
                            room[i].user_id = item.user_id;
                            room[i].book_id = booking[jj].id;
                            isBreak = true;
                            break;
                        }
                    }
                    if (isBreak) break;
                }

                if (curend < new Date()) status = 0;
                if ((status == 1 || status == 4) && room[i].user_id != app.globalData.userInfo.user_id)
                    status = 0;
                arr.push({
                    cost: cost,
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
    calculatePrice: function() {
        var that = this;
        var bookData = that.data.bookList;
        var uploads = [];
        var totalPrice = 0;

        var curTime = new Date();

        for (let i = 0; i < bookData.length; i++) {
            var element = [];
            element.push(bookData[i]);
            element = element[0];
            for (let j = 0; j < element.length; j++) {
                var item = [];
                item.push(element[j]);
                item = item[0];
                if (item.user_id == app.globalData.userInfo.user_id && item.status == 1) {
                    var start = new Date(item.start_time);
                    var end = new Date(item.end_time);
                    item.state = 0;
                    if (item.status == 2) //already cancelled
                        item.state = 3;
                    else if (item.status == 1 && curTime <= start) // already booked
                        item.state = 0;
                    else if (curTime >= end) // already expired
                        item.state = 2;
                    else if (curTime >= start && curTime <= end)
                        item.state = 1;
                    uploads.push(item);
                    totalPrice += parseFloat(item.cost);
                }
            }
        }
        that.data.totalPrice = totalPrice;
        that.setData({ totalPrice: totalPrice.toFixed(2) });
    },
    bookRoom: function(event) {
        var that = this;
        var param = event.target.id;
        var roomid = parseInt(param.split('-')[1]);
        var timeid = parseInt(param.split('-')[0]);
        var start = that.data.timeList[timeid];
        var end = that.data.timeList[timeid + 1];
        var room = that.data.bookList[timeid][roomid];

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
                var booked_time = new Date(that.data.refDate + start);
                var curTime = new Date();
                booked_time.setTime(booked_time.getTime() - 3600000 * that.data.cancel_time);
                if (true || curTime > booked_time) {
                    // wx.showToast({
                    //     title: '预订取消时间已过去了',
                    //     icon: 'none',
                    //     duration: 2000
                    // });
                    if (room.user_id == app.globalData.userInfo.user_id)
                        that.data.bookList[timeid][roomid].status = 2;
                } else {
                    if (room.user_id != app.globalData.userInfo.user_id) {
                        wx.showToast({
                            title: '此号场已经被预订了',
                            icon: 'none',
                            duration: 2000
                        });
                    } else {
                        that.data.bookList[timeid][roomid].status = 2;
                    }
                }
                break;
            case 4: // previous booked
                // that.data.bookList[rowid][timeid].status = 2;
                var booked_time = new Date(that.data.refDate + start);
                var curTime = new Date();
                booked_time.setTime(booked_time.getTime() - 3600000 * that.data.cancel_time);
                if (false && curTime > booked_time) {
                    wx.showToast({
                        title: '预订取消时间已过去了',
                        icon: 'none',
                        duration: 2000
                    });
                } else {
                    wx.showToast({
                        title: '请取消 在“我的>我的预订”菜单中',
                        icon: 'none',
                        duration: 2000
                    });
                }
                break;
            case 2: //enabled
                var booked_time = new Date(that.data.refDate + start);
                var curTime = new Date();
                if (curTime > booked_time) {
                    wx.showToast({
                        title: '预订时间已过去了',
                        icon: 'none',
                        duration: 2000
                    });
                } else {
                    that.data.bookList[timeid][roomid].status = 1;
                    that.data.bookList[timeid][roomid].user_id = app.globalData.userInfo.user_id;
                    that.data.bookList[timeid][roomid].book_id = (room.book_id == undefined) ? '' : room.book_id;
                }
                break;
        }
        if (room.status == '0')
            console.log(room);
        that.calculatePrice();
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
                // if (item.user_id == app.globalData.userInfo.user_id && (item.status == 1 || item.status == 4)) {
                if (item.user_id == app.globalData.userInfo.user_id && (item.status == 1)) {
                    var start = new Date(item.start_time);
                    var end = new Date(item.end_time);
                    item.state = 0;
                    if (item.status == 2) //already cancelled
                        item.state = 3;
                    else if (item.status == 1 && curTime <= start) // already booked
                        item.state = 0;
                    else if (curTime >= end) // already expired
                        item.state = 2;
                    else if (curTime >= start && curTime <= end)
                        item.state = 1;
                    uploads.push(item);
                }
            }
        }
        uploads.sort(function(a, b) { return (parseInt(a.room_id) > parseInt(b.room_id)) ? 1 : -1; });
        uploads.sort(function(a, b) {
            if (parseInt(a.room_id) > parseInt(b.room_id)) return 1;
            else if (parseInt(a.room_id) < parseInt(b.room_id)) return -1;
            else
                return (a.start_time > b.start_time) ? 1 : -1;
        });

        wx.setStorageSync("book_date", that.data.refDate);
        wx.setStorageSync("book_info", uploads);
        if (that.data.totalPrice > 0) {
            wx.redirectTo({
                url: '../../profile/my_booking/booking_user_detail?id=' + that.data.curBossId
            })
        }
        return;
    },
    selectDate: function(event) {
        var that = this;
        var id = event.currentTarget.id;
        id = parseInt(id.split('-')[1]);
        that.data.curDate = (new Date()).setDate((new Date()).getDate() + id);
        that.data.curDate = new Date(that.data.curDate);
        that.makeList();
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
        var sport = parseInt(that.data.site.site[0].site_type);
        var title = "这家" + app.globalData.eventType[sport] + "场馆不错哦, 快来预定吧";
        if (sport == 28)
            title = "这家" + app.globalData.eventType[sport] + "不错哦, 快来购买吧"
        else if (sport == 31)
            title = "这家综合运动场馆不错哦, 快来预定吧"
        else if (sport == 32)
            title = "这家运动场馆不错哦, 快来预定吧"

        return {
            title: title, // '../detail_gym/detail_gym?id='+ event.currentTarget.id,
            path: '/pages/index/detail_gym/detail_gym?id=' + that.data.site.site[0].boss_id +
                '&user_id=' + app.globalData.userInfo.user_id +
                '&nickname=' + app.globalData.userInfo.nickname +
                '&atype=1',
            success: function(res) {},
            fail: function(res) {}
        }
    },
})