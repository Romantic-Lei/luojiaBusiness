package cn.luojia.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.luojia.dao.UserLoginDao;
import cn.luojia.domain.UserLogin;
import cn.luojia.service.UserLoginService;
import cn.luojia.util.UtilFuns;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	UserLoginDao userLoginDao;
	
	@Override
	public UserLogin find(Map paraMap) {
		List<UserLogin> find = userLoginDao.find(paraMap);
		if (find.size() != 0) {
			return find.get(0);
		}
		return null;
	}

	@Override
	public void insert(UserLogin userLogin) {
		userLogin.setUid(UUID.randomUUID().toString());
		userLoginDao.insert(userLogin);
	}

	@Override
	public void update(UserLogin userLogin) {
		userLoginDao.update(userLogin);
	}

	@Override
	public void delete(Serializable id) {
		userLoginDao.deleteById(id);
	}

	@Override
	public UserLogin getByEmail(String email) {
		return userLoginDao.getByEmail(email);
	}

	@Override
	public void updateByEmail(UserLogin userLogin) {
		userLoginDao.updateByEmail(userLogin);
	}

}
