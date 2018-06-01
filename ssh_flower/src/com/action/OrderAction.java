package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Customer;
import com.entity.Flower;
import com.entity.Orders;
import com.service.CustomerService;
import com.service.FlowerService;
import com.service.OrderService;
import com.service.ShopcartService;

/**
 * 订单action
 * 响应订单的增删改查等功能
 * @author admin
 */
@Namespace("/admin")
@Results({
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="order",location="/index/order.jsp"),
	@Result(name="orderlist",location="/admin/pages/order-list.jsp"),
	@Result(name="orderlists",location="/admin/pages/order-lists.jsp"),
	@Result(name="reorderlist",type="redirectAction",location="orderList.action"),
	@Result(name="reorderlists",type="redirectAction",location="orderLists.action"),
})
public class OrderAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int flowerid;
	private int customerid;
	
	@Resource
	private OrderService orderService;
	@Resource
	private FlowerService flowerService;
	@Resource
	private ShopcartService shopcartService;
	@Resource
	private CustomerService customerService;
	
	
	//获取未处理的订单列表
	@Action("orderList")
	public String orderlist(){
		List<Orders> orders = orderService.getUntreatedOrders();//获取所有订单信息
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlist";
	}
	
	//按商品查询未处理订单
	@Action("orderByFlower")
	public String findByFlower(){
		List<Orders> orders = orderService.getUntreatedOrdersByFlower(flowerid);
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlist";
	}
	
	//按顾客查询未处理订单
	@Action("orderByCustomer")
	public String findByCustomer(){
		List<Orders> orders = orderService.getUntreatedOrdersByCustomer(customerid);
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlist";
	}
	
	//获取已处理的订单列表
	@Action("orderLists")
	public String orderlists(){
		List<Orders> orders = orderService.getTreatedOrders();
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlists";
	}
	
	//按商品查询已处理订单
	@Action("orderByFlowers")
	public String findByFlowers(){
		List<Orders> orders = orderService.getUntreatedOrdersByFlowers(flowerid);
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlists";
	}
	
	//按顾客查询已处理订单
	@Action("orderByCustomers")
	public String findByCustomers(){
		List<Orders> orders = orderService.getUntreatedOrdersByCustomers(customerid);
		List<Flower> flowers = flowerService.getFlowers();
		List<Customer> customers = customerService.getCustomers();
		getRequest().put("flowers", flowers);
		getRequest().put("customers", customers);
		getRequest().put("orders", orders);
		return "orderlists";
	}
	
	//处理订单
	@Action("orderDispose")
	public String dispose(){
		String id=getServletRequest().getParameter("id");
		int order_id = Integer.parseInt(id);
		orderService.disposeOrder(order_id);
		return "reorderlist";
	}
	
	//删除未处理订单
	@Action("orderRemove")
	public String remove(){
		int order_id = Integer.parseInt(getServletRequest().getParameter("id"));
		orderService.removeOrder(order_id);
		return "reorderlist";
	}
	
	//删除已处理订单
	@Action("orderRemoves")
	public String removes(){
		int order_id = Integer.parseInt(getServletRequest().getParameter("id"));
		orderService.removeOrder(order_id);
		return "reorderlists";
	}
	

	public int getFlowerid() {
		return flowerid;
	}

	public void setFlowerid(int flowerid) {
		this.flowerid = flowerid;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

}
