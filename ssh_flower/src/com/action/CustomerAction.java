package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.alibaba.fastjson.JSON;
import com.entity.Customer;
import com.entity.CustomerAll;
import com.entity.CustomerClass;
import com.service.CustomerService;

/**
 * 顾客action
 * 响应顾客信息的增删改查等功能
 */
@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/pages/customer-list.jsp"),
	@Result(name="add",location="/admin/pages/customer-add.jsp"),
	@Result(name="update",location="/admin/pages/customer-update.jsp"),
	@Result(name="class",location="/admin/pages/customer-class.jsp"),
	@Result(name="updateclass",location="/admin/pages/customer-updateclass.jsp"),
	@Result(name="addclass",location="/admin/pages/customer-addclass.jsp"),
	@Result(name="relist",type="redirectAction",location="customerList.action"),
	@Result(name="classrelist",type="redirectAction",location="customerClass.action"),
})
public class CustomerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CustomerService customerService;
	
	//定义属性, 用于struts自动封装参数
	private Customer customer;
	//定义属性, 用于struts自动封装参数
	private CustomerClass customerClass;
	
	//获取顾客信息列表
	@Action("customerList")
	public String list(){
		List<CustomerAll> customerAlls = customerService.getCustomerAlls();
		getRequest().put("customerAlls", customerAlls);
		return "list";
	}
	//获取顾客分类信息列表
		@Action("customerClass")
		public String classList(){
			List<CustomerClass> customerClass = customerService.getCustomerClass();
			getRequest().put("customerclass", customerClass);
			return "class";
		}
		@Action("test")
		public String test(){
			List<Customer> customers = customerService.getCustomers();
			String cs=JSON.toJSONString(customers);
			ResponseWrite(cs);
			return null;
		}
	
	//删除顾客信息
	@Action("customerDelete")
	public String delete(){
		customerService.delete(customer);
		return "relist";
	}
	
	//删除顾客分类信息
		@Action("customerClassDelete")
		public String deleteclass(){
			customerService.deleteclass(customerClass);
			return "classrelist";
		}
	//更新顾客信息
	@Action("customerUpdatepage")
	public String updatepage(){
		customer = customerService.getCustomer(customer.getId());
		return "update";
	}
	//更新顾客分类信息
	@Action("customerclassUpdatepage")
	public String updateclasspage(){
		System.out.println(customerClass.getUserclassId());
		customerClass = customerService.getCustomerClass(customerClass.getUserclassId());
		return "updateclass";
	}
	
	//更新顾客分类信息
	@Action("customerclassUpdate")
	public String updateclass(){
		customerService.updateclass(customerClass);
		return "classrelist";
	}
	//更新顾客信息
		@Action("customerUpdate")
		public String update(){
			customerService.update(customer);
			return "relist";
		}
	
	//添加顾客信息页面
	@Action("customerAddpage")
	public String addpage(){
		return "add";
	}
	//添加顾客分类信息页面
	@Action("customerclassAddpage")
	public String addclasspage(){
		return "addclass";
	}
	
	//添加顾客信息
//	@Action("customerAdd")
//	public String add(){
//		if (customerService.isUser(customer)) {		//判断用户名是否已经存在
//			getRequest().put("msg", "(用户名已存在!!)");
//			return "add";
//		}else {
//			customerService.add(customer);		//添加用户
//			return "relist";
//		}
//	}
	//添加顾客分类信息
	@Action("customerclassAdd")
	public String addclass(){
		customerService.addclass(customerClass);		
		return "classrelist";
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public CustomerClass getCustomerClass() {
		return customerClass;
	}
	public void setCustomerClass(CustomerClass customerClass) {
		this.customerClass = customerClass;
	}
	
}
