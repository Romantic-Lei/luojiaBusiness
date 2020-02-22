package cn.luojia.domain;

import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月22日
 * @Description 用户实体
 */
@Data
public class UserLogin {
	
	private String uid;					// 主键
	private String userName;			// 用户名
	private String passWord;			// 面膜
	private String email;				// 邮箱用于登录
	private String dept;				// 部门

}
