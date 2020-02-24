package cn.luojia.controller.cargo.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.alibaba.fastjson.JSON;

import cn.luojia.domain.UserLogin;
import cn.luojia.service.UserLoginService;
import cn.luojia.util.PinYinUtil;
import net.sf.json.JSONArray;

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
	
	// 装箱员工修改
	@RequestMapping("/sysadmin/user/toupdate.action")
	public String toupdate() {
		
		return "/sysadmin/user/userUpdate.jsp";
	}
	
	// 员工信息修改
	@RequestMapping("/sysadmin/user/update.action")
	public String update(UserLogin userLogin, Model model) {
		userLoginService.update(userLogin);
		
		return "redirect:/sysadmin/user/toupdate.action";
	}
	
	@RequestMapping("/sysadmin/user/updateByEmail.action")
	@ResponseBody
	public String updateByEmail(String email, HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserLogin userLogin = userLoginService.getByEmail(email);
		
//		JSONArray json = JSONArray.fromObject(userLogin);
		System.out.println("JSONArray数据---" + JSON.toJSONString(userLogin) );
		request.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");  
		PrintWriter out = response.getWriter();  //输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码  
		out.print(JSON.toJSONString(userLogin));
		out.flush();
		out.close();
		return null;
	}
	
	@RequestMapping("/sysadmin/user/getByEmail.action")
	@ResponseBody
	public String getByEmail(String email) throws UnsupportedEncodingException {
		UserLogin byEmail = userLoginService.getByEmail(email);
//		UtilFuns.convertNull(byEmail)
		
		return byEmail == null ? null : byEmail.getEmail();
	}
	
	@RequestMapping("/sysadmin/user/getChinese2PinYin.action")
	@ResponseBody
	public String getChinese2PinYin(String name) {
		// 判断是否输入了用户名
		if (name == null || "".equals(name.trim())) {
			return null;
		}
		String fullSpell = PinYinUtil.getFullSpell(name.trim());
		int i = 1;	// 拼接在用户名后面
		UserLogin byEmail = userLoginService.getByEmail(fullSpell + "@luojia.com");
		while(byEmail != null) {
			i++;
			byEmail = userLoginService.getByEmail(fullSpell + i + "@luojia.com");
			if(byEmail == null) {
				// 生成注册用户邮箱
				fullSpell = fullSpell + i;
				break;
			}
		}
		
		return fullSpell + "@luojia.com";
	}
	
	

}
