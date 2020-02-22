package cn.luojia.controller.cargo.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.luojia.domain.UserLogin;
import cn.luojia.service.UserLoginService;

@Controller
@SuppressWarnings(value={"unchecked","rawtypes"})
public class LoginController {
	
	@Autowired
	UserLoginService userLoginService;
	
	@RequestMapping("/login.action")
	public String checkUser(String email, 
			@RequestParam(value="passWord",required=false) String passWord
			,Model model,HttpServletRequest request) {
		
		if(!"".equals(email) && !"".equals(passWord)) {
			Map paraMap = new HashMap();
			paraMap.put("email", email);
			paraMap.put("passWord", passWord);
			UserLogin userLogin = userLoginService.find(paraMap);
			
			if (userLogin != null) {
				return "/home/fmain.jsp";
				
			}else {
				return "/index.jsp";
			}
			
		} else {
			return "/index.jsp";
		}
	}
	
}
