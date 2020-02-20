package cn.luojia.controller.ws;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.luojia.domain.Export;

@Controller
public class WSExportController {

	@RequestMapping("/ws/export/toedit.action")
	public String toedit() {
		
		return "/ws/export/ajaxExport.jsp";
	}
	
}
