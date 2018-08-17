var a = getApp();

Page({
    data: {
        eventData: {
            ground_image: "",
            act_type: "",
            act_status: "",
            favourite: 0,
            act_name: "",
            member_count: 0,
            cost: 0,
            act_date: " ",
            address: "",
            ground_name: "",
            ground_owner: "",
            max_member: 0,
            act_intro: ""
        },
        param: {
            user_avatar: "../../../image/temp.jpg",
            nickname: "ttt"
        },
        realname: "",
        phonenumber: 0,
        memcount: 0,
        totalcost: 0
    },
    onLoad: function(t) {
        this.setData({
            eventData: a.globalData.eventData
        }), this.data.user_avatar = a.globalData.userInfo.avatar, this.data.nickname = a.globalData.userInfo.nickname, 
        this.setData({
            user_avatar: this.data.user_avatar
        }), this.setData({
            nickname: this.data.nickname
        }), this.setData({
            eventData: this.data.eventData
        });
    },
    on_Input_Realname: function(a) {
        this.setData({
            realname: a.detail.value
        });
    },
    on_Input_Phonenumber: function(a) {
        this.setData({
            phonenumber: a.detail.value
        });
    },
    on_Input_Memcount: function(a) {
        this.setData({
            memcount: a.detail.value
        }), this.setData({
            total_cost: a.detail.value * this.data.eventData.cost
        });
    },
    on_Btn_OK: function() {
        (this.data.realname.length > 4 || 0 == this.data.realname.length) && (0, this.setData({
            val_realname: "error"
        })), (this.data.phonenumber.toString().length > 11 || 1 == this.data.phonenumber.toString().length) && (0, 
        this.setData({
            val_phonenumber: "error"
        })), (this.data.memcount > this.data.eventData.max_member - this.data.eventData.member_count || 0 == this.data.memcount) && (0, 
        this.setData({
            val_memcount: "error"
        }));
    }
});