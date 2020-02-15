package cn.luojia.controller.cargo.export;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Export;
import cn.luojia.service.ExportService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月15日
 * @Description 出口报运控制层
 */
@Controller
public class ExportController extends BaseController {
	@Autowired
	ExportService exportService;
	
	@RequestMapping("cargo/export/list.action")
	public String list(Model model) {
		List<Export> dataList = exportService.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/export/jExportList.jsp";
	}

}
