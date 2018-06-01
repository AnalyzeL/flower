import config from '../../config.js'
Page({
  data: {
    imgUrls: [
      '/image/b1.jpg',
      '/image/b2.jpg',
      '/image/b3.jpg'
    ],
    indicatorDots: false,
    autoplay: false,
    interval: 3000,
    duration: 800,
    flows: [],
  },
  tolist(e) {
    const id = e.currentTarget.dataset.id
    wx.navigateTo({
      url:"/page/component/details/details?id="+id,
    });
  },
  onReady() {
    var self = this;
    wx.request({
      url: config.host+'index/flowjson.action',
      success(res) {
        console.log(res.data);
        self.setData({
          flows: res.data
        })
      }
    });
  },
})