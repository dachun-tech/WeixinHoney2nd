var t = getApp();

Page({
    data: {
        site: [],
        event: [],
        isFavourite: !1,
        pictures: [],
        eventType: [],
        userRole: [],
        eventState: [],
        favourite_image: [ "../../../image/Collection_N@2x.png", "../../../image/Collection_s@2x.png" ],
        starparam: {
            stars: [ 0, 1, 2, 3, 4 ],
            srcImage_0: "../../../image/star-0.png",
            srcImage_1: "../../../image/star-1.png",
            srcImage_2: "../../../image/star-2.png",
            srcImage_3: "../../../image/star-3.png",
            srcImage_4: "../../../image/star-4.png",
            score: 4.3,
            srcImage: ""
        }
    },
    onLoad: function(a) {
        var e = this;
        0 == t.globalData.userInfo.user_id ? (t.onLaunch(), setTimeout(function() {
            e.onInitStart(a);
        }, 4e3)) : e.onInitStart(a);
    },
    onInitStart: function(a) {
        this.setData({
            eventType: t.globalData.eventType,
            userRole: t.globalData.userRole,
            bookingState: t.globalData.eventState,
            eventState: t.globalData.eventState
        });
        var e = a.id, i = this;
        wx.request({
            url: t.globalData.mainURL + "api/getSiteDetail",
            header: {
                "content-type": "application/json"
            },
            method: "POST",
            data: {
                boss_id: e,
                user_id: t.globalData.userInfo.user_id
            },
            success: function(a) {
                if (a.data.status) {
                    var e = a.data.site[0];
                    if (null != e) {
                        null == e.point && (e.point = 0), null == e.fav_state ? e.fav_state = 0 : e.fav_state = 1;
                        var n = i.data.starparam;
                        n.score = 1 * e.point, i.setData({
                            starparam: n
                        });
                    }
                    var s = a.data.picture, r = [];
                    if (0 != s.length) for (l = 0; l < s.length; l++) r[l] = t.globalData.uploadURL + s[l].picture;
                    for (var o = a.data.event, l = 0; l < o.length; l++) if (o[l].name.length > 15) {
                        var u = o[l].name;
                        u = u.slice(0, 15) + "..", o[l].name = u;
                    }
                    var c = a.data.isFavourite;
                    c && (e.fav_state = 1);
                    for (l = 0; l < o.length; l++) null == o[l].register_num && (o[l].register_num = 0);
                    i.setData({
                        site: e,
                        pictures: r,
                        isFavourite: c,
                        event: o
                    });
                }
            }
        });
    },
    phone_call: function() {
        var t = this;
        wx.makePhoneCall({
            phoneNumber: t.data.site.phone,
            complete: function() {}
        });
    },
    show_preview: function(t) {
        console.log(t);
        var a = this;
        wx.previewImage({
            current: a.data.pictures[1 * t.currentTarget.id],
            urls: a.data.pictures
        });
    },
    click_detail_event: function(t) {
        wx.navigateTo({
            url: "../detail_event/detail_event?id=" + t.currentTarget.id
        });
    },
    on_Clicked_Comment: function(t) {
        "0" != this.data.site.rating_amount && wx.navigateTo({
            url: "../../other/comment/comment?id=" + t.currentTarget.id + "&kind=site"
        });
    },
    on_click_favourite: function() {
        var a = this.data.site;
        a.fav_state = (1 + a.fav_state) % 2, this.setData({
            site: a
        });
        var e = this;
        wx.request({
            url: t.globalData.mainURL + "api/cancelFavouriteSite",
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            data: {
                user_id: t.globalData.userInfo.user_id,
                boss_id: e.data.site.boss_id
            },
            success: function(t) {}
        });
    },
    onShareAppMessage: function(a) {
        console.log("SHARED"), "button" === a.from && console.log(a.target);
        var e = this;
        return {
            title: e.data.site[0].site_name,
            path: "/pages/index/detail_gym/detail_gym?id=" + e.data.site[0].boss_id + "&user_id=" + t.globalData.userInfo.user_id + "&nickname=" + t.globalData.userInfo.nickname + "&atype=1",
            success: function(t) {},
            fail: function(t) {}
        };
    }
});