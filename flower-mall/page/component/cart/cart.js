// page/component/new-pages/cart/cart.js
import config from '../../../config.js'
Page({
  data: {
    carts:[],               // 购物车列表
    selectcarts:[],         //选中的商品
    hasList:false,          // 列表是否有数据
    totalPrice:0,           // 总价，初始为0
    selectAllStatus:false,    // 全选状态，默认全选
    jsonselectcarts:null,    //选中的商品的json字符串
    obj:{
        name:"hello"
    }
  },
  onShow() {
    // console.log(getApp().globalData.userInfo);
    const self=this;
    wx.request({
      url: config.host + 'index/cartList.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { username: getApp().globalData.userInfo_.openId },
      success: function (res) {
        // console.log(res.data);
        self.setData({
          carts: res.data,
          selectcarts: [],
          jsonselectcarts:null,
          hasList: false,          
          totalPrice: 0,           
          selectAllStatus: false,    
        });
        // console.log(self.data.jsonselectcarts);
        // console.log(self.data);
        if (self.data.carts!=null){
          self.setData({
            hasList: true,
          });
        }
      }
    });

    this.getTotalPrice();
  },
  /**
   * 当前商品选中事件
   */
  selectList(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    const selected = carts[index].selected;
    carts[index].selected = !selected;
    if (carts[index].selected){
      this.data.selectcarts.push(carts[index]); 
    }else{
      let start=null;
      let i=0;
      for (var value of this.data.selectcarts) {
        if (value.id == carts[index].id){
          start=i;
          break;
        }
        i++;
      }
      // console.log(start);
      this.data.selectcarts.splice(start,1);
    }
    console.log(this.data.selectcarts);
    this.getTotalPrice();
    this.setData({
      jsonselectcarts: JSON.stringify(this.data.selectcarts),
    });
    // console.log(this.data.jsonselectcarts);
  },

  /**
   * 删除购物车当前商品
   */
  deleteList(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    const cartid = carts[index].id ;
    carts.splice(index,1);
    this.setData({
      carts: carts
    });
    if(!carts.length){
      this.setData({
        hasList: false
      });
    }else{
      this.getTotalPrice();
    }
    const self=this;
    wx.request({
      url: config.host + 'index/cartListdel.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { id: cartid },
    });
    let start = null;
    let i = 0;
    for (var value of this.data.selectcarts) {
      if (value.id == carts[index].id) {
        start = i;
        break;
      }
      i++;
    }
    this.data.selectcarts.splice(start, 1);
    console.log(this.data.selectcarts);
    this.setData({
      jsonselectcarts: JSON.stringify(this.data.selectcarts),
    });
  },

  /**
   * 购物车全选事件
   */
  selectAll(e) {
    let selectAllStatus = this.data.selectAllStatus;
    selectAllStatus = !selectAllStatus;
    let carts = this.data.carts;
    this.data.selectcarts=carts;
    this.setData({
      jsonselectcarts: JSON.stringify(this.data.selectcarts),
    });
    for (let i = 0; i < carts.length; i++) {
      carts[i].selected = selectAllStatus;
    }
    this.setData({
      selectAllStatus: selectAllStatus,
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 绑定加数量事件
   */
  addCount(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    let total = carts[index].total;
    total = total + 1;
    carts[index].total = total;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
    const self = this;
    const num = 1;
    const name = getApp().globalData.userInfo_.openId;
    const flowId = carts[index].flower.id;
    wx.request({
      url: config.host + 'index/addToCart.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { id: flowId, numb: num, username: name },
    });
    for (var value of this.data.selectcarts) {
      if (value.id == carts[index].id) {
        value.total = carts[index].total;
        break;
      }
    }
    this.setData({
      jsonselectcarts: JSON.stringify(this.data.selectcarts),
    });
  },

  /**
   * 绑定减数量事件
   */
  minusCount(e) {
    const index = e.currentTarget.dataset.index;
    const obj = e.currentTarget.dataset.obj;
    let carts = this.data.carts;
    let total = carts[index].total;
    if (total <= 1){
      return false;
    }
    total = total - 1;
    carts[index].total = total;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
    const cartid = carts[index].id;
    const self=this;
    wx.request({
      url: config.host + 'index/cartdel.action',
      method: 'post',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: { id: cartid },
    });
    for (var value of this.data.selectcarts) {
      if (value.id == carts[index].id) {
        value.total = carts[index].total;
        break;
      }
    }
    this.setData({
      jsonselectcarts: JSON.stringify(this.data.selectcarts),
    });
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let carts = this.data.carts;                  // 获取购物车列表
    let total = 0;
    for(let i = 0; i<carts.length; i++) {         // 循环列表得到每个数据
      if(carts[i].selected) {                     // 判断选中才会计算价格
        total += carts[i].total * carts[i].flower.price;   // 所有价格加起来
      }
    }
    this.setData({                                // 最后赋值到data中渲染到页面
      carts: carts,
      totalPrice: total.toFixed(2)
    });
  }

})