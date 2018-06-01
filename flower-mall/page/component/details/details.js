// page/component/details/details.js
import config from '../../../config.js'
Page({
  data:{
    num: 1,
    totalNum: 0,
    hasCarts: false,
    curIndex: 0,
    show: false,
    scaleCart: false,
    flow: [],
    carts:[],
  },
  onLoad: function (options) {
    const flowId = options.id;
    var self = this;
    wx.request({
      url: config.host+'index/flowlist.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { id: flowId },
      success: function (res) {
        self.setData({
          flow: res.data
        });
      }
    });
  },
  addCount() {
    let num = this.data.num;
    num++;
    this.setData({
      num : num
    })
  },

  addToCart() {
    const self = this;
    const num = this.data.num;
    let total = this.data.totalNum;
    const name = getApp().globalData.userInfo_.openId;
    const flowId = self.data.flow.id;
    // console.log(getApp().globalData.userInfo_.openId);
    wx.request({
      url: config.host + 'index/addToCart.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { id: flowId,numb:num,username:name },
      success: function (res) {
        console.log(res.data);
        // self.setData({
        //   flow: res.data
        // });
      }
    });
    self.setData({
      show: true
    })
    setTimeout( function() {
      self.setData({
        show: false,
        scaleCart : true
      })
      setTimeout( function() {
        self.setData({
          scaleCart: false,
          hasCarts : true,
          totalNum: num + total
        })
      }, 200)
    }, 300)

  },

  bindTap(e) {
    const index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      curIndex: index
    })
  }
 
})