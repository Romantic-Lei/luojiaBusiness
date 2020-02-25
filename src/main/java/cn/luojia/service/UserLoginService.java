package cn.luojia.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.luojia.domain.UserLogin;

public interface UserLoginService {
	public UserLogin find(Map paraMap);					//查询登录用户
	public UserLogin getByEmail(String email);
	public void insert(UserLogin userLogin);			//插入，用实体作为参数
	public void update(UserLogin userLogin);			//修改，用实体作为参数
	public void deleteById(Serializable id);			//按id删除，删除一条；支持整数型和字符串类型ID
	public void updateByEmail(UserLogin userLogin);		//按id删除，删除一条；支持整数型和字符串类型ID
	public List<UserLogin> findAll(Map paraMap);		//查询出所有用户
}
