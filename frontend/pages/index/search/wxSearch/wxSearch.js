function a(a) {
    var e = a.data.wxSearchData;
    e.view.isShow = !1, a.setData({
        wxSearchData: e
    });
}

function e(a) {
    var e = [];
    try {
        if (e = wx.getStorageSync("wxSearchHisKeys")) {
            var t = a.data.wxSearchData;
            t.his = e, t.keys = e, t.results = e, r = e, a.setData({
                wxSearchData: t
            });
        }
    } catch (a) {}
}

function t(t) {
    a(t);
    var c = t.data.wxSearchData.value;
    if (void 0 !== c && 0 != c.length) {
        var r = wx.getStorageSync("wxSearchHisKeys");
        r ? (r.indexOf(c) < 0 && r.unshift(c), wx.setStorage({
            key: "wxSearchHisKeys",
            data: r,
            success: function() {
                e(t);
            }
        })) : ((r = []).push(c), wx.setStorage({
            key: "wxSearchHisKeys",
            data: r,
            success: function() {
                e(t);
            }
        }));
    }
}

var c = [], r = [];

module.exports = {
    init: function(a, t, c, r, s, i, n) {
        var h = {}, o = {
            barHeight: t,
            isShow: !1,
            isSearchResultShow: !0
        };
        o.isShowSearchKey = void 0 === r || r, o.isShowSearchHistory = void 0 === s || s, 
        wx.getSystemInfo({
            success: function(e) {
                var c = e.windowHeight;
                o.seachHeight = c - t, h.view = o, a.setData({
                    wxSearchData: h
                });
            }
        }), "function" == typeof i && i(), e(a);
    },
    initColor: function(a) {
        c = a;
    },
    initMindKeys: function(a) {
        var e = a.data.wxSearchData;
        r = e.keys;
    },
    wxSearchInput: function(a, e, t) {
        var c = e.data.wxSearchData, s = a.detail.value, i = [];
        if (void 0 === s || 0 == s.length) ; else for (var n = 0; n < r.length; n++) {
            var h = r[n];
            h.indexOf(s) > -1 && i.push(h);
        }
        c.value = s, c.mindKeys = i, e.setData({
            wxSearchData: c
        });
    },
    wxSearchFocus: function(a, e, t) {
        var c = e.data.wxSearchData;
        c.view.isSearchResultShow = !1, c.view.isShow = !0, e.setData({
            wxSearchData: c
        }), "function" == typeof t && t();
    },
    wxSearchBlur: function(a, e, t) {
        var c = e.data.wxSearchData;
        c.value = a.detail.value, e.setData({
            wxSearchData: c
        }), "function" == typeof t && t();
    },
    wxSearchCancel: function(e) {
        a(e);
        var t = e.data.wxSearchData;
        t.value = "", e.setData({
            wxSearchData: t
        });
    },
    wxSearchKeyTap: function(a, e, c) {
        var r = e.data.wxSearchData;
        r.value = a.target.dataset.key, e.setData({
            wxSearchData: r
        }), t(e), "function" == typeof c && c();
    },
    wxSearchAddHisKey: t,
    wxSearchDeleteKey: function(a, t) {
        var c = a.target.dataset.key, r = wx.getStorageSync("wxSearchHisKeys");
        r.splice(r.indexOf(c), 1), wx.setStorage({
            key: "wxSearchHisKeys",
            data: r,
            success: function() {
                e(t);
            }
        });
    },
    wxSearchDeleteAll: function(a) {
        wx.removeStorage({
            key: "wxSearchHisKeys",
            success: function(e) {
                var t = [], c = a.data.wxSearchData;
                c.his = t, a.setData({
                    wxSearchData: c
                });
            }
        });
    },
    wxSearchHiddenPancel: a,
    wxGoNextPage: function(a, e) {
        var t = "#fff" == e.data.txtBackground ? "#eee" : "#fff";
        e.setData({
            txtBackground: t
        });
    }
};