package com.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Category;
import com.entity.Flower;
import com.service.FlowerService;
import com.util.UploadUtil;


/**
 * 鲜花管理action
 * 负责掌柜对鲜花的增删改查等操作
 * 另使用fileupload实现图片上传功能
 * path变量为上传路径
 */
@Namespace("/admin")
@Results({
	@Result(name="intro",location="/index/intro.jsp"),
	@Result(name="addpage",location="/admin/pages/flower-add.jsp"),
	@Result(name="flowerlist",location="/admin/pages/flower-list.jsp"),
	@Result(name="reflowerlist",type="redirectAction",location="flowerList.action"),
	@Result(name="floweradd",location="/admin/pages/flower-add.jsp"),
	@Result(name="updatePage",location="/admin/pages/flower-update.jsp"),
})
public class FlowerAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private int categoryid;
	private Flower flower;
	private List<Category> categories;	// 类目列表
	
	private File photo;		//获取上传文件
    private String photoFileName;	//获取上传文件名称
    private String photoContentType;		//获取上传文件类型
    @Resource
    private FlowerService flowerService;
    
	//获取鲜花信息列表
    @Action("flowerList")
	public String flowerList(){
    	
		List<Flower> flowers = flowerService.getFlowers();
		List<Category> categories = flowerService.getCategorys();
		getRequest().put("categories", categories);
		getRequest().put("flowers", flowers);
		return "flowerlist";
	}
	
	//获取鲜花信息列表
    @Action("flowerByCategory")
	public String findByCategory(){
		List<Flower> flowers = flowerService.getFlowers(categoryid);
		List<Category> categories = flowerService.getCategorys();
		getRequest().put("categories", categories);
		getRequest().put("flowers", flowers);
		return "flowerlist";
	}
	
	//删除鲜花信息
    @Action("flowerDelete")
	public String delete(){
		flowerService.delete(flower);
		return "reflowerlist";
	}
	
	//修改页面
    @Action("flowerUpdatepage")
	public String updatepage() {
		categories = flowerService.getCategorys();		// 获取所有类目信息
		flower = flowerService.getFlower(flower.getId());
		return "updatePage";
	}
	
	//更新鲜花信息
    @Action("flowerUpdate")
	public String update(){
		if (photo != null) {//上传图片
			flower.setPhoto(UploadUtil.fileUpload(photo, photoFileName, "upload"));
		}
		flowerService.update(flower);
		return "reflowerlist";
	}
	
	//添加鲜花
    @Action("flowerAddpage")
	public String addpage(){
		categories = flowerService.getCategorys();		// 获取所有类目信息
		return "addpage";
	}
	
	//添加鲜花信息
    @Action("flowerAdd")
	public String add(){
		if (photo != null) {//上传图片
			flower.setPhoto(UploadUtil.fileUpload(photo, photoFileName, "upload"));
		}
		flowerService.add(flower);
		return "reflowerlist";
	}
	
	
	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	
}
