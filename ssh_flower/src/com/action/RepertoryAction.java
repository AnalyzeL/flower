package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Flower;
import com.entity.Logistics;
import com.entity.Manager;
import com.entity.Offlinestore;
import com.entity.Orders;
import com.entity.Repertory;
import com.entity.RepertoryReally;
import com.service.FlowerService;
import com.service.LogisticsService;
import com.service.ManagerService;
import com.service.OfflinestoreService;
import com.service.OrderService;
import com.service.RepertoryService;

/**
 * 库存action
 * 响应库存信息的增删改查等功能
 */
@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/pages/repertory-list.jsp"),
	@Result(name="add",location="/admin/pages/repertory-add.jsp"),
	@Result(name="update",location="/admin/pages/Logistics-update.jsp"),
	@Result(name="chose",location="/admin/pages/Logistics-chose.jsp"),
	@Result(name="relist",type="redirectAction",location="RepertoryList.action"),
})
public class RepertoryAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private int flowerid;
	private int id;
	
	private Repertory repertory;
	
	public Repertory getRepertory() {
		return repertory;
	}

	public void setRepertory(Repertory repertory) {
		this.repertory = repertory;
	}

	public int getFlowerid() {
		return flowerid;
	}

	public void setFlowerid(int flowerid) {
		this.flowerid = flowerid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Resource
	private RepertoryService repertoryService;
	@Resource
	private OrderService orderService;
	@Resource
	private FlowerService flowerService;
	@Resource
	private OfflinestoreService offlinestoreService;
	
	
	//获取物流信息列表
	@Action("RepertoryList")
	public String list(){
		List<RepertoryReally>  repertoryReally= repertoryService.getRepertoryReally();
		getRequest().put("repertoryReally", repertoryReally);
		return "list";
	}
	
	//获取物流信息列表
		@Action("RepertoryFlowerList")
		public String RepertoryFlowerList(){
			flowerid = Integer.parseInt(getServletRequest().getParameter("id"));
			List<RepertoryReally>  repertoryReally= repertoryService.getRepertoryReallyByFlowerID(flowerid);
			getRequest().put("repertoryReally", repertoryReally);
			return "list";
		}

	//添加页面
	@Action("RepertoryAddpage")
	public String addpage(){
		List<Flower> flowers = flowerService.getFlowers();
		List<Offlinestore> offlinestores = offlinestoreService.getOfflinestores();
		getRequest().put("offlinestores", offlinestores);
		getRequest().put("flowers", flowers);
		return "add";
	}
	
	//添加物流信息
	@Action("RepertoryAdd")
	public String add(){
		Flower flower=flowerService.getFlower(repertory.getFlowerID());
		flower.setStock(flower.getStock()+repertory.getNum());
		flowerService.update(flower);
		repertoryService.add(repertory);
		return "relist";
	}

}
