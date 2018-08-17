var t = getApp(), a = new (require("../../../lib/amap-wx.js").AMapWX)({
    key: "f8f1f5c8a20c199dd0f70f5a6b162280"
});

Page({
    data: {
        favorinput: [],
        isshow: 1,
        curlat: 0,
        curlong: 0,
        site: []
    },
    onLoad: function() {
        this.data.favorinput = wx.getStorageSync("favorinputtext"), this.data.favorinput.reverse = this.data.favorinput.reverse(), 
        this.setData({
            favorinput: this.data.favorinput
        });
        var a = this;
        wx.getLocation({
            type: "wgs84",
            success: function(t) {
                a.data.curlat = t.latitude, a.data.curlong = t.longitude;
            }
        }), wx.request({
            url: t.globalData.mainURL + "api/getAllBoss",
            data: {},
            method: "POST",
            header: {
                "content-type": "application/json"
            },
            success: function(t) {
                if (t.data.status) {
                    a.data.site = t.data.result;
                    for (var e = 0; e < a.data.site.length; e++) null == a.data.site[e].site_name && (a.data.site.splice(e, 1), 
                    e--);
                    console.log(a.data.site);
                }
            }
        });
    },
    on_input_text: function(t) {
        var e = this;
        this.setData({
            isshow: 0
        });
        var i = t.detail.value;
        console.log(i), "" != i ? a.getInputtips({
            keywords: i,
            location: e.data.curlong + "," + e.data.curlat,
            success: function(t) {
                if (t && t.tips) {
                    var a = t;
                    console.log("OK");
                    for (var s = 0; s < e.data.site.length; s++) e.data.site[s].site_name.includes(i) && a.tips.unshift({
                        id: "own",
                        name: e.data.site[s].site_name,
                        location: e.data.site[s].logitude + "," + e.data.site[s].latitude
                    });
                    e.setData({
                        tips: a.tips
                    });
                }
            }
        }) : e.setData({
            tips: ""
        });
    },
    on_bindSearch: function(e) {
        var i = this, s = e.target.dataset.keywords;
        if ("own" == e.currentTarget.id) for (var o = 0; o < i.data.site.length; o++) i.data.site[o].site_name == s && (i.data.favorinput.push({
            name: s,
            longitude: i.data.site[o].longitude,
            latitude: i.data.site[o].latitude
        }), wx.setStorageSync("favorinputtext", i.data.favorinput), t.globalData.searchlat = i.data.site[o].latitude, 
        t.globalData.searchlong = i.data.site[o].longitude, t.globalData.issearch = 1, wx.switchTab({
            url: "../index"
        })); else a.getInputtips({
            keywords: s,
            location: "",
            success: function(a) {
                for (var e = 0; 0 == a.tips[e].location.length; ) e++;
                var o = a.tips[e].location.split(",")[0], n = a.tips[e].location.split(",")[1];
                i.data.favorinput.push({
                    name: s,
                    longitude: o,
                    latitude: n
                }), wx.setStorageSync("favorinputtext", i.data.favorinput), t.globalData.searchlat = n, 
                t.globalData.searchlong = o, t.globalData.issearch = 1, wx.switchTab({
                    url: "../index"
                });
            }
        });
    },
    on_click_cancel: function() {
        this.setData({
            isshow: 1
        }), this.setData({
            tips: ""
        }), this.setData({
            inputtext: ""
        });
    },
    on_click_delete: function() {
        wx.setStorageSync("favorinputtext", []), this.setData({
            favorinput: []
        });
    },
    on_click_favor_item: function(a) {
        var e = this;
        console.log(e.data.favorinput[a.currentTarget.id].latitude), console.log(e.data.favorinput[a.currentTarget.id]), 
        t.globalData.searchlat = e.data.favorinput[a.currentTarget.id].latitude, t.globalData.searchlong = e.data.favorinput[a.currentTarget.id].longitude, 
        t.globalData.issearch = 1, wx.switchTab({
            url: "../index"
        });
    }
});