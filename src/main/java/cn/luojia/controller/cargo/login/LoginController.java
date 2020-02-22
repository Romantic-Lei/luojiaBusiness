package cn.luojia.controller.cargo.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/login.action")
	public String checkUser(String email, 
			@RequestParam(value="passWord",required=false) String passWord
			,Model model,HttpServletRequest request) {
		if (email.equals("1")) {
			return "/home/fmain.jsp";
			
		}else {
			return "/index.jsp";
		}
	}

}
