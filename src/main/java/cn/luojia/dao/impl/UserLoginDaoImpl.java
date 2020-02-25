package cn.luojia.dao.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public void updateByEmail(UserLogin userLogin) {
		super.getSqlSession().update(super.getNs() + ".updateByEmail", userLogin);
	}

	@Override
	public List<UserLogin> findAll(Map paraMap) {
		return super.getSqlSession().selectList(super.getNs() + ".findAll", paraMap);
	}
}
