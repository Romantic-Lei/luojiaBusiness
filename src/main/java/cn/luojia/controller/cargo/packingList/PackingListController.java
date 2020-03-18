package cn.luojia.controller.cargo.packingList;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
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
		String divData = packingListService.getDivDataCreate(id);
		model.addAttribute("divData", divData);
		
		return "/cargo/packinglist/jPackingListCreate.jsp";
	}
	
	@RequestMapping("/cargo/packinglist/insert.action")
	public String insert(PackingList packingList){
		packingListService.insert(packingList);
		
		return "redirect:/cargo/packinglist/list.action";
	}
	
	@RequestMapping("/cargo/packinglist/toupdate.action")
	public String toupdate(String id, Model model) {
		PackingList obj = packingListService.get(id);
		model.addAttribute("obj", obj);
		
		String _s = packingListService.getDivDataUpdate(obj.getExportIds().split("\\|")
				, obj.getExportNos().split("\\|"));
		model.addAttribute("divData", _s);
		
		return "/cargo/packinglist/jPackingListUpdate.jsp";
	}
	
	@RequestMapping("/cargo/packinglist/update.action")
	public String update(PackingList packingList) {
		packingListService.update(packingList);
		
		return "redirect:/cargo/packinglist/list.action";
	}
	
	@RequestMapping("/cargo/packinglist/toview.action")
	public String toview(String id, Model model) {
		PackingList obj = packingListService.get(id);
		model.addAttribute("obj", obj);
		
		model.addAttribute("divData", packingListService.getDivDataView(obj.getExportNos().split("\\|")));
		
		return "/cargo/packinglist/jPackingListView.jsp";
	}
	
	@RequestMapping("/cargo/packinglist/delete.action")
	public String delete(String id) {
		packingListService.deleteById(id);
		
		return "redirect:/cargo/packinglist/list.action";
	}
	
	@RequestMapping("/cargo/packinglist/submit.action")
	public String submit(String[] id) {
		
		packingListService.submit(id);
		return "redirect:/cargo/packinglist/list.action";
	}
	
	@RequestMapping("/cargo/packinglist/cancel.action")
	public String cancel(String[] id) {
		packingListService.cancel(id);
		
		return "redirect:/cargo/packinglist/list.action";
	}
	
	@Override
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
}
