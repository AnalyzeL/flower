package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.ShopcartDao;
import com.entity.Shopcart;

/**
 * 购物车dao实现 负责订单相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class ShopcartDao extends BaseDao{

	
	//根据id获取订单信息
	public Shopcart getOrder(int order_id) {
		return getSession().createQuery("from Shopcart where id=:id", Shopcart.class)
				.setParameter("id", order_id).uniqueResult();
	}
	
	//根据用户名和鲜花id获取订单信息
	public Shopcart getCart(String username, int flower_id) {
		return getSession().createQuery("from Shopcart where flower_id=:id and customer_id=(from Customer where username=:username)", Shopcart.class)
				.setParameter("id", flower_id).setParameter("username", username).uniqueResult();
	}

	//根据用户名获取订单信息
	public List<Shopcart> getCartList(String username) {
		return getSession().createQuery("from Shopcart where customer_id=(from Customer where username=:username)", Shopcart.class)
				.setParameter("username", username).list();
	}

	//获取用户购买商品总数
	public long getTotalCount(String username) {
		return getSession().createQuery("select coalesce(sum(total), 0) from Shopcart where customer_id=(select id from Customer where username=:username)", Long.class)
				.setParameter("username", username).uniqueResult();
	}

	//获取用户商品总价值
	public long getTotalPrice(String username) {
		return getSession().createQuery("select coalesce(sum(price), 0) from Shopcart where customer_id=(select id from Customer where username=:username)", Long.class)
				.setParameter("username", username).uniqueResult();
	}

	//获取未处理的订单列表(默认按用户排序)
	public List<Shopcart> getUntreatedOrders() {
		return getSession().createQuery("from Shopcart where dispose=0 order by customer_id", Shopcart.class).list();
	}
	
	//获取未处理的订单列表(默认按用户排序)
	public List<Shopcart> getUntreatedOrdersByFlower(int flowerid) {
		return getSession().createQuery("from Shopcart where dispose=0 and flower_id=:flowerid order by customer_id", Shopcart.class)
				.setParameter("flowerid", flowerid).list();
	}
	
	//获取未处理的订单列表(默认按用户排序)
	public List<Shopcart> getUntreatedOrdersByCustomer(int customerid) {
		return getSession().createQuery("from Shopcart where dispose=0 and customer_id=:customerid order by customer_id", Shopcart.class)
				.setParameter("customerid", customerid).list();
	}

	//获取已处理的订单列表
	public List<Shopcart> getTreatedOrders() {
		return getSession().createQuery("from Shopcart where dispose=1 order by customer_id", Shopcart.class).list();
	}
	
	//获取已处理的订单列表(默认按用户排序)
	public List<Shopcart> getUntreatedOrdersByFlowers(int flowerid) {
		return getSession().createQuery("from Shopcart where dispose=1 and flower_id=:flowerid order by customer_id", Shopcart.class)
				.setParameter("flowerid", flowerid).list();
	}
	
	//获取已处理的订单列表(默认按用户排序)
	public List<Shopcart> getUntreatedOrdersByCustomers(int customerid) {
		return getSession().createQuery("from Shopcart where dispose=1 and customer_id=:customerid order by customer_id", Shopcart.class)
				.setParameter("customerid", customerid).list();
	}

	
}
