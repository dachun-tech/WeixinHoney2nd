function t(t, e, a) {
    return e in t ? Object.defineProperty(t, e, {
        value: a,
        enumerable: !0,
        configurable: !0,
        writable: !0
    }) : t[e] = a, t;
}

var e, a = getApp();

Page({
    data: (e = {
        method: "auth",
        longitude: 0,
        latitude: 0,
        marker: [],
        showModal: !1
    }, t(e, "longitude", 0), t(e, "latitude", 0), e),
    onLoad: function(t) {
        this.setData({
            method: t.method,
            longitude: t.longitude,
            latitude: t.latitude
        }), this.mapCtx = wx.createMapContext("myMap");
    },
    on_click_map: function(t) {
        var e = this, o = t.touches[0].pageX, i = t.touches[0].pageY;
        this.mapCtx.getRegion({
            success: function(t) {
                var n = t.southwest.longitude - (t.southwest.longitude - t.northeast.longitude) / (750 / o), u = t.northeast.latitude + (t.southwest.latitude - t.northeast.latitude) / (1268 / i);
                e.setData({
                    marker: [ {
                        iconPath: "../../../../image/me@2x.png",
                        id: 0,
                        latitude: u,
                        longitude: n,
                        width: 50,
                        height: 50
                    } ],
                    showModal: !0,
                    longitude: n,
                    latitude: u
                }), a.globalData.longitude = n, a.globalData.latitude = u;
            }
        });
    },
    onCancel1: function() {
        this.setData({
            showModal: !1
        });
    },
    onConfirm1: function() {
        this.setData({
            showModal0: !1
        }), wx.navigateBack({
            delta: 1
        });
    }
});