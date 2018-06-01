package com.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerDao;
import com.dao.FlowerDao;
import com.dao.OrderDao;
import com.entity.Customer;
import com.entity.Flower;
import com.entity.Orders;

/**
 * 订单service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class OrderService{

	@Resource 
	private FlowerDao flowerDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private CustomerDao customerDao;
	@Resource
	private Orders orders;

	//获取订单
	public Orders getOrder(String username, int flower_id){
		return orderDao.getOrder(username, flower_id);
	}
	
	//添加订单
	public void addOrder(String username, int flower_id, int total) {
		Flower flower = flowerDao.getFlower(flower_id);	//获取鲜花信息
		Customer customer = customerDao.getCustomer(username);
		orders.setFlower(flower);
		orders.setCustomer(customer);
		orders.setTotal(total);
		orders.setPrice(flower.getPrice() * total);
		orders.setDispose(false);
		orders.setSystime(new Date());
		orderDao.save(orders);
	}
	
	//更新订单
	public void updateOrder(String username, int flower_id) {
		orders = orderDao.getOrder(username, flower_id);
		orders.setTotal(orders.getTotal()+1);
		orders.setPrice(orders.getPrice()+orders.getFlower().getPrice());
		orderDao.update(orders);
	}

	//获取订单信息
	public List<Orders> getOrders(String username) {
		return orderDao.getOrders(username);
	}

	//获取用户购买商品总数
	public int getTotalCount(String username) {
		return (int)orderDao.getTotalCount(username);
	}

	//获取用户商品总价值
	public int getTotalPrice(String username) {
		return (int)orderDao.getTotalPrice(username);
	}

	//删除订单
	public void deleteOrder(int id) {
		orders.setId(id);
		orderDao.delete(orders);
	}

	//获取未处理的订单列表
	public List<Orders> getUntreatedOrders() {
		return orderDao.getUntreatedOrders();
	}
	
	//获取未处理的订单列表
	public List<Orders> getUntreatedOrdersByFlower(int flowerid) {
		if (flowerid > 0) {
			return orderDao.getUntreatedOrdersByFlower(flowerid);
		}
		return orderDao.getUntreatedOrders();
	}
	
	//获取未处理的订单列表
	public List<Orders> getUntreatedOrdersByCustomer(int customerid) {
		if (customerid > 0) {
			return orderDao.getUntreatedOrdersByCustomer(customerid);
		}
		return orderDao.getUntreatedOrders();
	}

	//获取已处理的订单列表
	public List<Orders> getTreatedOrders() {
		return orderDao.getTreatedOrders();
	}
	
	//获取已处理的订单列表
	public List<Orders> getUntreatedOrdersByFlowers(int flowerid) {
		if (flowerid > 0) {
			return  orderDao.getUntreatedOrdersByFlowers(flowerid);
		}
		return orderDao.getTreatedOrders();
	}
	
	//获取已处理的订单列表
	public List<Orders> getUntreatedOrdersByCustomers(int customerid) {
		if (customerid > 0) {
			return orderDao.getUntreatedOrdersByCustomers(customerid);
		}
		return orderDao.getTreatedOrders();
	}

	//处理订单
	public void disposeOrder(int order_id) {
		orders = orderDao.getOrder(order_id);	//根据id获取订单信息
		orders.setDispose(true);	//修改订单处理状态
		orderDao.update(orders);	//更新订单
	}

	//删除未处理订单
	public void removeOrder(int order_id) {
		orders = orderDao.getOrder(order_id);	//根据id获取订单信息
		orderDao.delete(orders);	//删除订单记录
	}
	//根据id查询订单
	public Orders getOrder(int order_id) {
		return orderDao.getOrder(order_id);
	}
}
