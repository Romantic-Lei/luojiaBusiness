package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.SysCodeDao;
import cn.luojia.domain.SysCode;

@Repository
public class SysCodeDaoImpl extends BaseDaoImpl<SysCode> implements SysCodeDao{
	public SysCodeDaoImpl() {
		//设置命名空间
		super.setNs("cn.luojia.mapper.SysCodeMapper");
	}
}
