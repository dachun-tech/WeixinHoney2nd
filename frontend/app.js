//app.js
var WXBizDataCrypt = require('./utils/RdWXBizDataCrypt.js');

App({
    globalData: {
        selected_booking_tab: 0,
        appid: 'wxea381fb0ca7c2a24', //appid needs to provide it yourself, here appid I randomly  
        secret: 'fengtiWeixin17642518820android12', //secret is required to provide, where the secret I wrote 
        mch_id: '1500220062',
        userInfo: {
            'nickname': 'WeiXin',
            'avatar': '',
            'user_id': 0,
            'name': '',
            'phone': '',
            'honey': 0,
            'state': 0,
            'forbidden': 0,
            'isVIP': 0,
            eventData: {
                "ground_image": "",
                "act_type": "",
                "act_status": "",
                "favourite": 0,
                "act_name": "",
                "member_count": 0,
                "cost": 0,
                "act_date": " ",
                "address": "",
                "ground_name": "",
                "ground_owner": "",
                "max_member": 0,
                "act_intro": ""
            },
        },
        getUserInfoDisabled: false,
        getUserLocationDisabled: false,
        getWerunDataDisabled: false,
        initDisabled: false,
        address: [],
        productState: ["待发货", "待收货", "交易成功"],
        eventState: ["进行中", "已完成", "已取消"],
        userRole: ['无', '场馆主', '个人'],
        eventType: ['足球', '篮球', '台球', '排球', '网球', '壁球', '瑜伽', '舞蹈', '电竞', '爬山', '轮滑', '武术',
            '旅游', '滑冰', '滑雪', '拳击', '跑步', '棋牌', '户外', '健身', '游泳', '桌游', '骑行', '羽毛球',
            '乒乓球', '保龄球', '跆拳道', '高尔夫', '运动装备', '射击射箭', '轰趴聚会', '综合场馆', '其他'
        ],
        memberState: ['使用中', '已过期'],
        exchangeState: ['待发货', '待收货', '交易成功'],
        bindingState: ['提现中', '提现成功', '提现失败'],
        mainURL: 'https://www.fengteam.cn/backend2/',
        smsURL: 'https://www.fengteam.cn/sms/SendTemplateSMS.php',
        uploadURL: 'https://www.fengteam.cn/backend2/uploads/',
        // mainURL: 'https://127.0.0.1/honey/',
        // smsURL: 'https://www.fengteam.cn/sms/SendTemplateSMS.php',
        // uploadURL: 'https://127.0.0.1/honey/uploads/',
        honey_info: {
            total_honey: 0,
            honeybox_array: [],
        },
        template: [],
        daily_honey: [0, 0],
        isactivetime: 1,
        rule: '',
        step: 0,
        laststep: 0,
        see_news: 0,
        have_stadium: 0,
        issearch: 0,
        searchlat: 0,
        searchlong: 0,
        currentCityName: '',
        ischooseimage: 0,
        iscreatepage: 0,
        nickname_buf: '',
        isFirstLaunch: false,
    },
    onLaunch: function() {},
    onAuthorize: function() {
        var that = this;
        // wx.getSetting({
        //     success: function(res) {
        //         var perm = res;

        //         that.globalData.getUserInfoDisabled = !perm.authSetting['scope.userInfo'];
        //         that.globalData.getUserLocationDisabled = !perm.authSetting['scope.userLocation'];
        //         that.globalData.getWerunDataDisabled = !perm.authSetting['scope.werun'];

        //         if (!that.globalData.getUserInfoDisabled && !that.globalData.getUserLocationDisabled && !that.globalData.getWerunDataDisabled) {
        //             that.onInitialize();
        //             return;
        //         }

        //         if (perm.authSetting['scope.userInfo'] != true) {
        //             that.globalData.initDisabled = true;
        //         } else {
        //             wx.authorize({
        //                 scope: 'scope.userLocation',
        //                 fail: function() {
        //                     that.globalData.initDisabled = true;
        //                 },
        //                 complete: function() {
        //                     wx.authorize({
        //                         scope: 'scope.werun',
        //                         fail: function() {
        //                             that.globalData.initDisabled = true;
        //                         },
        //                         complete: function() {
        //                             if (that.globalData.initDisabled)
        //                                 that.go2Setting();
        //                             else {
        //                                 that.globalData.getUserInfoDisabled = false;
        //                                 that.onInitialize();
        //                                 isFirstLaunch = false;
        //                             }
        //                         }
        //                     })
        //                 }
        //             });
        //         }
        //     }
        // });
    },
    go2Setting: function() {
        wx.openSetting({});
        // this.onAuthorize();
        // wx.navigateBackMiniProgram({})
    },
    onInitialize: function() {
        // wx.setTabBarStyle({
        //         color: '#888888',
        //         selectedColor: '#472E00',
        //         backgroundColor: '#ffffff'
        //     })
        // wx.setNavigationBarColor({
        //     frontColor: '#000000',
        //     backgroundColor: '#ffffff',
        // })
        var _this = this
        _this.getLocation();

        wx.request({
            url: _this.globalData.mainURL + 'api/getRules',
            method: 'POST',
            header: {
                'content-type': 'application/json'
            },
            success: function(res) {
                _this.globalData.rule = res.data.rule
            },
        })
        wx.login({
            success: function(res) {
                _this.globalData.user_code = res.code;
                wx.request({
                    url: _this.globalData.mainURL + "api/getopenid",
                    data: {
                        code: _this.globalData.user_code
                    },
                    method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT    
                    header: {
                        'content-type': 'application/json'
                    }, // 设置请求的 header    
                    success: function(res) {
                        var obj = {};
                        _this.globalData.token = res.data.token;
                        obj.openid = res.data.openid;
                        obj.expires_in = Date.now() + res.data.expires_in;
                        _this.globalData.open_id_info = obj;
                        wx.setStorageSync('openid', res.data.openid); //存储openid 
                        wx.setStorageSync('session_key', res.data.session_key)
                        _this.getUserDetail(obj);

                        wx.getWeRunData({
                            success: function(res) {
                                var encryptedData = res.encryptedData;
                                console.log("getWerunData", encryptedData);
                                var iv = res.iv;
                                var pc = new WXBizDataCrypt(_this.globalData.appid, wx.getStorageSync('session_key'));
                                var data = pc.decryptData(encryptedData, iv)
                                wx.setStorageSync('user_step', data.stepInfoList.pop().step * 1)
                                wx.setStorageSync('last_step', data.stepInfoList.pop().step * 1)
                                _this.globalData.user_step = data.stepInfoList.pop().step * 1;
                                _this.globalData.laststep = data.stepInfoList.pop().step * 1;
                                console.log('User step is ', wx.getStorageSync('user_step'));
                            }
                        })
                        console.log("getUserInfo Started")
                    }
                });

            }
        })
        _this.globalData.userInfo.nickname = _this.globalData.nickname
    },
    onHide: function() {
        wx.setStorageSync('honey_info', this.globalData.honey_info)
    },
    getUserDetail: function(obj) {
        var _this = this;
        wx.getUserInfo({
            success: function(res) {
                var info = _this.globalData.userInfo;
                info.nickname = res.userInfo.nickName;
                console.log(info.nickname)
                _this.globalData.nickname = info.nickname
                info.avatar = res.userInfo.avatarUrl;
                info.gender = res.userInfo.gender;
                console.log("GetUserStateByOpenId started")
                wx.request({
                    url: _this.globalData.mainURL + 'api/getUserStateByOpenId',
                    data: {
                        open_id: obj.openid
                    },
                    method: 'POST',
                    header: {
                        'content-type': 'application/json'
                    },
                    success: function(res) {
                        if (res.data.status == false) {
                            var cur = new Date();
                            _this.globalData.todayfirst = cur.getDate();
                            _this.globalData.todayselected = [];
                            _this.globalData.honey_info = {
                                total_honey: 0,
                                honeybox_array: []
                            }
                            _this.globalData.daily_honey = [0, 0];
                            _this.globalData.favorinputtext = [];
                            wx.setStorageSync("have_stadium", 0)
                            wx.setStorageSync("isfirstcreate", 1)
                            setTimeout(function() {
                                _this.onLaunch();
                            }, 2000);
                            wx.request({
                                method: 'POST',
                                header: {
                                    'content-type': 'application/json'
                                },
                                url: _this.globalData.mainURL + 'api/addNewUser',
                                data: {
                                    nickname: _this.globalData.userInfo.nickname,
                                    avatar: _this.globalData.userInfo.avatar,
                                    open_id: obj.openid,
                                    gender: (_this.globalData.userInfo.gender - 1)
                                        // 'user_code': _this.globalData.user_code
                                        // 'session_key': _this.globalData.session_key
                                },
                                success: function(ret) {
                                    // if (ret.data.status) {
                                    //   // var info = ret.data.result;
                                    //   // //_this.globalData.userInfo;

                                    //   // _this.globalData.userInfo.name = _this.globalData.userInfo.nickname
                                    //   // _this.globalData.userInfo.user_id = info.user_id;
                                    // }
                                    console.log(ret)
                                }
                            })
                        } else {
                            if (res.data.result[0].daily_honey != '') {
                                _this.globalData.daily_honey = JSON.parse(res.data.result[0].daily_honey)
                            } else {
                                _this.globalData.daily_honey = [0, 0];
                            }
                            _this.globalData.todayfirst = res.data.result[0].todayfirst;
                            _this.globalData.have_stadium = wx.getStorageSync("have_stadium")
                            if (_this.globalData.honey_info.honeybox_array == undefined) {
                                _this.globalData.honey_info = {
                                    total_honey: 0,
                                    honeybox_array: []
                                }
                            }
                            var cur = new Date();
                            _this.globalData.honey_info.today_honey = 1 * res.data.result[0].honey;
                            var info = _this.globalData.userInfo;
                            if (res.data.result[0].forbidden == 1) {
                                wx.showModal({
                                    title: '您的账号已被禁用',
                                    showCancel: false,
                                    complete: function() {
                                        wx.navigateBackMiniProgram({})
                                    }
                                })
                            }
                            info.user_id = res.data.result[0].no;
                            info.phone = res.data.result[0].phone;
                            info.state = res.data.result[0].state;
                            info.forbidden = res.data.result[0].forbidden;
                            info.honey = res.data.result[0].honey;
                            info.role = res.data.result[0].role;
                            if (info.role == 1) {
                                wx.request({
                                    url: _this.globalData.mainURL + "api/haveStadium",
                                    method: "POST",
                                    header: {
                                        "content-type": "application/json"
                                    },
                                    data: {
                                        user_id: info.user_id
                                    },
                                    success: function(res) {
                                        "" != res.data.result[0].site_introduction && wx.setStorageSync("have_stadium", 1);
                                    }
                                })
                            }
                            info.name = res.data.result[0].name;
                            info.amount = res.data.result[0].amount;
                            _this.globalData.honey_info.total_honey = info.honey
                            wx.setStorageSync('honey_info', _this.globalData.honey_info)
                            if (info.state * 1 != 2) {
                                info.name = _this.globalData.userInfo.nickname
                            }
                            if (info.avatar == '') {
                                info.avatar = "/image/user-unlogin.png"
                            }
                            if (res.data.member[0].state == null) {
                                info.isVIP = 0
                            }
                            if (res.data.member[0].state == 1) {
                                info.isVIP = 1;
                            }
                            _this.globalData.userInfo = info
                            console.log(info);
                            var tempdate1 = new Date()
                            if (tempdate1.getHours() >= 0 && tempdate1.getHours() < 7) {
                                _this.globalData.isactivetime = 0
                            } else {
                                _this.globalData.isactivetime = 1
                            }
                            setInterval(_this.checkDate, 1000)
                        }
                    },
                    fail: function() {}
                })
            }
        });
    },
    showHint: function() {
        wx.showModal({
            title: '提示',
            content: '开启微信计步权限，有机会获取蜂蜜哦',
            success: function(res) {
                if (res.confirm) {
                    wx.openSetting({

                        })
                        //跳转去设置
                }
            }
        })
    },
    getLocation: function() {
        var that = this;
        wx.getLocation({
            type: 'gcj02',
            success: function(res) {
                that.globalData.searchlat = res.latitude;
                that.globalData.searchlong = res.longitude;

                var url = 'https://restapi.amap.com/v3/geocode/regeo?key=8eb63e36d0b6d7d29a392503a4a80f6c&location=' + res.longitude + ',' + res.latitude + '&poitype=&radius=&extensions=all&batch=false&roadlevel=0';

                //get activity array
                wx.request({
                    url: url,
                    success: function(res) {
                        //console.log('got location');
                        //console.log(res.data);
                        //console.log(res.data.regeocode.addressComponent);
                        // var province_name = res.data.regeocode.addressComponent.province
                        that.globalData.currentCityName = res.data.regeocode.addressComponent.city;
                        // var area_name = res.data.regeocode.addressComponent.district
                    },
                });
            }
        });
    },
    resethoney: function() {

    },
    // checkDate1: function() {
    //     var _this = this
    //     var tempdate = new Date()
    //     var todayfirst = wx.getStorageSync('todayfirst');
    //     if (tempdate.getHours() < 7) {
    //         this.globalData.isactivetime = 0
    //         var todaytime = new Date().getDate()

    //         wx.setStorageSync("todayselected", [])
    //         _this.globalData.daily_honey = [0, 0]
    //         wx.setStorageSync("daily_honey", [0, 0])
    //     }
    //     if (tempdate.getHours() >= 7) {
    //         this.globalData.isactivetime = 1

    //         // if (todayfirst != tempdate.getDate() && todayfirst != '') {
    //         //     console.log(todayfirst);
    //         //     wx.setStorageSync('todayfirst', tempdate.getDate())
    //         // }
    //     }


    //     var that = this
    //     wx.request({
    //         url: that.globalData.mainURL + 'api/getNewBookingAlarm',
    //         method: 'POST',
    //         header: {
    //             'content-type': 'application/json'
    //         },
    //         data: {
    //             user_id: that.globalData.userInfo.user_id
    //         },
    //         success: function(res) {
    //             if (res.data.bookingNewsAmount.length > 0) {
    //                 for (var iter = 0; iter < res.data.bookingNewsAmount.length; iter++) {
    //                     var booking_data = res.data.bookingNewsAmount[iter]
    //                     that.gainNewHoney(booking_data)
    //                 }
    //             }
    //         },
    //     })
    //     for (var iter = 0; iter < this.globalData.honey_info.honeybox_array.length; iter++) {
    //         if (Date.now() - this.globalData.honey_info.honeybox_array[iter].start_time > 172800000) {
    //             this.globalData.honey_info.honeybox_array.splice(iter, 1)
    //         }
    //     }
    // },
    checkDate: function() {
        var a = WXBizDataCrypt;
        var e = this,
            t = new Date(),
            o = e.globalData.todayfirst;
        t.getHours() < 7 && (this.globalData.isactivetime = 0)
        if (t.getHours() >= 7) {
            this.globalData.isactivetime = 1
            o != t.getDate() && "" != o && (
                console.log(o),
                e.globalData.todayfirst = t.getDate(),
                e.globalData.todayselected = [],
                wx.login({
                    success: function(t) {
                        wx.request({
                            url: e.globalData.mainURL + "api/getopenid",
                            data: {
                                code: t.code
                            },
                            method: "POST",
                            header: {
                                "content-type": "application/json"
                            },
                            success: function(t) {
                                var o = {};
                                o.openid = t.data.openid;
                                o.expires_in = Date.now() + t.data.expires_in;
                                e.globalData.session_key = t.data.session_key;
                                wx.getSetting({
                                    success: function(t) {
                                        1 != t.authSetting["scope.werun"] && wx.authorize({
                                            scope: "scope.werun"
                                        }), wx.getWeRunData({
                                            success: function(t) {
                                                var o = t.encryptedData,
                                                    n = t.iv,
                                                    s = new a(e.globalData.appid, e.globalData.session_key).decryptData(o, n);
                                                e.globalData.step = 1 * s.stepInfoList.pop().step
                                                e.globalData.laststep = 1 * s.stepInfoList.pop().step
                                                console.log('Last day step is ' + e.globalData.laststep);
                                                console.log('Today step is ' + e.globalData.step);
                                                new Date();
                                                var i = new Date();
                                                e.globalData.daily_honey = [0, 0];
                                                var l = 1 * e.globalData.laststep * (1 * e.globalData.rule[3].value);
                                                l = 1 * Math.floor(l)
                                                wx.request({
                                                    url: e.globalData.mainURL + "api/setTodayFirst",
                                                    method: "POST",
                                                    header: {
                                                        "content-type": "application/json"
                                                    },
                                                    data: {
                                                        todayfirst: i.getDate(),
                                                        user_id: e.globalData.userInfo.user_id,
                                                        honey: l
                                                    },
                                                    success: function() {
                                                        console.log("success");
                                                    }
                                                });
                                            },
                                            fail: function(a) {}
                                        });
                                    }
                                });
                            }
                        });
                    }
                }));
        }
        for (var n = 0; n < this.globalData.honey_info.honeybox_array.length; n++)
            Date.now() - this.globalData.honey_info.honeybox_array[n].start_time > 1728e5 && this.globalData.honey_info.honeybox_array.splice(n, 1);
    },

    checkValidPhone: function(phone) {
        var compare = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        return compare.test(phone);
    },

    phoneCall: function(phone) {
        var that = this
        console.log(that.checkValidPhone(phone));
        if (!that.checkValidPhone(phone)) {
            wx.showToast({
                title: '这不是有效的电话号',
                icon: 'none',
                duration: 2000
            })
            return;
        }
        wx.makePhoneCall({
            phoneNumber: phone,
            complete: function() {
                return
            }
        })
    },

    // gainNewHoney: function(booking_data) {
    //     var _this = this
    //     console.log(_this.globalData.honey_info.honeybox_array)
    //     var iter;
    //     var tempx, tempy
    //     var honeytype = 1
    //     var vip = _this.globalData.userInfo.isVIP + 1
    //     console.log(vip)
    //     var daily_honey = wx.getStorageSync("daily_honey")
    //     if (daily_honey == '') daily_honey = [0, 0];
    //     _this.globalData.daily_honey = daily_honey
    //     console.log(daily_honey[1])
    //     if (true || _this.globalData.daily_honey[1] <= _this.globalData.rule[6].value) {
    //         if (booking_data.role == 1) {
    //             var unit = _this.globalData.rule[0].value * 1;
    //             var portion = _this.globalData.rule[4].value * 1;
    //             var honey = unit / (portion + 1) * booking_data.amount;
    //             honey = Math.floor(honey)
    //             console.log(honey)
    //             if (honey >= (_this.globalData.rule[6].value * vip)) {
    //                 honey = (_this.globalData.rule[5 + honeytype].value * 1)
    //                 _this.globalData.honey_info.honeybox_array = []
    //             } else {
    //                 var temparray = _this.globalData.honey_info.honeybox_array
    //                 var sum = honey
    //                 for (iter = temparray.length - 1; iter >= 0; iter--) {
    //                     if (sum + temparray[iter] < (_this.globalData.rule[6].value * vip)) {
    //                         sum = sum + temparray[iter]
    //                     } else {
    //                         break;
    //                     }
    //                 }
    //                 if (temparray.length > 0 && iter >= 0) {
    //                     var last = temparray.splice(iter, iter + 1)
    //                     last[0].honey = _this.globalData.rule[6].value * vip - sum
    //                     temparray.splice(0, iter)
    //                     if (last[0].honey > 0) {
    //                         temparray.unshift(last[0])
    //                     }
    //                 }
    //                 _this.globalData.honey_info.honeybox_array = temparray
    //             }
    //             while (1) {
    //                 tempx = Math.floor((Math.random() * 100) % 9)
    //                 tempy = Math.floor((Math.random() * 100) % 3)
    //                 for (iter = 0; iter < _this.globalData.honey_info.honeybox_array.length; iter++) {
    //                     if (tempx == _this.globalData.honey_info.honeybox_array[iter].x && tempy == _this.globalData.honey_info.honeybox_array[iter].y) {
    //                         break;
    //                     }
    //                 }
    //                 if (iter == _this.globalData.honey_info.honeybox_array.length) {
    //                     break;
    //                 }
    //             }
    //             var tempdate
    //             tempdate = Date.parse(booking_data.end_time.replace(/-/g, '/'))
    //             _this.globalData.honey_info.honeybox_array.push({
    //                 x: tempx,
    //                 y: tempy,
    //                 honey: honey,
    //                 start_time: tempdate
    //             })
    //             wx.setStorageSync("honey_info", _this.globalData.honey_info)
    //         }
    //         if (booking_data.role == 2) {
    //             if (booking_data.additional == 1) {
    //                 //} && _this.globalData.daily_honey[1] < _this.globalData.rule[6].value) {
    //                 var unit = _this.globalData.rule[1].value * 1;
    //                 var portion = _this.globalData.rule[4].value * 1;
    //                 var honey = unit * booking_data.amount / (portion + 1);
    //                 honey = Math.floor(honey)
    //                 console.log(_this.globalData.honey_info.honeybox_array)
    //                 if (honey >= _this.globalData.rule[6].value * vip) {
    //                     honey = _this.globalData.rule[6].value * vip
    //                     _this.globalData.honey_info.honeybox_array = []
    //                 } else {
    //                     var temparray = _this.globalData.honey_info.honeybox_array
    //                     var sum = honey
    //                     for (iter = temparray.length - 1; iter >= 0; iter--) {
    //                         if (sum + temparray[iter].honey <= (_this.globalData.rule[6].value * vip)) {
    //                             sum = sum + temparray[iter].honey
    //                         } else {
    //                             break;
    //                         }
    //                     }
    //                     console.log(sum)
    //                     if (temparray.length > 0 && iter >= 0) {
    //                         var last = temparray.splice(iter, 1)
    //                         last[0].honey = _this.globalData.rule[6].value * vip - sum
    //                         console.log('here')
    //                         console.log(iter)
    //                         temparray.splice(0, iter)
    //                         if (last[0].honey > 0) {
    //                             temparray.unshift(last[0])
    //                         }
    //                     }
    //                     _this.globalData.honey_info.honeybox_array = temparray
    //                 }
    //                 while (1) {
    //                     tempx = Math.floor((Math.random() * 100) % 9)
    //                     tempy = Math.floor((Math.random() * 100) % 3)
    //                     for (iter = 0; iter < _this.globalData.honey_info.honeybox_array.length; iter++) {
    //                         if (tempx == _this.globalData.honey_info.honeybox_array[iter].x && tempy == _this.globalData.honey_info.honeybox_array[iter].y) {
    //                             break;
    //                         }
    //                     }
    //                     if (iter == _this.globalData.honey_info.honeybox_array.length) {
    //                         break;
    //                     }
    //                 }
    //                 var tempdate
    //                 tempdate = Date.parse(booking_data.end_time.replace(/-/g, '/'))
    //                 _this.globalData.honey_info.honeybox_array.push({
    //                     x: tempx,
    //                     y: tempy,
    //                     honey: honey,
    //                     start_time: tempdate
    //                 })
    //                 wx.setStorageSync("honey_info", _this.globalData.honey_info)
    //             }
    //         }
    //     }
    //     wx.setStorageSync("honey_info", _this.globalData.honey_info)
    // }
})