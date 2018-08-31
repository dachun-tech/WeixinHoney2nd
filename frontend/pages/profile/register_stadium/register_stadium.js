// pages/profile/register_stadium/register_stadium.js
const app=getApp();
var timePicker = require('../../../utils/timePicker.js');

Page({

  /**
   * 页面的初始数据
   */
  data: {
    bossInfo:{},                           //path of icon
    image_path: ["", "", "", "", ""],    //path of images
    selected:0,                          //the index of image the user might select
    select:[1,0,0,0,0],                  //state of images to view
    display:["display:none;",""],         //style information of images
    introduction: '',                     //introduction of site
    service: '',                           //service comment of site
    method: 'new',
    image_buf:[],    
    isimage: 0,    
    overimagecount: 0,
    overavatarsize: 0,
    edit_state: 0,

    //variable for select sport kind
    select_index: 40,
    color_array: ["#000000","#e6b53c"],
    sport_kind_array:[],
    remain_array:[],
    selected_sport_type:[],  
    
    //variable for select weekday array
    weekday_array: [0,0,0,0,0,0,0],
    weekday_one: "星期一",
    weekday_strs: ["星期一",
    "星期二",
    "星期三",
    "星期四",
    "星期五",
    "星期六",
    "星期日"],



    //variable for select time range    
    timeArray: null,
    time_start1: [8,0],
    time_end1: [12,0],
    time_start2: [14,0],
    time_end2: [18,0],





    //variable for booking unit array
    booking_unit_index: 0,
    booking_units: [{name:'半小时',value:'0.5'},
    {name:'一小时',value:'1'},
    {name:'两小时',value:'2'},
    {name:'上下午',value:'12'},
    {name:'全天',value:'24'},],


    //variable for add room info array
    room_info_array: [{name:'',cost:'0'}],

     //variable for select type unit
    type_unit_index: 0,
    type_units: [{name:'开始前24小时可退',value:'24'},
    {name:'开始前12小时可退',value:'12'},
    {name:'开始前6小时可退',value:'6'},
    {name:'开始前都可退',value:'0'},
    {name:'不可退订',value:'10000'},],

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log("ONLOAD")
    var that = this;
    var obj = timePicker.timePicker();
        
    this.setData({      
      timeArray: obj.timeArray    
    });

    wx.request({
      url: app.globalData.mainURL+"api/getSiteStatus",
      method: 'POST',
      header:{
        'content-type': 'application/json'
      },
      data:{
        'user_id': app.globalData.userInfo.user_id
      },
      success: function(res)
      {
        if(res.data.status==true)
        {
            that.setData({               
              bossInfo: res.data.result[0],
              edit_state: res.data.edit_state[0].edit_state          
            });
            console.log(res.data);
            console.log(that.data.edit_state);

            

            //get current sport type array
            that.data.remain_array = that.get_all_type();
            that.data.sport_kind_array = that.get_all_type();
            if (that.data.bossInfo.site_type_detail) {
              var sport_type = [];
              var type_array = that.data.bossInfo.site_type_detail.split(",");
              for (let index = 0; index < type_array.length; index++) {
                sport_type.push(that.get_all_type()[type_array[index]]);
                var item_index = that.data.remain_array.indexOf(that.get_all_type()[type_array[index]])  
                that.data.remain_array.splice(item_index,1);           
              }
              that.setData({
                selected_sport_type: sport_type,
                remain_array: that.data.remain_array         
              })              
            }


            //get image array
            var select_buf = that.data.select;
            var image = that.data.image_path;
            var select = 0;
            for(var index=0; index<res.data.picture.length; index++)
            {
              select_buf[index+1] = 1;
              select++;
              image[index] = app.globalData.uploadURL + res.data.picture[index].picture;
            }            
            that.data.isimage = res.data.picture.length
            that.setData({
              image_buf: image,
              image_path: image,
              select: select_buf,
              selected: select,
              method: 'change'
            })

            //get service time
            var weekday_array = that.data.bossInfo.service_time.split(",");
            for (let index = 0; index < weekday_array.length; index++) {
              that.data.weekday_array[weekday_array[index]-1] = 1;              
            }
            var weekday_one = "星期一";
            for (let index = 0; index < that.data.weekday_array.length; index++) {
              if(that.data.weekday_array[index] == '1')
              {      
                weekday_one = that.data.weekday_strs[index];      
                break;
              }    
            }   
            that.setData({
              weekday_array: that.data.weekday_array,
              weekday_one: weekday_one              
            })                     

            //get start, end time
            if (that.data.bossInfo.start1) {
              var start1_array = that.data.bossInfo.start1.split(":");   
              that.data.time_start1[0] = that.data.timeArray[0].indexOf(start1_array[0]);
              that.data.time_start1[1] = that.data.timeArray[1].indexOf(start1_array[1]); 
            }
            if (that.data.bossInfo.start2) {
              var start2_array = that.data.bossInfo.start2.split(":");
              that.data.time_start2[0] = that.data.timeArray[0].indexOf(start2_array[0]);
              that.data.time_start2[1] = that.data.timeArray[1].indexOf(start2_array[1]);  
            }
            if (that.data.bossInfo.end1) {
              var end1_array = that.data.bossInfo.end1.split(":");
              that.data.time_end1[0] = that.data.timeArray[0].indexOf(end1_array[0]);
              that.data.time_end1[1] = that.data.timeArray[1].indexOf(end1_array[1]);   
            }
            if (that.data.bossInfo.end2) {
              var end2_array = that.data.bossInfo.end2.split(":");
              that.data.time_end2[0] = that.data.timeArray[0].indexOf(end2_array[0]);
              that.data.time_end2[1] = that.data.timeArray[1].indexOf(end2_array[1]);
            }            

            that.setData({
              time_start1: that.data.time_start1,
              time_start2: that.data.time_start2,
              time_end1: that.data.time_end1,
              time_end2: that.data.time_end2              
            })

            //get booking unit index
            var service_unit = that.data.bossInfo.service_unit;
            var booking_item = that.data.booking_units._find(item =>1.0*item.value == service_unit);
            that.setData({
              booking_unit_index: that.data.booking_units.indexOf(booking_item)
            });          

            //get room array
            var room_infos = [];
            for (let index = 0; index < res.data.room.length; index++) {
              var room = res.data.room[index];
              room_infos.push({
                name:room.room_name,
                cost:room.cost
              });              
            }
            that.setData({
              room_info_array:room_infos
            })

            //get type unit index
            var cancel_time = that.data.bossInfo.cancel_time;
            var type_item = that.data.type_units._find(item =>item.value == cancel_time);
            that.setData({
              type_unit_index: that.data.type_units.indexOf(type_item)
            }); 


        }
      }
    })
  },

//function for select sport kind
  get_all_type: function (event) {
    return ['足球', 
    '篮球', 
    '台球', 
    '排球', 
    '网球', 
    '壁球', 
    '瑜伽', 
    '舞蹈', 
    '电竞', 
    '爬山', 
    '轮滑', 
    '武术', 
    '旅游', 
    '滑冰', 
    '滑雪', 
    '拳击', 
    '跑步', 
    '棋牌', 
    '户外', 
    '健身', 
    '游泳', 
    '桌游', 
    '骑行', 
    '羽毛球', 
    '乒乓球', 
    '保龄球', 
    '跆拳道', 
    '高尔夫', 
    '运动装备', 
    '射击射箭', 
    '轰趴聚会',
    ];
  },
  On_click_deleteType: function (event) {
    var that = this;
    var index = event.currentTarget.id;   
    that.data.selected_sport_type.splice(index,1);
    that.setData({
      selected_sport_type: that.data.selected_sport_type
    })
  },
  On_click_AddType: function (event) {
    var that = this;
    that.data.remain_array = that.get_all_type();
    if (that.data.selected_sport_type.length == 3) {
      //show alert
      wx.showToast({
        title: '最多只能选择三个',
        duration: 2000,
        icon: 'none'
      })      
    }else
    {
      for (let index = 0; index < that.data.selected_sport_type.length; index++) {
        var item = that.data.selected_sport_type[index];
        var item_index = that.data.remain_array.indexOf(item);
        that.data.remain_array.splice(item_index,1);     
      }

      this.setData({
        remain_array: that.data.remain_array,
        select_menu_state: 1,
        select_index: 40        
      })
    }    
  },

  clicked_style_item: function (event) {
    this.setData({
      select_index: event.currentTarget.id
    })
  },
  cancel_btn_clicked: function(){
    this.setData({
      select_menu_state: 0
    })
  },
  ok_btn_clicked: function(event){
    //add selected kind to selected_sport_type
    var that = this;
    if (that.data.select_index == 40) {
      wx.showToast({
        title: '请选择一种运动类型',
        duration: 2000,
        icon: 'none'
      })
    } else {
      var item = that.data.remain_array[that.data.select_index];
      that.data.selected_sport_type.push(item);
      this.setData({
        select_menu_state: 0,
        selected_sport_type: that.data.selected_sport_type    
      })   
    }   
  },
//---------------------------------------------- 

// function for select weekday array
clicked_weekday_item:function(event) {
  var that = this;
  var current_value = that.data.weekday_array[event.currentTarget.id];
  that.data.weekday_array[event.currentTarget.id] = (current_value + 1) %2;
  that.setData({
    weekday_array: that.data.weekday_array
  })
},
hideTimeListView: function(){
  var that = this;
  var weekday_one = "星期一";
  for (let index = 0; index < that.data.weekday_array.length; index++) {
    if(that.data.weekday_array[index] == '1')
    {      
      weekday_one = that.data.weekday_strs[index];      
      break;
    }    
  }  
  that.setData({
    select_weekday_state:0,
    weekday_one:weekday_one
  });
},
onclick_weekday: function() {
  var that = this;
  that.setData({
    select_weekday_state:1
  })
},



//function for select time range
changeStartTime1(event) {
  var _this = this
  _this.setData({
    time_start1: event.detail.value
  }) 
},
changeStartTimeColumn1(event) {
  var arr = this.data.time_start1;
  arr[event.detail.column] = event.detail.value; 
  this.setData({    
    time_start1: arr
  });
},

changeEndTime1(event) {
  var _this = this
  _this.setData({
    time_end1: event.detail.value
  })   
},
changeEndTimeColumn1(event) {
  var arr = this.data.time_end1;
  arr[event.detail.column] = event.detail.value; 
  this.setData({    
    time_end1: arr
  });
},

changeStartTime2(event) {
  var _this = this
  _this.setData({
    time_start2: event.detail.value
  }) 
},
changeStartTimeColumn2(event) {
  var arr = this.data.time_start2;
  arr[event.detail.column] = event.detail.value; 
  this.setData({    
    time_start2: arr
  });
},

changeEndTime2(event) {
  var _this = this
  _this.setData({
    time_end2: event.detail.value
  })   
},
changeEndTimeColumn2(event) {
  var arr = this.data.time_end2;
  arr[event.detail.column] = event.detail.value; 
  this.setData({    
    time_end2: arr
  });
},





//function for select booking unit
  clicked_bookingUnit_item: function(event) {
    var that = this;    
    that.setData({
      select_bookingUnit_state:0,
      booking_unit_index: event.currentTarget.id
    })

  },
  onclick_bookingUnit: function() {
    var that = this;
    that.setData({
      select_bookingUnit_state:1
    })
  },



  //function for add room info array
  deleteRoomInfo: function(event) {
    var that = this;
    var room_index = event.currentTarget.id;
    that.data.room_info_array.splice(room_index,1);
    that.setData({
      room_info_array:that.data.room_info_array
    })
  },
  onClick_AddRoom: function(event) {
    var that = this;
    that.data.room_info_array.push({name:'',cost:'0'});
    that.setData({
      room_info_array:that.data.room_info_array
    })
  },
  input_roomName: function(event) {
    var that = this;
    var room_index = event.currentTarget.id;
    that.data.room_info_array[room_index].name = event.detail.value;
    that.setData({
      room_info_array:that.data.room_info_array
    })
  },
  input_roomCost: function(event) {
    var that = this;
    var room_index = event.currentTarget.id;
    that.data.room_info_array[room_index].cost = event.detail.value;
    that.setData({
      room_info_array:that.data.room_info_array
    })
  },


  //function for select type unit 
  clicked_typeUnit_item: function(event) {
    var that = this;    
    that.setData({
      select_typeUnit_state:0,
      type_unit_index: event.currentTarget.id
    })

  },
  onclick_typeUnit: function() {
    var that = this;
    that.setData({
      select_typeUnit_state:1
    })
  },



// ----------------------------------
  onShow:function()
  {
    console.log("ONSHOW")
  },
  onReady:function()
  {
    console.log("ONREADY")
  },
  onHide:function()
  {
    console.log("ONHIDE")
  },
  
  on_click_image: function (e) {
    var that = this;
    var id = e.target.id;
    if(id>=that.data.selected)
    wx.chooseImage({
      count:1,
      success: function (res) {
        var image = that.data.image_path;
        if (res.tempFiles[0].size > 10485760) {
          that.data.overimagecount++;
        }
        image[that.data.selected] = res.tempFilePaths[0];
        that.setData({ image_path: image, selected: that.data.selected+1 })
        var select_buf = that.data.select;
        select_buf[that.data.selected] = 1;
        that.data.isimage ++
        that.setData({ select: select_buf })
      },
    })
  },
  on_click_delete:function(event)
  {
    var that = this;
    var image = that.data.image_path;
    var select_buf = that.data.select;
    var id=event.target.id;
    if(id<4){
      var index = 0;
      for(index = id; index<4; index++)
      {
        image[index] = image[1*index+1];
        select_buf[index] = select_buf[1 *index+1];
      }
      image[4] = '';
      select_buf[4] = 0;
    }
    else{
      image[4] = '';
      select_buf[4] = 1;
    }
    that.data.isimage--
    that.setData({
      image_path: image,
      select: select_buf,
      selected: that.data.selected-1
    })
  },
  blur_on_introduction: function(event){
    this.data.bossInfo.site_introduction = event.detail.value;
  },
  blur_on_service: function(event)
  {
    this.data.bossInfo.site_service = event.detail.value;    
  },
  on_click_save: function()
  {
    var that = this;

    if (that.data.selected_sport_type.length == 0) {
      wx.showToast({
        title: '请至少选择一个类别',
        icon: 'none'
      })
      return;
    }

    if (that.data.bossInfo.site_introduction == undefined) {
      wx.showToast({
        title: '请填写场馆介绍',
        icon: 'none'
      })
      return;
    }
    if (that.data.bossInfo.site_service.length == undefined ) {
      wx.showToast({
        title: '请填写服务介绍',
        icon: 'none'
      })
      return;
    }
    if (that.data.bossInfo.site_introduction.length == 0) {
      wx.showToast({
        title: '请填写场馆介绍',
        icon: 'none'
      })
      return;
    }
    if (that.data.bossInfo.site_service.length == 0) {
      wx.showToast({
        title: '请填写服务介绍',
        icon: 'none'
      })
      return;
    }    
    
    if(that.data.isimage == 0)
    {
      wx.showToast({
        title: '请上传场馆图片',
        icon: 'none'
      })
      return;
    }
    if (that.data.overimagecount != 0) {
      wx.showToast({
        title: '上传的场馆图片不能超过5M',
        icon: 'none'
      })
      return;
    }

    if (!that.data.weekday_array._find(item => item == 1)) {
      wx.showToast({
        title: '请在营业时间至少选择一个项目',
        icon: 'none'
      })
      return;
    }

    
    if ((that.data.time_start1[0]>that.data.time_end1[0])||((that.data.time_start1[0]==that.data.time_end1[0])&&((that.data.time_start1[1]>that.data.time_end1[1])))) {
      wx.showToast({
        title: '结束时间必须晚于开始时间',
        icon: 'none'
      })
      return;
    }
    if ((that.data.time_start2[0]>that.data.time_end2[0])||((that.data.time_start2[0]==that.data.time_end2[0])&&((that.data.time_start2[1]>that.data.time_end2[1])))) {
      wx.showToast({
        title: '结束时间必须晚于开始时间',
        icon: 'none'
      })
      return;
    }

    for (let index = 0; index < that.data.room_info_array.length; index++) {
      var item = that.data.room_info_array[index];
      if (item.name == '') {
        wx.showToast({
          title: '请填写单价',
          icon: 'none'
        })
        return;
      }
      if (isNaN(item.cost)) {
        wx.showToast({
          title: '单价必须是一个数',
          icon: 'none'
        })
        return;
      }
      if (1.0*item.cost <= 0) {
        wx.showToast({
          title: '单价必须是一个正数',
          icon: 'none'
        })
        return;
      }      
    }
    
    //set site_type and site_detail
    var all_type = that.get_all_type(); 
    var first_index = all_type.indexOf(that.data.selected_sport_type[0]);
    var site_type_detail = '' + first_index;
    var site_type = first_index;
    if (that.data.selected_sport_type.length > 1) {
      site_type = 31;
      for (let index = 1; index < that.data.selected_sport_type.length; index++) {
        var item = that.data.selected_sport_type[index];
        var sport_index = all_type.indexOf(item);
        site_type_detail = site_type_detail + ',' + sport_index;              
      }
    }
    that.data.bossInfo.site_type = site_type;
    that.data.bossInfo.site_type_detail = site_type_detail;

    //set service_time
    var service_array = [];
    for (let index = 0; index < that.data.weekday_array.length; index++) {
      if (that.data.weekday_array[index] == 1) {
        service_array.push(index+1);
      }      
    }
    var service_time = '' +service_array[0];
    if (service_array.length > 1) {
      for (let index = 1; index < service_array.length; index++) {
        var weekday_index = service_array[index];
        service_time = service_time + ',' + weekday_index
      }
    }
    that.data.bossInfo.service_time = service_time;

    //set start1,end1,start2,end2
    var timeArray = that.data.timeArray;
    var time_start1 = that.data.time_start1;
    var time_end1 = that.data.time_end1;
    var time_start2 = that.data.time_start2;
    var time_end2 = that.data.time_end2;
    var start1 = timeArray[0][time_start1[0]] + ':' + timeArray[1][time_start1[1]] + ':00';
    var end1 = timeArray[0][time_end1[0]] + ':' + timeArray[1][time_end1[1]] + ':00';
    var start2 = timeArray[0][time_start2[0]] + ':' + timeArray[1][time_start2[1]] + ':00';
    var end2 = timeArray[0][time_end2[0]] + ':' + timeArray[1][time_end2[1]] + ':00';
    that.data.bossInfo.start1 = start1;
    that.data.bossInfo.end1 = end1;
    that.data.bossInfo.start2 = start2;
    that.data.bossInfo.end2 = end2;

    //set service unit
    var service_unit = that.data.booking_units[that.data.booking_unit_index].value;
    that.data.bossInfo.service_unit = service_unit;

    //set cancel_time
    var cancel_time = that.data.type_units[that.data.type_unit_index].value;
    that.data.bossInfo.cancel_time = cancel_time;
    


    //upload booking array to the server
    wx.request({
      url: app.globalData.mainURL+'api/datamanage/updateRoom',
      method: 'POST',
      header: {
        'content-type': 'application/json'
      },
      data: {        
        'roomInfo': that.data.room_info_array,
        'user_id': app.globalData.userInfo.user_id
      },
      success: function()
      {

      }
    });

    wx.request({
      url: app.globalData.mainURL+'api/editSiteInfo1',
      method: 'POST',
      header: {
        'content-type': 'application/json'
      },
      data: {        
        'bossInfo': that.data.bossInfo,
        'user_id': app.globalData.userInfo.user_id
      },
      success: function()
      {
        for (var index = 0; index < that.data.image_path.length; index++) {
          var tempFilePath = that.data.image_path[index];          
          var index_buf = 0
          if (tempFilePath != '') {
            if (that.data.image_buf._find(item => (item == tempFilePath))) {
              //add only url in the database
              var path = tempFilePath.split('/');
              var fileName = path[path.length - 1];
              wx.request({
                url: app.globalData.mainURL + 'api/addSitePictureURL',
                method: 'POST',
                header: {
                  'content-type': 'application/json'
                },
                data: {
                  'user_id': app.globalData.userInfo.user_id,
                  'image': fileName
                }
              })
            }else {
              //upload image
              wx.uploadFile({
                url: app.globalData.mainURL + 'api/addSitePicture',
                filePath: tempFilePath,
                name: 'file',
                formData: {
                  'user_id': app.globalData.userInfo.user_id
                }
              })
            }         
          }
        }
        wx.showLoading({
          title: '上传中'
        })
        setTimeout(function () {
          wx.hideLoading()
          app.globalData.have_stadium = 1
          wx.setStorageSync("have_stadium", 1)
          wx.switchTab({
            url: '../profile',
          })
        }, 3000)
      }
    })
  }
})