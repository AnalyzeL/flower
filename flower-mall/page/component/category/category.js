import config from '../../../config.js'
Page({
    data: {
        category: [],
        detail:[],
        curIndex: 0,
        isScroll: false,
        toView: 'guowei',
        flows:[],
    },
    onReady(){
      const self=this;
      wx.request({
        url: config.host+'index/categorylist.action',
        method: 'post',
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        // data: { id: flowId },
        success: function (res) {
          // console.log(res.data);
          self.setData({
            category: res.data
          });
          wx.request({
            url: config.host+'index/categoryflows.action',
            method: 'post',
            header: {
              'content-type': 'application/x-www-form-urlencoded'
            },
            data: { id: self.data.category[0].id},
            success: function (resp) {
              self.setData({
                flows: resp.data
              });
              console.log(self.data.flows);
            }
          });
        }
      });
    },
    toflow(e){
      const id = e.currentTarget.dataset.id;
      wx.navigateTo({
          url: "/page/component/details/details?id=" + id,
      });
    },
    switchTab(e){
      const self = this;
      const id = e.currentTarget.dataset.id;
      console.log(id);
      wx.request({
        url: config.host + 'index/categoryflows.action',
        method: 'post',
        data:{ id:id},
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        success: function (resp) {
          self.setData({
            flows: resp.data
          });
          console.log(self.data.flows);
        }
      });
      this.setData({
        isScroll: true
      })
      setTimeout(function(){
        self.setData({
          toView: e.target.dataset.id,
          curIndex: e.target.dataset.index
        })
      },0)
      setTimeout(function () {
        self.setData({
          isScroll: false
        })
      },1)     
    }
})