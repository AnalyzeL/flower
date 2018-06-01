package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.FlowerDao;
import com.entity.Category;
import com.entity.Navigation;
import com.entity.Flower;
import com.service.FlowerService;

/**
 * 鲜花service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class FlowerService{

	@Resource 
	private FlowerDao flowerDao;

	//获取类目信息
	public List<Category> getCategorys(){
		return flowerDao.getCategorys();
	}

	//获取首页展示的鲜花信息
	public List<Flower> getHotFlowers(int i) {
		return flowerDao.getHotFlowers(i);
	}

	//获取某类目下的鲜花信息
	public List<Flower> getFlowers(int categoryid) {
		if (categoryid > 0) {
			return flowerDao.getFlowers(categoryid);
		}
		return flowerDao.getFlowers();
	}

	//根据id获取鲜花信息
	public Category getCategory(int id) {
		return flowerDao.getCategory(id);
	}
	//根据id获取鲜花信息
	public Flower getFlower(int flowerid) {
		return flowerDao.getFlower(flowerid);
	}
	
	//根据名称获取鲜花信息
	public Flower getFlower(String name) {
		return flowerDao.getFlower(name);
	}

	//获取鲜花信息列表
	public List<Flower> getFlowers() {
		return flowerDao.getFlowers();
	}
	//随机生成你喜欢的花的种类
	public List<Flower> getLikeFlowers() {
		List<Flower> flowers= flowerDao.getFlowers();
		List<Flower> likeFlowers=new ArrayList<Flower>();
		int size=flowers.size();
		int[] randoms=new int[7];//设定猜你喜欢的花的数量为7
		for(int i=0;i<randoms.length;i++){
			randoms[i]=(int)(Math.random()*(size-2)+1) ;
		}
		for(int i:randoms){
			likeFlowers.add(flowers.get(i));
		}
		
		return likeFlowers;
	}

	//删除鲜花信息
	public void delete(Flower flower) {
		flowerDao.delete(flower);
	}

	//更新鲜花信息
	public void update(Flower flower) {
		flowerDao.update(flower);
	}

	//添加鲜花信息
	public void add(Flower flower) {
		flowerDao.save(flower);
	}
	public List<Navigation> navigation(){
		List<Navigation> navigations=new ArrayList<Navigation>();
		List<Category> categorys=flowerDao.getCategorys();
		for(Category c:categorys){
			Navigation navigation=new Navigation();
			 List<Flower> flowers=flowerDao.getFlowers(c.getId());
			 navigation.setId(c.getId());
			 navigation.setName(c.getName());
			 navigation.setFlowers(flowers);
			 navigations.add(navigation);
		}
		return navigations;
	}
}
