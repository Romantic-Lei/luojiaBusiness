package cn.luojia.controller.cargo.login;

import java.io.IOException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import cn.luojia.domain.UserLogin;
import cn.luojia.service.UserLoginService;

@Controller
// 只能作用在类上，作用是将指定的Model中的键值对添加至session中
@SessionAttributes(value = { "name", "dept", "ip" })
public class LoginController {

	@Autowired
	UserLoginService userLoginService;

	@RequestMapping("/login.action")
	public String checkUser(String email, @RequestParam(value = "passWord", required = false) String passWord,
			Model model, HttpServletRequest request) throws IOException {

		if (!"".equals(email) && !"".equals(passWord)) {
			// 用户输入了用户名和密码
			Map paraMap = new HashMap();
			paraMap.put("email", email);
			paraMap.put("passWord", passWord);
			UserLogin userLogin = userLoginService.find(paraMap);

			if (userLogin != null) {
				// 效果和 @SessionAttributes(value = {"name","dept","ip"})一致
				// request.getSession().setAttribute("name", userLogin.getUserName());
				// 用户存在
				model.addAttribute("name", userLogin.getUserName());
				model.addAttribute("dept", userLogin.getDepartment());

				// 解析用户ip
				// 只有在通过了 HTTP 代理或者负载均衡服务器时才会添加该项,一般情况下，第一个ip为客户端真实ip，后面的为经过的代理服务器ip
				String ip = request.getHeader("x-forwarded-for");

				// 这个一般是经过apache http服务器的请求才会有，用apache http做代理时一般会加上Proxy-Client-IP请求头，
				if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
					ip = request.getHeader("Proxy-Client-IP");
				}

				// 而WL-Proxy-Client-IP是他的weblogic插件加上的头
				if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
					ip = request.getHeader("WL-Proxy-Client-IP");
				}

				// nginx代理一般会加上此请求头。获取真实的 ip地址
				if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
					ip = request.getHeader("X-Real-IP");
				}
				
				// 获取真实ip
				if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
					ip = request.getRemoteAddr();
					if(ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")){  
						//根据网卡取本机配置的IP 
						InetAddress inet = null;
						inet = InetAddress.getLocalHost();
						ip = inet.getHostAddress();
					}
				}
				
				//对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割  
				if(ip != null && ip.length() > 15) {
					if(ip.indexOf(",") > 0) {
						ip = ip.substring(0, ip.indexOf(","));
					}
				}
				
				model.addAttribute("ip", ip);

				return "/home/fmain.jsp";

			} else {
				// 用户不存在
				return "/index.jsp";
			}

		} else {
			// 用户没有输入密码
			return "/index.jsp";
		}
	}

	// 用户登出清除session
	@RequestMapping("/logout.action")
	public String logout(HttpServletRequest request, SessionStatus sessionStatus) {

		HttpSession session = request.getSession();
		session.removeAttribute("name");
		// 注销用户，使session失效。
		request.getSession().invalidate();
		sessionStatus.setComplete();

		return "/index.jsp";
	}
	
	// 转向员工新增页面
	@RequestMapping("/sysadmin/user/tocreate.action")
	public String tocreate(){
		
		return "/sysadmin/user/userCreate.jsp";
	}
	
	// 员工新增
	@RequestMapping("/sysadmin/user/insert.action")
	public String insert(UserLogin userLogin) {
		userLoginService.insert(userLogin);
		
		return "redirect:/sysadmin/user/tocreate.action";
	}

}
