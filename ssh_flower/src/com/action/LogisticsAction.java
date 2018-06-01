package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Logistics;
import com.entity.Manager;
import com.entity.Orders;
import com.entity.RepertoryReally;
import com.service.LogisticsService;
import com.service.ManagerService;
import com.service.OrderService;
import com.service.RepertoryService;

/**
 * 物流action
 * 响应物流信息的增删改查等功能
 */
@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/pages/Logistics-list.jsp"),
	@Result(name="add",location="/admin/pages/Logistics-add.jsp"),
	@Result(name="update",location="/admin/pages/Logistics-update.jsp"),
	@Result(name="chose",location="/admin/pages/Logistics-chose.jsp"),
	@Result(name="relist",type="redirectAction",location="LogisticsList.action"),
})
public class LogisticsAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private Logistics logistics;
	private int order_id;
	private int flowerid;
	public int getFlowerid() {
		return flowerid;
	}
	public void setFlowerid(int flowerid) {
		this.flowerid = flowerid;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	@Resource
	private LogisticsService logisticsService;
	@Resource
	private OrderService orderService;
	@Resource
	private RepertoryService repertoryService;
	
	//获取物流信息列表
	@Action("LogisticsList")
	public String list(){
		List<Logistics> logisticss = logisticsService.getLogisticss();
		getRequest().put("logisticss", logisticss);
		return "list";
	}
	//获取物流发送页面
	@Action("Logisticschose")
	public String chose(){
		List<Logistics> logisticss = logisticsService.getLogisticss();
		order_id = Integer.parseInt(getServletRequest().getParameter("id"));
//		System.out.println(getServletRequest().getQueryString());
		flowerid=Integer.parseInt(getServletRequest().getParameter("flowerid"));
		List<RepertoryReally>  repertoryReally= repertoryService.getRepertoryReallyByFlowerID(flowerid);
		getRequest().put("repertoryReally", repertoryReally);
		getRequest().put("logisticss", logisticss);
		getRequest().put("ord_id", order_id);
		return "chose";
	}
	
	//删除物流信息
	@Action("LogisticsDelete")
	public String delete(){
		logisticsService.delete(logistics.getId());
		return "relist";
	}
	
	//更新页面
	@Action("LogisticsUpdatepage")
	public String updatepage(){
		logistics = logisticsService.getLogistics(logistics.getId());
		return "update";
	}
	
	//更新物流信息
	@Action("LogisticsUpdate")
	public String update(){
		logisticsService.update(logistics);
		return "relist";
	}
	
	//添加页面
	@Action("LogisticsAddpage")
	public String addpage(){
		return "add";
	}
	
	//添加物流信息
	@Action("LogisticsAdd")
	public String add(){
		
		logisticsService.add(logistics);
		return "relist";
		
	}

	public Logistics getLogistics() {
		return logistics;
	}

	public void setLogistics(Logistics logistics) {
		this.logistics = logistics;
	}
	
	
	
	
}
