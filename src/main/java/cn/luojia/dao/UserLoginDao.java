package cn.luojia.dao;

import java.util.List;
import java.util.Map;

import cn.luojia.domain.UserLogin;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月22日
 * @Description 用户登陆持久层
 */
public interface UserLoginDao extends BaseDao<UserLogin> {
	public UserLogin getByEmail(String email);
	public void updateByEmail(UserLogin userLogin);
	public List<UserLogin> findAll(Map paraMap);
}
