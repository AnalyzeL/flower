import config from '/config.js'
App({
  globalData: {
    userInfo_: null,
  },
  onLaunch: function () {
    wx.login({
      success: function (r) {
        var code = r.code;//登录凭证  
        if (code) {
          //2、调用获取用户信息接口  
          wx.getUserInfo({
            success: function (res) {
              // console.log({ encryptedData: res.encryptedData, iv: res.iv, code: code })
              //3.解密用户信息 获取unionId  
              //...  
              //3.请求自己的服务器，解密用户信息 获取unionId等加密信息  
              wx.request({
                url: 
                config.host+'index/decodeUserInfo.action',
                method: 'post',
                header: {
                  'content-type': 'application/x-www-form-urlencoded'
                },
                data: { encryptedData: res.encryptedData, iv: res.iv, code: code },
                success: function (data) {

                  //4.解密成功后 获取自己服务器返回的结果  
                  if (data.data.status == 1) {
                    console.log(data);
                    getApp().globalData.userInfo_=data.data.userInfo
                    if (getApp().globalData.userInfo_.isSave == "0") {
                      wx.showModal({
                        title: '提示',
                        content: '用户是第一次登陆请填写基本信息',
                        showCancel: false,
                        success: function (res) {
                          if (res.confirm) {
                            wx.redirectTo({
                              url: "./address/address",
                            });
                          }
                        }
                      })
                    }
                  } else {
                    console.log('解密失败')
                  }

                },
                fail: function () {
                  console.log('系统错误')
                }
              })
            },
            fail: function () {
              console.log('获取用户信息失败')
            }
          })
        } else {
          console.log('获取用户登录态失败！' + r.errMsg)
        }
      },
      fail: function () {
        callback(false)
      }
    })
  },
  onShow: function () {
    console.log('App Show')
  },
  onHide: function () {
    console.log('App Hide')
  },
  globalData: {
    hasLogin: false
  }
})
