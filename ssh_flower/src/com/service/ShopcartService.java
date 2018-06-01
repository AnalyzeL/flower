package com.service;

import java.util.List;

import javax.annotation.Resource;







import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerDao;
import com.dao.FlowerDao;
import com.dao.ShopcartDao;
import com.entity.Customer;
import com.entity.Flower;
import com.entity.Shopcart;
import com.service.ShopcartService;


/**
 * 订单service 
 */
@Service
@Transactional	//配置此方法加入事务管理
public class ShopcartService{

	@Resource 
	private FlowerDao flowerDao;
	@Resource
	private ShopcartDao shopcartDao;
	@Resource
	private CustomerDao customerDao;
	@Resource
	private Shopcart shopcart;

	//获取订单
	public Shopcart get(String username, int flower_id){
		return shopcartDao.getCart(username, flower_id);
	}
	
	//添加订单
	public void add(String username, int flower_id) {
		Flower flower = flowerDao.getFlower(flower_id);	//获取鲜花信息
		Customer customer = customerDao.getCustomer(username);
		shopcart.setFlower(flower);
		shopcart.setCustomer(customer);
		shopcart.setTotal(1);
		shopcart.setPrice(flower.getPrice());
		shopcartDao.save(shopcart);
	}
	
	//更新订单
	public void updateCart(String username, int flower_id) {
		shopcart = shopcartDao.getCart(username, flower_id);
		shopcart.setTotal(shopcart.getTotal()+1);
		shopcart.setPrice(shopcart.getPrice()+shopcart.getFlower().getPrice());
		shopcartDao.update(shopcart);
	}

	//获取订单信息
	public List<Shopcart> getCartList(String username) {
		return shopcartDao.getCartList(username);
	}

	//获取用户购买商品总数
	public int getTotalCount(String username) {
		return (int)shopcartDao.getTotalCount(username);
	}

	//获取用户商品总价值
	public int getTotalPrice(String username) {
		return (int)shopcartDao.getTotalPrice(username);
	}

	//删除订单
	public void delete(int id) {
		shopcart.setId(id);
		shopcartDao.delete(shopcart);
	}
	//更具id查询订单
	public Shopcart find(int id) {
		return shopcartDao.getOrder(id);
		
	}
	//更新订单
	public void updata(Shopcart shopcart) {
		shopcartDao.update(shopcart);
	}
}
