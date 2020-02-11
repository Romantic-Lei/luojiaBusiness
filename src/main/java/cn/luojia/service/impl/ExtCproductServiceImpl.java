package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ExtCproductDao;
import cn.luojia.dao.SysCodeDao;
import cn.luojia.domain.ExtCproduct;
import cn.luojia.domain.SysCode;
import cn.luojia.pagination.Page;
import cn.luojia.service.ExtCproductService;
import cn.luojia.util.UtilFuns;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月11日
 * @Description
 */
@Service
public class ExtCproductServiceImpl implements ExtCproductService {
	@Autowired
	ExtCproductDao ExtCproductDao;
	@Autowired
	SysCodeDao sysCodeDao;

	public List<ExtCproduct> findPage(Page page) {
		return ExtCproductDao.findPage(page);
	}

	public List<ExtCproduct> find(Map paraMap) {
		return ExtCproductDao.find(paraMap);
	}

	public ExtCproduct get(Serializable id) {
		return ExtCproductDao.get(id);
	}

	public void insert(ExtCproduct extCproduct) {
		extCproduct.setId(UUID.randomUUID().toString());
		//自动计算总金额 = 数据*单价  ...修改，删除，同步合同总金额
		//判断货物数量和单价是否为空
		if(UtilFuns.isNotEmpty(extCproduct.getCnumber()) && UtilFuns.isNotEmpty(extCproduct.getPrice())){
			extCproduct.setAmount(extCproduct.getCnumber()*extCproduct.getPrice());
		}
		
		ExtCproductDao.insert(extCproduct);
	}

	public void update(ExtCproduct extCproduct) {
		ExtCproductDao.update(extCproduct);
	}

	public void deleteById(Serializable id) {
		ExtCproductDao.deleteById(id);
	}

	public void delete(Serializable[] ids) {
		ExtCproductDao.delete(ids);
	}

	@Override
	public List<SysCode> getCtypeList() {
		Map paraMap = new HashMap();
		paraMap.put("parentId", "0104"); // sys_code_b 0104  附件分类  
		return sysCodeDao.find(paraMap);
	}

}
