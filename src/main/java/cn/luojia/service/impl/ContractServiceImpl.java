package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.luojia.dao.ContractDao;
import cn.luojia.dao.ContractProductDao;
import cn.luojia.dao.ExtCproductDao;
import cn.luojia.domain.Contract;
import cn.luojia.pagination.Page;
import cn.luojia.service.ContractService;
import cn.luojia.vo.ContractVO;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月9日
 * @Description 合同类业务层
 */
@Service
public class ContractServiceImpl implements ContractService {

	@Autowired
	ContractDao contractDao;
	@Autowired
	ContractProductDao contractProductDao;
	@Autowired
	ExtCproductDao extCproductDao;
	
	@Override
	public List<Contract> findPage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Contract> find(Map paraMap) {
		return contractDao.find(paraMap);
	}

	@Override
	public Contract get(Serializable id) {
		return contractDao.get(id);
	}

	@Override
	public void insert(Contract contract) {
		contract.setId(UUID.randomUUID().toString());
		contract.setState(0); // 0 是草稿， 1是上报, 默认新增购销合同为草稿状态
		contractDao.insert(contract);
	}

	@Override
	public void update(Contract contract) {
		contractDao.update(contract);
	}

	@Override
	public void deleteById(Serializable id) {
		
		Serializable[] ids = {id};
		// 删除合同下的附件信息
		extCproductDao.deleteByContractId(ids);
		// 删除合同下的货物信息
		contractProductDao.deleteByContractId(ids);
		// 删除当前合同
		contractDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// 删除合同下的附件信息
		extCproductDao.deleteByContractId(ids);
		// 删除合同下的货物信息
		contractProductDao.deleteByContractId(ids);
		// 删除当前合同
		contractDao.delete(ids);
	}

	@Override
	public void submit(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 1); // 1 -> 已上报
		map.put("ids", ids);
		contractDao.updateState(map);
	}

	@Override
	public void cancel(Serializable[] ids) {
		Map map = new HashMap();
		map.put("state", 0); // 0 ->  草稿
		map.put("ids", ids);
		contractDao.updateState(map);
	}

	@Override
	public ContractVO view(String contractId) {
		return contractDao.view(contractId);
	}

}
