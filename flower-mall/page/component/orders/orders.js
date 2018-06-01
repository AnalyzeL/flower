// page/component/orders/orders.js
import config from '../../../config.js'
Page({
  data:{
    address:{},
    hasAddress: true,
    total:0,
    carts:[],
    ids:[]
  },
  onLoad(options){
    // console.log(options.jsonselectcarts);
    const self=this;
    self.setData({
      carts: JSON.parse(options.jsonselectcarts)
    });
    console.log(self.data);
   
  },
  onReady() {
    this.getTotalPrice();
  },
  

  /**
   * 计算总价
   */
  getTotalPrice() {
    let orders = this.data.carts;
    let total = 0;
    for(let i = 0; i < orders.length; i++) {
      total += orders[i].total * orders[i].flower.price;
    }
    this.setData({
      total: total
    })
  },

  toPay() {
    let ids = [];
    for (var c of this.data.carts) {
      ids.push(c.id);
    }
   
    ids=JSON.stringify(ids);
    console.log(ids);
    var self = this;
    wx.showModal({
      title: '提示',
      content: '本系统只做演示，支付系统已屏蔽',
      text:'center',
      showCancel: false,
      success: function (res) {
        wx.request({
          url: config.host + 'index/cartsubmit.action',
          method: 'post',
          header: {
            'content-type': 'application/x-www-form-urlencoded'
          },
          data: { cartsids: ids },
        });
        wx.switchTab({
          url: '/page/component/index'
        })
      }
    })
  }
})