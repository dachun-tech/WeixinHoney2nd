var t = getApp();

Page({
    data: {
        img_black_start_src: "../../../image/star_n@2x.png",
        img_yellow_start_src: "../../../image/star_s@2x.png",
        star_img_position: 122,
        count_yellowStar: 3,
        text_count: 0,
        comment: "",
        booking_id: 0
    },
    onLoad: function(t) {
        this.setData({
            booking_id: t.id
        });
    },
    bindInputText: function(t) {
        this.setData({
            text_count: t.detail.cursor,
            comment: t.detail.value
        });
    },
    additionStar: function(t) {
        this.setData({
            count_yellowStar: this.data.count_yellowStar + 1
        });
    },
    subtractStar: function(t) {
        this.setData({
            count_yellowStar: this.data.count_yellowStar - 1
        });
    },
    btn_submit: function() {
        if (this.data.comment.length <= 200) {
            var a = this;
            wx.request({
                url: t.globalData.mainURL + "api/addRating",
                method: "POST",
                header: {
                    "content-type": "application/json"
                },
                data: {
                    booking_id: a.data.booking_id,
                    point: a.data.count_yellowStar,
                    comment: a.data.comment
                },
                success: function(t) {
                    1 == t.data.status && wx.redirectTo({
                        url: "../../profile/my_booking/booking"
                    });
                }
            });
        } else wx.showToast({
            title: "你输入的字符超过200字！",
            icon: "none"
        });
        console.log(this.data.comment);
    }
});