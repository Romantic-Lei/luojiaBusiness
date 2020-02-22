package cn.luojia.controller.stat.chart;

import java.io.FileNotFoundException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.common.springdao.SqlDao;
import cn.luojia.util.UtilFuns;
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
		String path = request.getSession().getServletContext().getRealPath("/");	//真实路径
		String dir = "factorysale";
		
		String sql = "SELECT f.factory_name,cp.countnum FROM (SELECT factory_id,factory_name FROM factory_c) f RIGHT JOIN (SELECT factory_id,COUNT(*) AS countnum FROM contract_product_c GROUP BY factory_id ) cp ON f.factory_id=cp.factory_id";
		this.writeXml(path, dir, this.getPieXml(this.getData(sql)));
		
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
	
	// 系统访问压力图
	@RequestMapping("/stat/chart/onlineInfo.action")
	public String onlineInfo(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		String dir = "onlineinfo";
		
		String sql = "SELECT t.a1,p.countnum FROM ((SELECT a1 FROM online_t) ORDER BY a1) t LEFT JOIN (select a1,count(*) as countnum from(select SUBSTR(to_char(login_time,'yyyy-mm-dd hh24:mi:ss'),12,2) as a1 from login_log_p) group by a1) p ON t.a1=p.a1";
		this.writeXml(path, dir, this.LineXml(this.getData(sql)));
		
		return "/stat/chart/jStat.jsp?forward="+dir;
	}
	
	// 拼接成json串
	// 生产厂家销售饼形图
	@RequestMapping("/stat/chart/factorySaleJson.action")
	public String factorySaleJson(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到厂家名称和厂家对应的销售货物的数量
		String sql = "SELECT f.factory_name,cp.countnum FROM (SELECT factory_id,factory_name FROM factory_c) f RIGHT JOIN (SELECT factory_id,COUNT(*) AS countnum FROM contract_product_c GROUP BY factory_id ) cp ON f.factory_id=cp.factory_id";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		String dir = "factorysalejson";
		
		this.writeJson(path, dir, this.getPieJson(dataList));
		
		return "/stat/chart/jStat.jsp?forward="+dir;
	}
	
	// 产品销售柱状图
	@RequestMapping("/stat/chart/productSaleJson.action")
	public String productSaleJson(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到货物金额排行
		String sql = "select t.product_no,rownum, t.sumnum from (select product_no,sum(cnumber) as sumnum from contract_product_c group by product_no order by sum(cnumber)  desc) t where rownum<=16";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		String dir = "productSalejson";
		this.writeJson(path, dir, this.getColumnJson(dataList));
		
		return "/stat/chart/jStat.jsp?forward="+dir;
	}
	
	// 系统访问压力图
	@RequestMapping("/stat/chart/onlineInfoJson.action")
	public String onlineInfoJson(HttpServletRequest request) throws FileNotFoundException {
		String path = request.getSession().getServletContext().getRealPath("/");		// 真实路径
		
		// 组织数据源,查询到货物金额排行
		String sql = "SELECT t.a1,p.countnum FROM ((SELECT a1 FROM online_t) ORDER BY a1) t LEFT JOIN (select a1,count(*) as countnum from(select SUBSTR(to_char(login_time,'yyyy-mm-dd hh24:mi:ss'),12,2) as a1 from login_log_p) group by a1) p ON t.a1=p.a1";
		// 查询到的list集合是一个生产厂家名和销售数量交替存放的
		List<String> dataList = sqlDao.executeSQL(sql);
		String dir = "onlineinfojson";
		this.writeJson(path, dir, this.getLineJson(dataList));
		
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
	
	//获取折线图
	public String LineXml(List<String> dataList){
		StringBuffer sBuf = new StringBuffer();
		sBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sBuf.append("<chart>");
		sBuf.append("<series>");
		
		int xid = 0;			//对应标识
		for(int i=0;i<dataList.size();){
			sBuf.append("<value xid=\"").append(xid++).append("\">").append(dataList.get(i++)).append("</value>");
			i++;		//key
		}
		sBuf.append("</series>");
		sBuf.append("<graphs>");
		sBuf.append("<graph gid=\"30\" color=\"#FFCC00\" gradient_fill_colors=\"#111111, #1A897C\">");
		
		xid = 0;
		for(int i=0;i<dataList.size();){
			i++;		//skip
			if(dataList.get(i) == null || dataList.get(i).trim() == ""){
				sBuf.append("<value xid=\"").append(xid++).append("\">").append("0").append("</value>");
				i++;
			}else{
				sBuf.append("<value xid=\"").append(xid++).append("\">").append(dataList.get(i++)).append("</value>");
			}
		}
		
		sBuf.append("</graph>");
		sBuf.append("</graphs>");
		sBuf.append("</chart>");
		
		return sBuf.toString();
	}
	
	// 拼接饼形图的json
	public String getPieJson(List<String> dataList) {
		// 拼接数据到一个xml 字符串
		StringBuffer sb = new StringBuffer();
		sb.append("am4core.useTheme(am4themes_animated);");
		sb.append("var chart = am4core.createFromConfig({  data: [");
		for (int i=0;i<dataList.size();) {
			sb.append("{\"factory\":\"").append(dataList.get(i++)).append("\", \"countnum\":").append(dataList.get(i++)).append("},");
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("],\"series\": [{\"type\": \"PieSeries\",\"dataFields\": { \"value\": \"countnum\",\"category\": \"factory\"},\"hiddenState\": {\"properties\": {\"opacity\": 1,\"endAngle\": -90,\"startAngle\": -90}}}],\"legend\": {}}, \"chartdiv\", \"PieChart\");");
		
		return sb.toString();
	}
	
	// 拼接饼形图的json
	public String getColumnJson(List<String> dataList) {
		// 拼接数据到一个json 字符串
		StringBuffer sb = new StringBuffer();
		sb.append("am4core.useTheme(am4themes_animated);");
		sb.append("var chart = am4core.createFromConfig({\"colors\": {\"saturation\": 0.4}, \"data\": [");
		int xid = 3;
		for (int i=3;i<dataList.size();) {
			i++;
			i++;
			sb.append("{\"product\":\"").append(dataList.get(xid++)).append("\", \"sumnum\":").append(dataList.get(i++)).append("},");
			xid++;
			xid++;
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("], \"yAxes\": [{\"type\": \"ValueAxis\", \"renderer\": {\"maxLabelPosition\": 0.98}}],\"xAxes\": [{\"type\": \"CategoryAxis\",\"renderer\": {\"minGridDistance\": 20,\"grid\": {\"location\": 0}},\"dataFields\": {\"category\": \"product\"}  }],  \"series\": [{\"type\": \"ColumnSeries\",\"dataFields\": {\"categoryX\": \"product\",\"valueY\": \"sumnum\" },\"defaultState\": {\"transitionDuration\": 1000},\"sequencedInterpolation\": true,\"sequencedInterpolationDelay\": 100,\"columns\": {\"strokeOpacity\": 0,\"adapter\": {\"fill\": function (fill, target) {return chart.colors.getIndex(target.dataItem.index);}}}}],\"cursor\": {\"type\": \"XYCursor\", \"behavior\": \"zoomX\"}}, \"chartdiv\", \"XYChart\");");
		return sb.toString();
	}
	
	public String getLineJson(List<String> dataList) {
		// 拼接数据到一个json 字符串
		StringBuffer sb = new StringBuffer();
		sb.append("am4core.useTheme(am4themes_animated);");
		Calendar now = Calendar.getInstance();  
	    String year = now.get(Calendar.YEAR) + "";  
	    String month = now.get(Calendar.MONTH) + 1 + "";  
	    String day =  now.get(Calendar.DAY_OF_MONTH) + "";  
		sb.append("am4core.useTheme(am4themes_animated);var data = [];");
		int time = 0;
		int visits = 0;
		for (int i=0;i<dataList.size();) {
			time = UtilFuns.ConvertZero(dataList.get(i++));
			visits = UtilFuns.ConvertZero(dataList.get(i++));
			
			sb.append("data.push({time: new Date(").append(year + "," + month + "," + day + ",").append(time).append("), name:\"name\" + 1,value: ").append(visits).append("});");
		}
			sb.append("var chart = am4core.createFromConfig({\"paddingRight\": 20,\"data\": data,\"xAxes\": [{\"type\": \"DateAxis\",\"renderer\": {\"grid\": {\"location\": 0}}}],\"yAxes\": [{\"type\": \"ValueAxis\",\"tooltip\": {\"disabled\": true},\"renderer\": {\"minWidth\": 35}}],\"series\": [{\"id\": \"s1\",\"type\": \"LineSeries\",\"dataFields\": {\"dateX\": \"time\",\"valueY\": \"value\"}, \"tooltipText\": \"{valueY.value}\"}],\"cursor\": {\"type\": \"XYCursor\"},\"scrollbarX\": { \"type\": \"XYChartScrollbar\",\"series\": [\"s1\"]}}, \"chartdiv\", \"XYChart\");");

		
		return sb.toString();
	}
	
	// 写xml文本文件,格式 utf-8
	public void writeXml(String path, String dir, String content) throws FileNotFoundException{
		//输出文件，如果目录下没有文件，直接创建；如果目录下文件存在，则覆盖。
		FileUtil fu = new FileUtil();
		fu.createTxt(path + "/stat/chart/" + dir, "data.xml", content, "utf-8");
	}
	
	// 写json文本文件,格式 utf-8
	public void writeJson(String path, String dir, String content) throws FileNotFoundException {
		// 输出文件,如果目录下没有文件，则直接创建，否则覆盖
		FileUtil fu = new FileUtil();
		fu.createTxt(path + "/stat/chart/" + dir, "index.js", content, "utf-8");
	}

}
