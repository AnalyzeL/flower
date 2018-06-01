package com.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.FlowerDao;
import com.dao.LogisticsDao;
import com.dao.ManagerDao;
import com.dao.OfflinestoreDao;
import com.dao.RepertoryDao;
import com.entity.Flower;
import com.entity.Logistics;
import com.entity.Manager;
import com.entity.Offlinestore;
import com.entity.Repertory;
import com.entity.RepertoryReally;
import com.service.LogisticsService;

/**
 * 物流service
 */
@Service
@Transactional	//配置此方法加入事务管理
public class RepertoryService{

	@Resource
	private RepertoryDao repertoryDao;
	@Resource
	private OfflinestoreDao offlinestoreDao;
	@Resource
	private FlowerDao flowerDao;
	
	@Resource
	private Logistics logistics;

	
//	//获取物流
//	public Logistics getLogistics(int id) {
//		return logisticsDao.getlogistics(id);
//	}
//	
	

	//获取物流信息列表
	public List<RepertoryReally> getRepertoryReally() {
		List<Repertory> r= repertoryDao.getRepertory();
		List<RepertoryReally> rrs=new ArrayList<RepertoryReally>();
		for(Repertory re:r){
			RepertoryReally rr=new RepertoryReally();
			rr.setId(re.getId());
			rr.setNum(re.getNum());
			int	id=re.getOfflinestoreId();
			Offlinestore o=offlinestoreDao.getOfflinestore(id);
			Flower f=flowerDao.getFlower(re.getFlowerID());
			rr.setFlowerName(f.getName());
			rr.setOfflinestoreName(o.getStoreName());
			rrs.add(rr);
		}
		return rrs;
	}
	//获取物流信息列表
	public List<RepertoryReally> getRepertoryReallyByFlowerID(int flowerid) {
		List<Repertory> r= repertoryDao.getRepertoryByFlowerID(flowerid);
		List<RepertoryReally> rrs=new ArrayList<RepertoryReally>();
		for(Repertory re:r){
			RepertoryReally rr=new RepertoryReally();
			rr.setId(re.getId());
			rr.setNum(re.getNum());
			int	id=re.getOfflinestoreId();
			Offlinestore o=offlinestoreDao.getOfflinestore(id);
			Flower f=flowerDao.getFlower(re.getFlowerID());
			rr.setFlowerName(f.getName());
			rr.setOfflinestoreName(o.getStoreName());
			rrs.add(rr);
		}
		return rrs;
	}

//	//删除物流信息
//	public void delete(int id) {
//		logistics.setId(id);	
//		logisticsDao.delete(logistics);
//	}
//
//	//更新物流信息
//	public void update(Logistics logistics) {
//		logisticsDao.update(logistics);
//	}
//
	//添加物流信息
	public void add(Repertory repertory) {
		repertoryDao.save(repertory);
	}
 	
}
