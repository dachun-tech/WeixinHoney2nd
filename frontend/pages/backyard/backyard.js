var a = getApp();

require("../../utils/RdWXBizDataCrypt.js");

Page({
    data: {
        avatar: ""
    },
    onLoad: function() {},
    onShow: function() {
        var o = this;
        a.checkDate(), wx.request({
            url: a.globalData.mainURL + "api/getBackyard",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: a.globalData.userInfo.user_id
            },
            success: function(e) {
                console.log(e);
                var t = a.globalData.honey_info;
                if (t.honeybox_array = [], console.log(t), e.data.status) {
                    for (var l = e.data.result, n = 0; n < l.length; n++) {
                        var r;
                        r = Date.parse(l[n].create_time.replace(/-/g, "/")), t.honeybox_array.push({
                            no: l[n].no,
                            x: l[n].x,
                            y: l[n].y,
                            honey: l[n].amount,
                            start_time: r
                        });
                    }
                    a.globalData.honey_info = t, o.setData({
                        total: a.globalData.honey_info.total_honey,
                        honeybox_array: t.honeybox_array,
                        avatar: a.globalData.userInfo.avatar
                    });
                } else t.honeybox_array = [], o.setData({
                    total: a.globalData.honey_info.total_honey,
                    honeybox_array: t.honeybox_array,
                    avatar: a.globalData.userInfo.avatar
                });
                a.globalData.honey_info = t;
            }
        }), console.log(a.globalData.daily_honey);
    },
    On_click_beeshop: function() {
        wx.navigateTo({
            url: "mainbeeshop/mainbeeshop"
        });
    },
    On_click_beelist: function() {
        wx.navigateTo({
            url: "transaction/transaction"
        });
    },
    On_click_comment: function() {
        wx.navigateTo({
            url: "help/help"
        });
    },
    on_click_honey: function(o) {
        if (0 != a.globalData.userInfo.user_id) if (0 != a.globalData.isactivetime) {
            var e = 0, t = 0, l = a.globalData.honey_info;
            console.log(l.honeybox_array);
            for (var n = 0; n < l.honeybox_array.length; n++) if (1 * o.currentTarget.id == l.honeybox_array[n].start_time) {
                e = n, t = l.honeybox_array[n].honey;
                break;
            }
            var r = l.honeybox_array[e].no;
            if (console.log(r), a.globalData.daily_honey[1] >= a.globalData.rule[6].value) {
                var y = "您今天已经收获了" + a.globalData.rule[6].value + "ml蜂蜜，明天再来哦";
                wx.showToast({
                    title: y,
                    icon: "none"
                });
            } else 1 * a.globalData.rule[6].value < 1 * a.globalData.daily_honey[1] + 1 * t ? (l.honeybox_array[e].honey -= a.globalData.rule[6].value - a.globalData.daily_honey[1], 
            t = a.globalData.rule[6].value - a.globalData.daily_honey[1]) : l.honeybox_array.splice(e, 1), 
            a.globalData.daily_honey[1] = 1 * a.globalData.daily_honey[1] + 1 * t, l.total_honey = parseFloat(1 * t) + parseFloat(1 * l.total_honey), 
            this.setData({
                honeybox_array: l.honeybox_array
            }), a.globalData.honey_info = l, console.log(a.globalData.daily_honey), wx.request({
                url: a.globalData.mainURL + "api/catchHoney",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    no: 0,
                    backyard_no: r,
                    amount: l.total_honey,
                    honey: t,
                    user_id: a.globalData.userInfo.user_id,
                    daily_honey: JSON.stringify(a.globalData.daily_honey)
                },
                success: function(a) {}
            }), this.setData({
                total: a.globalData.honey_info.total_honey,
                honeybox_array: a.globalData.honey_info.honeybox_array
            });
        } else wx.showToast({
            title: "从早上7点开始可以收集蜂蜜",
            icon: "none",
            duration: 2e3
        });
    }
});