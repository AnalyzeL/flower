package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.CustomerDao;
import com.entity.Customer;
import com.entity.CustomerClass;

/**
 * 顾客dao实现  
 * 负责顾客相关的数据库操作
 */
@Repository//注册dao层bean等同于@Component
public class CustomerDao extends BaseDao{

	//根据id获取顾客信息
	public Customer getCustomer(int id) {
		return getSession().createQuery("from Customer where id=:id", Customer.class)
				.setParameter("id", id).uniqueResult();
	}
	
	//根据用户名和密码查找用户
	public Customer getCustomer(String username, String password){
		return getSession().createQuery("from Customer where username=:username and password=:password", Customer.class)
			.setParameter("username", username).setParameter("password", password).uniqueResult();
	}

	//根据用户名查找用户
	public Customer getCustomer(String username) {
		return getSession().createQuery("from Customer where username=:username", Customer.class)
				.setParameter("username", username).uniqueResult();
	}

	//获取顾客信息列表
	public List<Customer> getCustomers() {
		return getSession().createQuery("from Customer", Customer.class).list();
	}
	//获取顾客分类信息列表
	public List<CustomerClass> getCustomerClasss() {
		return getSession().createQuery("from CustomerClass", CustomerClass.class).list();
	}
	//根据id获取顾客分类信息
		public CustomerClass getCustomerClass(int id) {
			return getSession().createQuery("from CustomerClass where userclassId=:id", CustomerClass.class)
					.setParameter("id", id).uniqueResult();
		}
}
