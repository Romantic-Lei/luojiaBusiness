package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ContractProductDao;
import cn.luojia.domain.ContractProduct;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月10日
 * @Description 合同下货物持久层
 */
@Repository
public class ContractProductDaoImpl extends BaseDaoImpl<ContractProduct> implements ContractProductDao {

	public ContractProductDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.ContractProductMapper");
	}

}
