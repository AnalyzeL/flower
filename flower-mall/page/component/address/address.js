// page/component/new-pages/user/address/address.js
import config from '../../../config.js'
Page({
  data:{
      username:'',
      phone:'',
      address:''
  },
  phone: function (e) {
    this.data.phone = e.detail.value;
  },  
  address: function (e) {
    this.data.address = e.detail.value;
  }, 
  onLoad(){
    var self = this;
    // wx.getStorage({
    //   key: 'address',
    //   success: function(res){
    //     self.setData({
    //       address : res.data
    //     })
    //   }
    // })
    self.setData({
      username: getApp().globalData.userInfo_.openId
    })
    // console.log(getApp().globalData.userInfo_.isSave);
    if (getApp().globalData.userInfo_.isSave == "1") {
      // console.log("11");
      self.setData({
        address: getApp().globalData.userInfo_.address,
        phone: getApp().globalData.userInfo_.phone,
      })
    }

  },
  formSubmit(e){
    var self = this;
    // console.log(self.data);
    console.log(getApp().globalData.userInfo_.address);
    if (self.data.username && self.data.phone && self.data.address){
      wx.request({
        url: config.host+'index/weixinRegister.action',
        method: 'post',
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        data: { address: self.data.address, phone: self.data.phone, username: self.data.username},
        success:function(){
          console.log("success");
          getApp().globalData.userInfo_.address = self.data.address
          getApp().globalData.userInfo_.phone = self.data.phone
          getApp().globalData.userInfo_.isSave = "1"
          // console.log(getApp().globalData.userInfo_);
          wx.switchTab({
            url: "/page/component/index",
            fail(err) {
              console.log(err)
            }
          });
        }
      });
    }else{
      wx.showModal({
        title:'提示',
        content:'请填写完整资料',
        showCancel:false
      })
    }
  }
})