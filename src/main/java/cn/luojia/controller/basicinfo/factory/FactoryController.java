package cn.luojia.controller.basicinfo.factory;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.Factory;
import cn.luojia.service.FactoryService;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月7日
 * @Description
 */
@Controller
public class FactoryController extends BaseController {

	@Autowired
	FactoryService factoryService;
	
	// 列表
	@RequestMapping("/basicinfo/factory/list.action")
	public String list(Model model) {
		List<Factory> dataList = factoryService.find(null);
		model.addAttribute("dataList", dataList); // 将数据传递到页面
		return "/basicinfo/factory/jFactoryList.jsp"; // 转向页面
	}
	
	// 转向新增页面
	@RequestMapping("/basicinfo/factory/tocreate.action")
	public String tocreate() {
		return "/basicinfo/factory/jFactoryCreate.jsp";
	}
	
	// 新增保存
	@RequestMapping("/basicinfo/factory/insert.action")
	public String insert(Factory factory) {
		// 设置UUID
		factory.setId(UUID.randomUUID().toString());
		factoryService.insert(factory);
		return "redirect:/basicinfo/factory/list.action"; // 重定向到显示列表的.action
	}
}
