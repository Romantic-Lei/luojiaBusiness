package cn.luojia.controller.cargo.packinglist;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.domain.PackingList;
import cn.luojia.service.PackingListService;

@Controller
public class PackingListController extends BaseController {
	
	@Resource
	PackingListService packingListService;
	
	@RequestMapping("/cargo/packinglist/list.action")
	public String list(Model model){
		List<PackingList> dataList = packingListService.find(null);
		model.addAttribute("dataList", dataList);
		
		return "/cargo/packinglist/jPackingListList.jsp";
	}
	
	@RequestMapping("/cargo/packinglist/tocreate.action")
	public String tocreate(String[] id, Model model){				//出口报运的id集合
		//携带出口报运的id集合，显示装箱和报运的关系
		String divData = packingListService.getDivData(id);
		model.addAttribute("divData", divData);
		
		return "/cargo/packinglist/jPackingListCreate.jsp";
	}
	
	@RequestMapping("/cargo/packinglist/insert.action")
	public String insert(PackingList packingList){
		packingListService.insert(packingList);
		
		return "redirect:/cargo/packinglist/list.action";
	}
	
}
