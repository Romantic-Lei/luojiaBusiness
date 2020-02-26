package cn.luojia.domain;

import java.util.Date;

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
	private String passWord;			// 密码
	private String email;				// 邮箱用于登录
	private String department;			// 部门
	private Date createTime;        	// 创建时间
	private String seniority;			// 工龄
	private Date birthday;        		// 员工生日
	private String nextBirthday;		// 距离下次生日天数

}
