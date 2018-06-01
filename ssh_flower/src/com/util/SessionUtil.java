package com.util;

import java.util.Map;

import com.service.ShopcartService;


/**
 * Session工具类
 */
public class SessionUtil {
	

	/**
	 * 初始化购物车
	 */
	public static void initShopCard(Map<String, Object> session, ShopcartService shopcartService) {
		if (session.get("username") != null) {  // 如果已经有用户登录 则加载订单信息
			session.put("total_count", shopcartService.getTotalCount(session.get("username").toString()));	// 将购买商品总数写入session
			session.put("total_price", shopcartService.getTotalPrice(session.get("username").toString()));		// 将商品总价写入session
		}
	}

}
