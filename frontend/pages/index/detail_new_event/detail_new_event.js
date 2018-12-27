//pages/index/detail_new_event/detail_new_event.js
//获取应用实例
var WxParse = require('../../../wxParse/wxParse.js');
const app = getApp()

Page({
    data: {
        event: {
            start_time: '',
            end_time: '',
            province: '',
            area: '',
            city: '',
            detail_address: '',
            pic: ''

        },
        delta: 0,

        start_date: "2018-08-31",
        remain_day: 37,
        end_date: "08-01",
        img_url: '',
        show_state: false,

        condition_array: ["姓名",
            "电话",
            "球队",
            "俱乐部",
            "性别",
            "身份证号",
            "所在城市",
            "所在大学院系",
            "职业",
            "微信号",
            "邮箱"
        ],
        condition_str: "",
        event_comment: '',
        train_type: ["赛事", "培训"],
        pictures: [],
        id: '',
        focus: false,
        booking: [],
        pay_type_array: ["线下支付", "线上支付", "线上支付/线下支付"],
        eventType: [],
        userRole: [],
        eventState: [],
        feedbacks: [],
        is_full: false,
        is_registered: false,
        register_amount: 0,
        btn_text: '立即报名',
        rating: 0,
        rating_amount: 0,
        fav_img_list: ['../../../image/good_n@2x.png', '../../../image/good_s@2x.png'],
        comment: '',
        selected_index: -1,
        tmr_id: 0,
        my_booking: {},
        tmrID: 0,
        isFirstInit: true,
        isProcessing: false,
    },
    onLoad: function(option) {
        var that = this;
        that.data.options = option;
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
                            //        // that.globalData.initDisabled = true;
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
        var option = this.data.options;
        wx.showLoading({
            title: '加载中',
        })
        this.data.isProcessing = true;
        setTimeout(function() {
            wx.hideLoading()
        }, 2000)
        this.setData({
            userInfo: app.globalData.userInfo,
            eventType: app.globalData.eventType,
            userRole: app.globalData.userRole,
            eventState: app.globalData.eventState
        });
        var that = this;
        that.setData({
            id: option.id
        })

        wx.request({
                url: app.globalData.mainURL + 'api/datamanage/addReadCount',
                method: 'POST',
                header: {
                    'content-type': 'application/json'
                },
                data: {
                    'event_id': that.data.id,
                },
                success: function(res) {
                    that.refresh(1);
                }
            })
            //code for liseter paticipate
    },
    refresh: function(sort_flag) {
        if (sort_flag == undefined) sort_flag = 0;
        var that = this;
        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/getNewEventDetail',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'event_id': that.data.id,
                'user_id': app.globalData.userInfo.user_id
            },
            success: function(res) {

                //get sorted feedback array
                for (let index = 0; index < res.data.feedbacks.length; index++) {
                    var time_array = res.data.feedbacks[index].submit_time.split(":");
                    res.data.feedbacks[index].submit_time = time_array[0] + ":" + time_array[1];
                    var child_array = res.data.feedbacks[index].child_array;
                    if (child_array.length > 0) {
                        for (let idx = 0; idx < child_array.length; idx++) {
                            var times = child_array[idx].submit_time.split(":");
                            var time_str = times[0] + ":" + times[1];
                            var now = Date.now();
                            var tempdate = Date.parse(time_str.replace(/-/g, '/'))
                            if (now - tempdate < 120000) {
                                child_array[idx].submit_time = "刚刚"
                            } else if (now - tempdate < 3600000) {
                                var minute = (now - tempdate) / 60000
                                minute = Math.floor(minute)
                                child_array[idx].submit_time = minute + "分钟前"
                            } else if (now - tempdate < 86400000) {
                                var hour = (now - tempdate) / 3600000
                                hour = Math.floor(hour)
                                child_array[idx].submit_time = hour + "小时前"
                            } else if (now - tempdate < 172800000) {
                                child_array[idx].submit_time = "昨天"
                            } else {
                                var time = child_array[idx].submit_time.split(' ')
                                child_array[idx].submit_time = time[0];
                            }
                        }
                        res.data.feedbacks[index].child_array = child_array;
                    }
                }
                if (sort_flag == 1) {
                    res.data.feedbacks.sort(that.compare_favorite);
                    res.data.feedbacks.sort(that.compare_orgState);
                }

                that.setData({
                    rating: 1 * res.data.favor[0],
                    feedbacks: res.data.feedbacks
                })


                var event_buf = res.data.result[0];
                event_buf.favor_state = 1 * event_buf.favor_state

                // if (event_buf.eventName.length > 15) {
                //     var name = event_buf.eventName
                //     name = name.slice(0, 15) + '...'
                //     event_buf.eventName = name
                // }

                var time = event_buf.start_time.split(':');
                event_buf.start_time = time[0] + ':' + time[1];
                time = event_buf.end_time.split(':');
                event_buf.end_time = time[0] + ':' + time[1];

                var now = Date.now();
                var tempdate = Date.parse(event_buf.end_time.replace(/-/g, '/'))
                var remain_day = Math.floor((tempdate - now) / 86400000);
                var start_date = event_buf.start_time.split(' ')[0];
                var day_array = event_buf.end_time.split(' ')[0].split('-')
                var end_date = day_array[1] + '-' + day_array[2];

                var event_comment = event_buf.comment
                WxParse.wxParse('event_comment', 'html', event_comment, that)

                var picture = event_buf.pic.split(",");
                var images = [];
                if (picture.length != 0) {
                    for (var index = 0; index < picture.length; index++) {
                        images[index] = app.globalData.uploadURL + picture[index]
                    }
                }
                var tempdate = Date.parse(event_buf.start_time.replace(/-/g, '/'))

                var condition_str = '';
                var con_array = event_buf.condition.split(',');
                for (let index = 0; index < con_array.length; index++) {
                    if (con_array[index] == '1') {
                        if (condition_str.length == 0) {
                            condition_str = that.data.condition_array[index]
                        } else {
                            condition_str = condition_str + ',' + that.data.condition_array[index]
                        }
                    }
                }
                if (condition_str.length > 0) {
                    condition_str = '需' + condition_str;
                }

                that.setData({
                    event: event_buf,
                    is_train: event_buf.is_train,
                    id: that.data.id,
                    pictures: images,
                    comment: '',
                    remain_day: remain_day,
                    start_date: start_date,
                    end_date: end_date,
                    condition_str: condition_str
                });
                wx.setNavigationBarTitle({
                    title: that.data.train_type[that.data.is_train] + '详情'
                })

                //get booking
                var books = res.data.booking;
                var registered_num = 0;
                that.setData({ favourite_num: 1 * res.data.result[0].favor_state })
                for (var index = 0; index < books.length; index++) {
                    console.log(books[index].nickname)
                    if (books[index].user_id == app.globalData.userInfo.user_id && books[index].state == '0') {
                        if (books[index].state == '2')
                            that.setData({
                                is_registered: true,
                                is_disabled: true,
                                btn_text: '已取消',
                            })
                        else {
                            that.setData({
                                is_registered: true,
                                is_disabled: true,
                                btn_text: '已报名',
                            })
                            registered_num += 1 * books[index].reg_num;
                        }
                    } else if (books[index].state != '2') {
                        registered_num += 1 * books[index].reg_num;
                    }
                }
                that.setData({
                    register_amount: registered_num,
                })
                for (var iter = 0; iter < books.length; iter++) {
                    if (books[iter].name == null) {
                        books[iter].name = books[iter].nickname
                    }
                }
                that.setData({
                    booking: books
                })

                console.log(that.data.event);
                console.log(that.data.booking);
                console.log(that.data.feedbacks);
                that.show_canvas();
                that.data.isProcessing = false;
            }
        })
    },
    show_canvas: function(options) {
        var that = this;

        console.log('pages/index/detail_new_event/detail_new_event?id=' + that.data.id);
        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/getQR',
            data: {
                access_token: app.globalData.token,
                path: 'pages/index/detail_new_event/detail_new_event?id=' + that.data.id,
                user_id: app.globalData.userInfo.user_id
            },
            method: 'POST',
            header: { 'content-type': 'application/json' },
            success: function(res) {
                console.log(res.data);

                if (res.data.status) {
                    var image_url = app.globalData.mainURL + res.data.data;
                    wx.downloadFile({
                        url: image_url,
                        type: 'image',
                        success: (resp) => {
                            var qr_filePath = resp.tempFilePath;

                            const ctx = wx.createCanvasContext('shareImg')

                            ctx.globalAlpha = 0.4
                            ctx.setFillStyle('#000')
                            ctx.fillRect(0, 0, 600, 200)

                            ctx.globalAlpha = 1.0
                            ctx.setFillStyle('#ffffff')
                            ctx.setFontSize(25)
                            ctx.fillText('我发现了一个很棒的活动，快来和我一起报名,', 50, 90)
                            ctx.fillText('一起运动吧~', 50, 132)


                            var delta_value = 0;
                            var detail_addr = that.data.event.detail_address;
                            if (detail_addr.length > 20) {
                                ctx.setFillStyle('#f5f5f5')
                                    //ctx.setFillStyle('#ffffff')
                                ctx.fillRect(0, 200, 600, 465 - delta_value)
                                ctx.setFillStyle('#000')
                                ctx.fillText(detail_addr.substr(0, 20), 70, 372)
                                ctx.fillText(detail_addr.substr(20), 70, 420)

                            } else {
                                delta_value = 48;
                                ctx.setFillStyle('#f5f5f5')
                                    //ctx.setFillStyle('#ffffff')
                                ctx.fillRect(0, 200, 600, 465 - delta_value)
                                ctx.setFillStyle('#000')
                                ctx.fillText(detail_addr, 70, 372)
                            }
                            that.setData({
                                delta: delta_value
                            })

                            ctx.setFillStyle('#000')
                            ctx.setFontSize(32)
                            ctx.fillText(that.data.event.eventName, 30, 260)

                            ctx.setFontSize(25)
                            ctx.drawImage('../../../image/my_bee_m@2x.png', 30, 292, 32, 36)
                            ctx.fillText('报名费' + that.data.event.cost + '元/人', 70, 318)

                            ctx.drawImage('../../../image/icon_place@2x.png', 31, 345, 27, 42)

                            ctx.drawImage('../../../image/iphone@2x.png', 30, 455 - delta_value, 30, 30)
                            ctx.fillText(that.data.event.agent_phone, 70, 480 - delta_value)
                            ctx.beginPath()
                            ctx.moveTo(20, 525 - delta_value)
                            ctx.lineTo(580, 525 - delta_value)
                            ctx.stroke()
                            ctx.beginPath()
                            ctx.moveTo(300, 545 - delta_value)
                            ctx.lineTo(300, 645 - delta_value)
                            ctx.stroke()

                            ctx.setFontSize(26)
                            ctx.setTextAlign('center')
                            ctx.fillText(that.data.start_date, 150, 575 - delta_value)
                            ctx.setFontSize(24)
                            ctx.setTextAlign('center')
                            ctx.fillText(that.data.train_type[that.data.is_train] + '日期', 150, 625 - delta_value)

                            ctx.setFillStyle('#e6b53c')
                            ctx.setFontSize(28)
                            ctx.setTextAlign('center')
                            ctx.fillText(that.data.remain_day + '天(报满即止)', 450, 575 - delta_value)
                            ctx.setFontSize(24)
                            ctx.setTextAlign('center')
                            ctx.fillText('截止日(' + that.data.end_date + ')', 450, 625 - delta_value)



                            ctx.setFillStyle('#ffffff')
                                // ctx.setFillStyle('#f3f3f3')
                            ctx.fillRect(0, 665 - delta_value, 600, 235)

                            //add varcode image for pages/index/detail_new_event/detail_new_event

                            ctx.drawImage('../../../image/logo@2x.png', 395, 700 - delta_value, 110, 110)
                            ctx.setTextAlign('left')
                            ctx.setFillStyle('#000')
                            ctx.setFontSize(22)
                            ctx.fillText('长按扫码来参加', 370, 850 - delta_value)
                            ctx.drawImage(qr_filePath, 70, 700 - delta_value, 160, 160)
                            ctx.draw()



                        }
                    })

                }
            }
        })
    },

    compare_favorite: function(a, b) {
        if (a.fav_state > b.fav_state)
            return -1;
        if (a.fav_state < b.fav_state)
            return 1;
        return 0;
    },

    compare_orgState: function(a, b) {
        var that = this;
        if (a.user_id == that.data.event.organizer_id)
            return -1;
        if (b.user_id == that.data.event.organizer_id)
            return 1;
        return 0;
    },

    phone_call: function() {
        app.phoneCall(this.data.event.agent_phone)
    },
    set_preview: function() {
        var that = this
        wx.previewImage({
            urls: [that.data.event.pic],
            complete: function() {
                return
            }
        })
    },

    btn_Clicked_Personal_Input: function(event) {
        var that = this;
        if (that.data.isProcessing) return;
        wx.redirectTo({
            url: '../new_event_input/new_event_input?id=' + event.currentTarget.id,
            success: function(res) {},
            fail: function(res) {},
            complete: function(res) {},
        })
    },

    btn_Clicked_Favor: function() {
        var event_buff = this.data.favourite_num
        var rating = this.data.rating
        if (event_buff == 0) {
            event_buff = 1
            this.setData({ favourite_num: event_buff })
            this.data.rating++
                this.setData({ rating: this.data.rating })
        } else {
            event_buff = 0
            this.setData({ favourite_num: event_buff })
            this.data.rating--
                this.setData({ rating: this.data.rating })
        }
        var that = this;
        wx.request({
            url: app.globalData.mainURL + 'api/setFavouriteEvent',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'user_id': app.globalData.userInfo.user_id,
                'event_id': that.data.event.id
            },
            success: function(res) {

            }
        })
    },
    On_input_comment: function(event) {
        this.data.comment = event.detail.value;
    },
    unselect_comment: function() {
        var that = this;
        that.data.tmr_id = setTimeout(function() {
            console.log("deselected");
            that.setData({
                selected_index: -1,
            })
        }, 500);
    },




    select_feedback: function(event) {
        var that = this;
        clearTimeout(that.data.tmr_id);
        that.setData({
            focus: true,
            selected_index: event.currentTarget.id
        });
        console.log('selected item');
        console.log(that.data.selected_index);
    },

    add_feedback: function() {
        var that = this;
        console.log('clicked feedback button');
        clearTimeout(that.data.tmr_id);
        if (that.data.comment == '') {
            return;
        }
        if (that.data.selected_index < 0) {
            //add new(parent) comment
            wx.showLoading({
                title: '发表中',
            })
            setTimeout(function() {
                wx.hideLoading()
            }, 500)
            wx.request({
                url: app.globalData.mainURL + "api/addFeedback",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    event_id: that.data.event.id,
                    user_id: app.globalData.userInfo.user_id,
                    comment: that.data.comment
                },
                success: function(res) {
                    that.setData({
                        selected_index: -1,
                        comment: ''
                    })
                    that.refresh();
                }
            });
        } else {
            //add child comment
            console.log(that.data.selected_index);
            var parent = that.data.feedbacks[that.data.selected_index];
            wx.showLoading({
                title: '发表中',
            })
            setTimeout(function() {
                wx.hideLoading()
            }, 500)
            wx.request({
                url: app.globalData.mainURL + "api/datamanage/addChildFeedback",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    event_id: that.data.event.id,
                    user_id: app.globalData.userInfo.user_id,
                    comment: that.data.comment,
                    parent_no: parent.no
                },
                success: function(res) {
                    that.setData({
                        selected_index: -1
                    })
                    that.refresh();
                }
            });
        }

    },

    submit_event_favorite: function(event) {
        console.log(event.currentTarget.id);
        var that = this;
        var feedback_id = that.data.feedbacks[event.currentTarget.id].no;
        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/setFavouriteFeedback',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                'user_id': app.globalData.userInfo.user_id,
                'feedback_id': feedback_id
            },
            success: function(res) {
                that.refresh();
            }
        })
    },
    goto_mapView: function() {
        //view event location in map
        var that = this;
        wx.openLocation({
            latitude: parseFloat(that.data.event.latitude),
            longitude: parseFloat(that.data.event.longitude)
        })

        // wx.navigateTo({
        //     url: "view_map?latitude=" + that.data.event.latitude + "&longitude=" + that.data.event.longitude
        // })


    },
    onclick_viewUserInfo: function(event) {
        //go to userinfo view screen.
        var that = this;
        var index = event.currentTarget.id;
        var user_id = that.data.booking[index].user_id;
        console.log(user_id);
        wx.navigateTo({
            url: "../../profile/profile_friend?id=" + user_id + '&type=0'
        })

    },
    onclick_goHome: function() {
        wx.switchTab({
            url: '../index',
            success: function() {
                wx.showTabBar({})
            }
        })
    },



    downlaod_img: function() {
        //download image
        var that = this
        wx.showLoading({
            title: '加载中...'
        })
        setTimeout(function() {
                wx.hideLoading()
            }, 500)
            //convert canvas to image file
        wx.canvasToTempFilePath({
            x: 0,
            y: 0,
            width: 600,
            height: 900 - that.data.delta,
            destWidth: 600,
            destHeight: 900 - that.data.delta,
            canvasId: 'shareImg',
            success: function(res) {
                that.setData({
                    img_url: res.tempFilePath,
                    show_state: true
                })

                // save imgage to album
                wx.saveImageToPhotosAlbum({
                    filePath: that.data.img_url,
                    success(res) {
                        wx.showToast({
                            title: '已保存至相册，记得分享哦',
                            icon: 'none',
                            duration: 2000
                        })
                    }
                })

            },
            fail: function(res) {
                console.log(res)
            }
        })
    },

    hide_canvas: function() {
        var that = this;
        that.setData({
            show_state: false
        })
    },

    show_preview: function(res) {
        console.log(res)
        var that = this
        wx.previewImage({
            current: that.data.pictures[1 * res.currentTarget.id],
            urls: that.data.pictures,
        })
    },

    onShareAppMessage: function(res) {
        console.log("SHARED")
        if (res.from === 'button') {
            console.log(res.target)
        }
        var that = this;
        wx.request({
            url: app.globalData.mainURL + 'api/datamanage/addShareCount',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            data: {
                user_id: app.globalData.userInfo.user_id,
                event_id: that.data.event.id
            },
            success: function(res) {}
        });

        var sport = parseInt(that.data.event.type);

        var title = "鹿死谁手, 一起来参加" + app.globalData.eventType[sport] + "比赛决一雌雄";
        if (that.data.event.is_train == '1') {
            title = "这个培训不错哦，快来参加" + app.globalData.eventType[sport] + "培训班吧";
        }

        return {
            title: title,
            path: '/pages/index/detail_new_event/detail_new_event?id=' + that.data.event.id,
            success: function(res) {},
            fail: function(res) {}
        }
    }
})