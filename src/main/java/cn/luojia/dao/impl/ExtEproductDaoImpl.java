package cn.luojia.dao.impl;


import org.springframework.stereotype.Repository;

import cn.luojia.dao.ExtEproductDao;
import cn.luojia.domain.ExtEproduct;

@Repository
public class ExtEproductDaoImpl extends BaseDaoImpl<ExtEproduct> implements ExtEproductDao{
	public ExtEproductDaoImpl() {
		//设置命名空间
		super.setNs("cn.luojia.mapper.ExtEproductMapper");
	}
	
}
