package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ContractProductDao;
import cn.luojia.domain.ContractProduct;
import cn.luojia.pagination.Page;
import cn.luojia.service.ContractProductService;
import cn.luojia.service.ContractService;

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
		contractProduct.setAmount(contractProduct.getCnumber() * contractProduct.getPrice());
		
		contractProductDao.insert(contractProduct);
	}

	@Override
	public void update(ContractProduct contractProduct) {
		contractProductDao.update(contractProduct);
	}

	@Override
	public void deleteById(Serializable id) {
		contractProductDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		contractProductDao.delete(ids);
	}

}
