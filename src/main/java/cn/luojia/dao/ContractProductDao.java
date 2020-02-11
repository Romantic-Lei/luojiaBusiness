package cn.luojia.dao;

import java.io.Serializable;

import cn.luojia.domain.ContractProduct;

public interface ContractProductDao extends BaseDao<ContractProduct> {
	public void deleteByContractId(Serializable[] ids);
}
