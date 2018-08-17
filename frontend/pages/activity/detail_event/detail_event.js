var t = getApp();

Page({
    data: {
        eventData: {
            ground_image: "../../../image/temp.jpg",
            act_type: "足球比赛",
            act_status: "进行中",
            favourite: 200,
            act_name: "足球",
            member_count: 10,
            cost: 20,
            act_date: " 2018-02-22 13:00",
            address: "北京大学体育馆23号足球场",
            ground_name: "北京大学体育馆",
            ground_owner: "郭德纲",
            max_member: 15,
            act_intro: "玩的很愉快玩的很愉快玩的很愉快玩的很愉快玩的"
        },
        is_disabled: !1,
        favor_src: "../../../image/good_n@2x.png",
        favour_num: 0
    },
    onLoad: function(t) {
        var a = [ "../../../image/temp.jpg", "../../../image/Home_s@3x.png", "../../../image/my_attention@3x.png", "../../../image/my_s@3x.png" ];
        this.setData({
            image_array: a
        }), this.data.favour_num = this.data.eventData.favourite, this.setData({
            favour_num: this.data.favour_num
        }), "已取消" == this.data.eventData.act_status ? (this.setData({
            btn_text: "已取消"
        }), this.setData({
            is_disabled: !0
        })) : this.data.eventData.max_member == this.data.eventData.mebmer_count ? (this.setData({
            btn_text: "人数已满"
        }), this.setData({
            is_disabled: !0
        })) : (this.setData({
            btn_text: "立即参加"
        }), this.setData({
            is_disabled: !1
        })), "已完成" == this.data.eventData.act_status && that.setData({
            is_disabled: !0,
            btn_text: "活动完成"
        });
    },
    btn_Clicked_Personal_Input: function() {
        t.globalData.eventData = this.data.eventData, wx.redirectTo({
            url: "../personal_input/personal_input",
            success: function(t) {},
            fail: function(t) {},
            complete: function(t) {}
        });
    },
    btn_Clicked_Gym_Info: function() {
        wx.navigateTo({
            url: "../detail_gym/detail_gym",
            success: function(t) {},
            fail: function(t) {},
            complete: function(t) {}
        });
    },
    btn_Clicked_Favor: function() {
        "../../../image/good_n@2x.png" == this.data.favor_src ? (this.setData({
            favor_src: "../../../image/good_s@2x.png"
        }), this.data.favour_num++, this.setData({
            favour_num: this.data.favour_num
        })) : (this.setData({
            favor_src: "../../../image/good_n@2x.png"
        }), this.data.favour_num--, this.setData({
            favour_num: this.data.favour_num
        }));
    }
});