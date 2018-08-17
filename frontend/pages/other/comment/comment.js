var t = getApp();

Page({
    data: {
        img_black_start_src: "../../../image/star_n@2x.png",
        img_yellow_start_src: "../../../image/star_s@2x.png",
        star_img_position: 25,
        rating: [],
        method: "event"
    },
    onLoad: function(a) {
        var e = this, n = a.id, i = a.kind;
        "event" == i ? wx.request({
            url: t.globalData.mainURL + "api/getRatingByEvent",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                event_id: n
            },
            success: function(t) {
                var a = t.data.result;
                if (null != a) {
                    for (var n = 0; n < a.length; n++) a[n].avatar = a[n].avatar;
                    e.setData({
                        rating: a,
                        method: i
                    });
                }
            }
        }) : wx.request({
            url: t.globalData.mainURL + "api/getRatingBySite",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                boss_id: n
            },
            success: function(t) {
                var a = t.data.result;
                null != a && e.setData({
                    rating: a,
                    method: i
                });
            }
        });
    }
});