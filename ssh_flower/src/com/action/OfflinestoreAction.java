package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Logistics;
import com.entity.Manager;
import com.entity.Offlinestore;
import com.entity.Orders;
import com.service.LogisticsService;
import com.service.ManagerService;
import com.service.OfflinestoreService;
import com.service.OrderService;

/**
 * 线下商店action
 * 响应线下商店信息的增删改查等功能
 */
@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/pages/offlinestore-list.jsp"),
	@Result(name="add",location="/admin/pages/offlinestore-add.jsp"),
	@Result(name="update",location="/admin/pages/offlinestore-update.jsp"),
	@Result(name="relist",type="redirectAction",location="offlinestoreList.action"),
})
public class OfflinestoreAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private Offlinestore offlinestore;

	@Resource
	private OfflinestoreService offlinestoreService;

	
	//获取物流信息列表
	@Action("offlinestoreList")
	public String list(){
		List<Offlinestore> offlinestores = offlinestoreService.getOfflinestores();
		getRequest().put("offlinestores", offlinestores);
		return "list";
	}
	
	
	//删除物流信息
	@Action("offlinestoreDelete")
	public String delete(){
		offlinestoreService.delete(offlinestore.getId());
		return "relist";
	}
	
	//更新页面
	@Action("offlinestoreUpdatepage")
	public String updatepage(){
		offlinestore = offlinestoreService.getOfflinestore(offlinestore.getId());
		return "update";
	}
	
	//更新物流信息
	@Action("offlinestoreUpdate")
	public String update(){
		offlinestoreService.update(offlinestore);
		return "relist";
	}
	
	//添加页面
	@Action("offlinestoreAddpage")
	public String addpage(){
		return "add";
	}
	
	//添加物流信息
	@Action("offlinestoreAdd")
	public String add(){
		offlinestoreService.add(offlinestore);
		return "relist";
		
	}


	public Offlinestore getOfflinestore() {
		return offlinestore;
	}


	public void setOfflinestore(Offlinestore offlinestore) {
		this.offlinestore = offlinestore;
	}

	
}
