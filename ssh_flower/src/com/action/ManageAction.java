package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Manager;
import com.service.ManagerService;

/**
 * 掌柜action
 * 响应掌柜信息的增删改查等功能
 * 已经掌柜登录添加等
 */
@Namespace("/admin")
@Results({
	@Result(name="index",location="/admin/index.jsp"),
	@Result(name="login",location="/admin/login.jsp"),
	@Result(name="list",location="/admin/pages/manager-list.jsp"),
	@Result(name="add",location="/admin/pages/manager-add.jsp"),
	@Result(name="update",location="/admin/pages/manager-update.jsp"),
	@Result(name="relist",type="redirectAction",location="managerList.action"),
})
public class ManageAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private Manager manager;

	@Resource
	private ManagerService managerService;
	
	
	//掌柜登录
	@Action("managerLogin")
	public String login() throws Exception {
		if(managerService.getManager(manager)!=null){//用户核对无误
			this.getSession().put("admin", manager.getUsername());//session中放置用户名, 标志用户已登录
			return "index";
		}else {	//否则
			getRequest().put("msg", "(用户名或密码错误!!)");
			return "login";
		}
	}
	
	//获取掌柜信息列表
	@Action("managerList")
	public String list(){
		List<Manager> managers = managerService.getManagers();
		getRequest().put("managers", managers);
		return "list";
	}
	
	//删除掌柜信息
	@Action("managerDelete")
	public String delete(){
		managerService.delete(manager.getId());
		return "relist";
	}
	
	//更新页面
	@Action("managerUpdatepage")
	public String updatepage(){
		manager = managerService.getManager(manager.getId());
		return "update";
	}
	
	//更新掌柜信息
	@Action("managerUpdate")
	public String update(){
		managerService.update(manager);
		return "relist";
	}
	
	//添加页面
	@Action("managerAddpage")
	public String addpage(){
		return "add";
	}
	
	//添加掌柜信息
	@Action("managerAdd")
	public String add(){
		if (manager.getUsername()==null || manager.getUsername().trim().isEmpty()) {
			getRequest().put("msg", "(用户名不能为空!!)");
			return "add";
		}
		if (managerService.isManager(manager)) {		//判断用户名是否已经存在
			getRequest().put("msg", "(用户名已存在!!)");
			return "add";
		}else {
			managerService.add(manager);
			return "relist";
		}
	}
	
	
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	
}
