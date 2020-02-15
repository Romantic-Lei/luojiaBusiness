package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ExportDao;
import cn.luojia.domain.Export;
import cn.luojia.pagination.Page;
import cn.luojia.service.ExportService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 出口报运类业务层
 */
@Service
public class ExportServiceImpl implements ExportService {

	@Autowired
	ExportDao exportDao;
	
	@Override
	public List<Export> findPage(Page page) {
		return exportDao.findPage(page);
	}
	@Override
	public List<Export> find(Map paraMap) {
		return exportDao.find(paraMap);
	}
	@Override
	public Export get(Serializable id) {
		return exportDao.get(id);
	}
	@Override
	public void insert(Export export) {
		exportDao.insert(export);
	}
	@Override
	public void update(Export export) {
		exportDao.update(export);
	}
	@Override
	public void deleteById(Serializable id) {
		exportDao.deleteById(id);
	}
	@Override
	public void delete(Serializable[] ids) {
		exportDao.delete(ids);
	}
	@Override
	public void submit(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 1);			// 1已上报
		map.put("ids", ids);
		exportDao.updateState(map);
	}
	@Override
	public void cancel(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 0);			// 0 草稿
		map.put("ids", ids);
		exportDao.updateState(map);		
	}
	
}
