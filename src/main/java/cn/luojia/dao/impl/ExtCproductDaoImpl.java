package cn.luojia.dao.impl;


import java.io.Serializable;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.ExtCproductDao;
import cn.luojia.domain.ExtCproduct;

@Repository
public class ExtCproductDaoImpl extends BaseDaoImpl<ExtCproduct> implements ExtCproductDao{
	public ExtCproductDaoImpl() {
		//设置命名空间
		super.setNs("cn.luojia.mapper.ExtCproductMapper");
	}
	
	public void deleteByContractProductById(Serializable[] ids) {
		super.getSqlSession().delete(this.getNs()+".deleteByContractProductById", ids);
	}
	
	public void deleteByContractId(Serializable[] contractIds) {
		super.getSqlSession().delete(this.getNs()+".deleteByContractId", contractIds);
	}

}
