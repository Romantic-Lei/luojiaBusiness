package cn.luojia.dao.impl;

import org.springframework.stereotype.Repository;

import cn.luojia.dao.UserLoginDao;
import cn.luojia.domain.UserLogin;

@Repository
public class UserLoginDaoImpl extends BaseDaoImpl<UserLogin> implements UserLoginDao {
	
	public UserLoginDaoImpl() {
		// 设置命令空间
		super.setNs("cn.luojia.mapper.UserLoginMapper");
	}

	@Override
	public UserLogin getByEmail(String email) {
		return super.getSqlSession().selectOne(super.getNs() + ".getByEmail", email);
	}
}
