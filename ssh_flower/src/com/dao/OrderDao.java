package com.dao;

import java.util.List;

import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import com.entity.Orders;


/**
 * 订单dao实现  
 * 负责订单相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class OrderDao extends BaseDao{

	
	//根据id获取订单信息
	public Orders getOrder(int order_id) {
		return getSession().createQuery("from Orders where id=:id", Orders.class)
				.setParameter("id", order_id).uniqueResult();
	}
	
	//根据用户名和鲜花id获取订单信息
	public Orders getOrder(String username, int flower_id) {
		return getSession().createQuery("from Orders where flower_id=:id and customer_id=(from Customer where username=:username)", Orders.class)
				.setParameter("id", flower_id).setParameter("username", username).uniqueResult();
	}

	//根据用户名获取订单信息
	public List<Orders> getOrders(String username) {
		return getSession().createQuery("from Orders where customer_id=(from Customer where username=:username) order by id desc", Orders.class)
				.setParameter("username", username).list();
	}

	//获取用户购买商品总数
	public long getTotalCount(String username) {
		return getSession().createQuery("select coalesce(sum(total), 0) from Orders where customer_id=(select id from Customer where username=:username)", Long.class)
				.setParameter("username", username).uniqueResult();
	}

	//获取用户商品总价值
	public long getTotalPrice(String username) {
		return getSession().createQuery("select coalesce(sum(price), 0)) from Orders where customer_id=(select id from Customer where username=:username)", Long.class)
				.setParameter("username", username).uniqueResult();
	}

	//获取未处理的订单列表(默认按用户排序)
	public List<Orders> getUntreatedOrders() {
		return getSession().createQuery("from Orders where dispose=0 order by customer_id", Orders.class).list();
	}
	
	//获取未处理的订单列表(默认按用户排序)
	public List<Orders> getUntreatedOrdersByFlower(int flowerid) {
		return getSession().createQuery("from Orders where dispose=0 and flower_id=:flowerid order by customer_id", Orders.class)
				.setParameter("flowerid", flowerid).list();
	}
	
	//获取未处理的订单列表(默认按用户排序)
	public List<Orders> getUntreatedOrdersByCustomer(int customerid) {
		return getSession().createQuery("from Orders where dispose=0 and customer_id=:customerid order by customer_id", Orders.class)
				.setParameter("customerid", customerid).list();
	}

	//获取已处理的订单列表
	public List<Orders> getTreatedOrders() {
		return getSession().createQuery("from Orders where dispose=1 order by customer_id", Orders.class).list();
	}
	
	//获取已处理的订单列表(默认按用户排序)
	public List<Orders> getUntreatedOrdersByFlowers(int flowerid) {
		return getSession().createQuery("from Orders where dispose=1 and flower_id=:flowerid order by customer_id", Orders.class)
				.setParameter("flowerid", flowerid).list();
	}
	
	//获取已处理的订单列表(默认按用户排序)
	public List<Orders> getUntreatedOrdersByCustomers(int customerid) {
		return getSession().createQuery("from Orders where dispose=1 and customer_id=:customerid order by customer_id", Orders.class)
				.setParameter("customerid", customerid).list();
	}
	//根据用户id查询用户的销售总额
	public int getUserConsumption(int customerid){
		List<Object> i=getSession().createSQLQuery("SELECT SUM(price) a FROM orders WHERE dispose=1 AND customer_id=?;").setParameter(0, customerid).getResultList();
		if(i.get(0)==null){
			return 0;
		}else{
			return Integer.parseInt(i.get(0).toString());
		}
	}
}