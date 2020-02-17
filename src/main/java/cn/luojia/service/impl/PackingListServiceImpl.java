package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ExportDao;
import cn.luojia.dao.PackingListDao;
import cn.luojia.domain.Export;
import cn.luojia.domain.PackingList;
import cn.luojia.pagination.Page;
import cn.luojia.service.PackingListService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月16日
 * @Description 装箱类业务层
 */
@Service
public class PackingListServiceImpl implements PackingListService {

	@Autowired
	PackingListDao packingListDao;
	@Autowired
	ExportDao exportDao;
	
	@Override
	public List<PackingList> findPage(Page page) {
		return packingListDao.findPage(page);
	}

	@Override
	public List<PackingList> find(Map paraMap) {
		return packingListDao.find(paraMap);
	}

	@Override
	public PackingList get(Serializable id) {
		return packingListDao.get(id);
	}

	@Override
	public void insert(PackingList packingList) {
		packingList.setId(UUID.randomUUID().toString());
		packingList.setState(0); // 0 是草稿， 1是上报, 默认新增装箱合同为草稿状态
		packingListDao.insert(packingList);
	}

	@Override
	public void update(PackingList packingList) {
		packingListDao.update(packingList);
	}

	@Override
	public void deleteById(Serializable id) {
		
		Serializable[] ids = {id};
		// 删除当前装箱信息
		packingListDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// 删除当前装箱信息
		packingListDao.delete(ids);
	}

	@Override
	public void submit(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 1); // 1 -> 已上报
		map.put("ids", ids);
		packingListDao.updateState(map);
	}

	@Override
	public void cancel(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 0); // 0 ->  草稿
		map.put("ids", ids);
		packingListDao.updateState(map);
	}
	
	// 拼接HTML 片段
	public String getDivData(String[] exportIds) {
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < exportIds.length; i++) {
			Export export = exportDao.get(exportIds[i]);
			sb.append("<input type=\"checkbox\" name=\"exportIds\" checked value=\"").append(exportIds[i]).append("\"class=\"input\"/>");
			sb.append(export.getCustomerContract()).append("&nbsp;&nbsp;");
		}
		return sb.toString();
	}
}
