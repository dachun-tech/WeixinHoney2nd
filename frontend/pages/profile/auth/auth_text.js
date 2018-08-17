Page({
    data: {
        hide: 0,
        role: 1,
        mo_user_info: {
            user_role: "场馆主",
            stadium_info: "",
            ownername: "",
            phonenumber: "",
            authnumber: "",
            address: "",
            detail_address: "",
            map: "",
            register_image: "../../../image/002@3x.png",
            idcard: "",
            front_image: "../../../image/sfz@3x.png",
            back_image: "../../../image/sfb@3x.png"
        },
        mo_person_info: {
            user_role: "个人",
            nickname: "",
            ownername: "",
            phonenumber: "",
            authnumber: ""
        },
        overimagecount: 0
    },
    On_clicked_role: function() {
        this.data.hide = !this.data.hide, this.setData({
            hide: this.data.hide
        });
    },
    onLoad: function(e) {
        this.setData({
            mo_user_info: this.data.mo_user_info
        });
    },
    onReady: function() {},
    onShow: function() {},
    onHide: function() {},
    onUnload: function() {},
    onPullDownRefresh: function() {},
    onReachBottom: function() {},
    onShareAppMessage: function() {},
    On_change_picker: function(e) {
        1 == e.detail.value[0] ? (this.data.mo_user_info.user_role = "个人", this.data.role = 0) : (this.data.role = 1, 
        this.data.mo_user_info.user_role = "场馆主"), this.setData({
            role: this.data.role
        }), this.setData({
            mo_user_info: this.data.mo_user_info
        });
    },
    On_blur_stadiuminfo: function(e) {
        this.data.mo_user_info.stadium_info = e.detail.value;
    },
    On_blur_ownername: function(e) {
        this.data.mo_user_info.ownername = e.detail.value;
    },
    On_blur_phonenumber: function(e) {
        this.data.mo_user_info.phonenumber = e.detail.value;
    },
    On_blur_authnumber: function(e) {
        this.data.mo_user_info.authnumber = e.detail.value;
    },
    On_clicked_address: function(e) {
        this.data.mo_user_info.address = e.detail.value;
    },
    On_blur_detailaddress: function(e) {
        this.data.mo_user_info.detail_address = e.detail.value;
    },
    On_click_authnumber: function(e) {},
    On_click_map: function(e) {},
    On_click_registerimage: function(e) {
        var n = this;
        wx.chooseImage({
            success: function(e) {
                e.tempFiles[0].size > 5120 && n.data.overimagecount++, n.data.mo_user_info.register_image = e.tempFilePaths[0], 
                n.setData({
                    mo_user_info: n.data.mo_user_info
                });
            }
        });
    },
    On_blur_idcard: function(e) {
        this.data.mo_user_info.idcard = e.detail.value;
    },
    On_click_frontimage: function(e) {
        var n = this;
        wx.chooseImage({
            success: function(e) {
                e.tempFiles[0].size > 5120 && n.data.overimagecount++, n.data.mo_user_info.front_image = e.tempFilePaths[0], 
                n.setData({
                    mo_user_info: n.data.mo_user_info
                });
            }
        });
    },
    On_click_backimage: function(e) {
        var n = this;
        wx.chooseImage({
            success: function(e) {
                e.tempFiles[0].size > 5120 && n.data.overimagecount++, n.data.mo_user_info.back_image = e.tempFilePaths[0], 
                n.setData({
                    mo_user_info: n.data.mo_user_info
                });
            }
        });
    },
    On_click_submit: function(e) {
        var n = 0;
        this.data.overimagecount > 0 && (n += 1), this.data.mo_user_info.stadium_info.length > 20 && (n += 1), 
        this.data.mo_user_info.ownername.length > 4 && (n += 1), this.data.mo_user_info.phonenumber.toString().length > 20 && (n += 1), 
        this.data.mo_user_info.idcard.toString().length > 18 && (n += 1), 0 == n || wx.showToast({
            title: "Error",
            icon: "none",
            duration: 2e3
        });
    },
    On_blur_ownername1: function(e) {
        this.data.mo_person_info.ownername = e.detail.value;
    },
    On_blur_phonenumber1: function(e) {
        this.data.mo_person_info.phonenumber = e.detail.value;
    },
    On_blur_authnumber1: function(e) {
        this.data.mo_person_info.authnumber = e.detail.value;
    }
});