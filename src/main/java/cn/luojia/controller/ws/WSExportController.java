package cn.luojia.controller.ws;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WSExportController {

	@RequestMapping("/ws/export/toedit.action")
	public String toedit() {
		
		return "/ws/export/ajaxExport.jsp";
	}
	
}
