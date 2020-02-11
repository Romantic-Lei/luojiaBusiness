package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ContractProductDao;
import cn.luojia.dao.ExtCproductDao;
import cn.luojia.domain.ContractProduct;
import cn.luojia.pagination.Page;
import cn.luojia.service.ContractProductService;
import cn.luojia.service.ContractService;
import cn.luojia.util.UtilFuns;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月9日
 * @Description 合同类业务层
 */
@Service
public class ContractProductServiceImpl implements ContractProductService {

	@Autowired
	ContractProductDao contractProductDao;
	@Autowired
	ExtCproductDao extCproductDao;
	
	@Override
	public List<ContractProduct> findPage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContractProduct> find(Map paraMap) {
		return contractProductDao.find(paraMap);
	}

	@Override
	public ContractProduct get(Serializable id) {
		return contractProductDao.get(id);
	}

	@Override
	public void insert(ContractProduct contractProduct) {
		contractProduct.setId(UUID.randomUUID().toString());
		// 自动计算总金额  = 数量 * 单价    ...修改，删除，同步合同总金额
		if(UtilFuns.isNotEmpty(contractProduct.getCnumber()) && UtilFuns.isNotEmpty(contractProduct.getPrice())) {
			contractProduct.setAmount(contractProduct.getCnumber() * contractProduct.getPrice());
			
		}
		
		contractProductDao.insert(contractProduct);
	}

	@Override
	public void update(ContractProduct contractProduct) {
		contractProductDao.update(contractProduct);
	}

	@Override
	public void deleteById(Serializable id) {
		// 删除当前 货物下的所有附件
		Serializable[] ids = {id};
		extCproductDao.deleteByContractProductId(ids);
		contractProductDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// 删除当前 货物下的所有附件
		extCproductDao.deleteByContractProductId(ids);
		// 删除当前 id 对应的货物
		contractProductDao.delete(ids);
	}

}
