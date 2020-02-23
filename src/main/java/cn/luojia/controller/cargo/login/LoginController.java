package cn.luojia.controller.cargo.login;

import java.io.IOException;
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
@SessionAttributes(value = {"name","dept","ip"})
public class LoginController {
	
	@Autowired
	UserLoginService userLoginService;
	
	@RequestMapping("/login.action")
	public String checkUser(String email, 
			@RequestParam(value="passWord",required=false) String passWord
			,Model model,HttpServletRequest request) throws IOException {
		
		if(!"".equals(email) && !"".equals(passWord)) {
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
				return "/home/fmain.jsp";
				
			}else {
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
		//	    注销用户，使session失效。
		request.getSession().invalidate();
		sessionStatus.setComplete();
		
		return "/index.jsp";
	}
	
}
