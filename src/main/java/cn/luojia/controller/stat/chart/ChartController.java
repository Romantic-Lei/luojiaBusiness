package cn.luojia.controller.stat.chart;

import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.common.springdao.SqlDao;
import cn.luojia.util.file.FileUtil;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月18日
 * @Description 统计报表控制层
 */
@Controller
public class ChartController {
	
	@Autowired
	SqlDao sqlDao;
	
	// 生产厂家销售饼形图
	/*
	 * 开发步骤
	 * 1. 组织数据源
	 * 2. 拼接成xml
	 * 3. 创建一个文件 txt格式，xml工具类
	 * 4. 转向对应目录下的 index.html
	 */
	
	@RequestMapping("/stat/chart/factorySale.action")
	public String factorySale(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到厂家名称和厂家对应的销售货物的数量
		String sql = "SELECT f.factory_name,cp.countnum FROM (SELECT factory_id,factory_name FROM factory_c) f RIGHT JOIN (SELECT factory_id,COUNT(*) AS countnum FROM contract_product_c GROUP BY factory_id ) cp ON f.factory_id=cp.factory_id";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		String dir = "factorysale";
		
		this.writeXml(path, dir, this.getPieXml(dataList));
		
		return "/stat/chart/jStat.jsp?forward="+dir;
	}
	
	// 产品销售柱状图
	@RequestMapping("/stat/chart/productSale.action")
	public String productSale(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到货物金额排行
		String sql = "select t.product_no,rownum, t.sumnum from (select product_no,sum(cnumber) as sumnum from contract_product_c group by product_no order by sum(cnumber)  desc) t where rownum<=15";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		String dir = "productsale";
		this.writeXml(path, dir, this.getColumnXml(dataList));
		
		return "/stat/chart/jStat.jsp?forward="+dir;
	}
	
	// 获取数据
	public List<String> getData(String sql){
		return sqlDao.executeSQL(sql);
	}
	
	// 拼接饼形图的xml
	public String getPieXml(List<String> dataList) {
		// 拼接数据到一个xml 字符串
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<pie>");
		for(int i=0;i<dataList.size();){
			//在for循环内部控制当前记录标识
			sb.append("  <slice title=\"").append(dataList.get(i++)).append("\">").append(dataList.get(i++)).append("</slice>");
		}
		sb.append("</pie>");
		
		return sb.toString();
	}
	
	// 
	public String getColumnXml(List<String> dataList) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<chart>");
		sb.append("<series>");
		
		int xid = 0;			//对应标识
		for(int i=0;i<dataList.size();){
			sb.append("<value xid=\"").append(xid++).append("\">").append(dataList.get(i++)).append("</value>");
			i++;		//skip
			i++;
		}
		sb.append("</series>");
		sb.append("<graphs>");
		sb.append("<graph gid=\"30\" color=\"#FFCC00\" gradient_fill_colors=\"#FF00FF, #CD7F32\">");	//gradient_fill_colors=\"#FFC0CB, #1A897C  该柱状图颜色的属性,此处两种颜色拼接
		
		xid = 0;
		for(int i=0;i<dataList.size();){
			i++;		//skip
			i++;
			sb.append("<value xid=\"").append(xid++).append("\">").append(dataList.get(i++)).append("</value>");
		}
		
		sb.append("</graph>");
		sb.append("</graphs>");
		sb.append("</chart>");
		return sb.toString();
	}
	
	// 写xml文本文件,格式 utf-8
	public void writeXml(String path, String dir, String content) throws FileNotFoundException {
		// 输出文件,如果目录下没有文件，则直接创建，否则覆盖
		FileUtil fu = new FileUtil();
		fu.createTxt(path + "/stat/chart/" + dir, "data.xml", content.toString(), "utf-8");
	}

}
