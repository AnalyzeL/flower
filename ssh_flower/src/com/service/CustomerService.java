package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerDao;
import com.dao.OrderDao;
import com.entity.Customer;
import com.entity.CustomerAll;
import com.entity.CustomerClass;
import com.service.CustomerService;

/**
 * 顾客service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class CustomerService{

	@Resource
	private CustomerDao customerDao;
	@Resource
	private OrderDao orderDao;

	public Customer getCustomer(int id) {
		return customerDao.getCustomer(id);
	}
	
	//获取顾客信息
	public Customer getCustomer(String username, String password){
		return customerDao.getCustomer(username, password);
	}
	
	//获取顾客信息
	public Customer getCustomer(String username) {
		return customerDao.getCustomer(username);
	}

	//注册用户
	public boolean register(Customer customer) {
		return customerDao.save(customer);
	}

	//获取顾客信息列表
	public List<Customer> getCustomers() {
		return customerDao.getCustomers();
		
	}
	public List<CustomerAll> getCustomerAlls(){
		List<Customer> customers= customerDao.getCustomers();
		List<CustomerClass> customerClass=customerDao.getCustomerClasss();
		List<CustomerAll> customerAlls=new ArrayList<CustomerAll>();
		for(Customer customer:customers){
			CustomerAll all=new CustomerAll();
			all.setCustomer(customer);
			all.setConsumption(orderDao.getUserConsumption(customer.getId()));
			for(CustomerClass classs:customerClass){
				if(all.getConsumption()<classs.getUserinfomax()&&all.getConsumption()>classs.getUserinfomin()){
					all.setUserclassname(classs.getUserclassname());
				}
			}
			customerAlls.add(all);
		}
		return customerAlls;
	}
	
	//删除顾客信息
	public void delete(Customer customer) {
		customerDao.delete(customer);//删除此顾客信息
	}
	//删除顾客分类信息
	public void deleteclass(CustomerClass customerClass) {
		customerDao.delete(customerClass);//删除此顾客信息
	}

	//更新顾客信息
	public void update(Customer customer) {
		customerDao.update(customer);
	}

	//添加顾客信息
	public void add(Customer customer) {
		customerDao.save(customer);
	}
	//添加顾客信息
	public void addclass(CustomerClass customerClass) {
		customerDao.save(customerClass);
	}

	//判断用户名是否存在
	public boolean isUser(Customer customer) {
		if (customerDao.getCustomer(customer.getUsername())!=null) {
			return true;
		}return false;
	}
	
	//获取顾客分类信息列表
		public List<CustomerClass> getCustomerClass() {
			return customerDao.getCustomerClasss();
		}
		//根据id获取顾客分类信息
		public CustomerClass getCustomerClass(int id) {
			return customerDao.getCustomerClass(id);
		}
		//更新顾客分类信息
		public void updateclass(CustomerClass customerClass) {
			customerDao.update(customerClass);
		}
}
