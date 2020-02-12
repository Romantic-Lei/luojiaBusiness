package cn.luojia.controller.cargo.outproduct;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.luojia.controller.BaseController;
import cn.luojia.service.OutProductService;
import cn.luojia.util.DownloadUtil;
import cn.luojia.vo.OutProductVO;

@Controller
public class OutProductController extends BaseController {
	
	@Autowired
	OutProductService outProductService;
	
	// 转向输入年月的页面
	@RequestMapping("/cargo/outproduct/toedit.action")
	public String toedit() {
		return "/cargo/outproduct/jOutProduct.jsp";
	}
	
	@RequestMapping("/cargo/outproduct/printHSSF1.action")
	public void printHSSF1(String inputDate, HttpServletResponse response) throws IOException {
		List<OutProductVO> dataList = outProductService.find(inputDate);
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet();
		Row nRow = null;
		Cell nCell = null;
		
		int rowNo = 0; // 行号
		int colNo = 0; // 列号
		
		// 声明样式对象和字体对象
		CellStyle nStyle = wb.createCellStyle();
		Font nFont = wb.createFont();
		
		sheet.setColumnWidth(0, 2*300);										// 列宽
		sheet.setColumnWidth(1, 26*300);									// 列宽
		sheet.setColumnWidth(2, 12*300);									// 列宽
		sheet.setColumnWidth(3, 29*300);									// 列宽
		sheet.setColumnWidth(4, 10*300);									// 列宽
		sheet.setColumnWidth(5, 12*300);									// 列宽
		sheet.setColumnWidth(6, 8*300);										// 列宽
		sheet.setColumnWidth(7, 10*300);									// 列宽
		sheet.setColumnWidth(8, 10*300);									// 列宽
		sheet.setColumnWidth(9, 8*300);										// 列宽
		
		
		// 大标题，合并单元格
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 9));			// 开始行，结束行号，开始列，结束列
		// 合并单元格的内容
		nRow = sheet.createRow(rowNo++);
		nRow.setHeightInPoints(36);											// 行高
		
		nCell = nRow.createCell(1);
		nCell.setCellValue(inputDate.replaceFirst("-0", "-").replaceFirst("-", "年") + "月份出货表");
		nCell.setCellStyle(this.bigTitle(wb, nStyle, nFont));
		
		String[] title = new String[] {"客户","订单号","货号","数量","工厂","附件","工厂交期","船期","贸易条款"};
		
		nRow = sheet.createRow(rowNo++);
		nRow.setHeightInPoints(26.25f);							// 设置行高
		
		// 初始化
		nStyle = wb.createCellStyle();
		nFont = wb.createFont();
		
		// 设置标题行
		for(int i = 0; i < title.length; i++) {
			nCell = nRow.createCell(i+1);
			nCell.setCellValue(title[i]);
			nCell.setCellStyle(this.title(wb, nStyle, nFont));
		}
		
		// 初始化
		nStyle = wb.createCellStyle();
		nFont = wb.createFont();
		
		// 处理数据
		for (int j = 0; j < dataList.size(); j++) {
			colNo = 1;
			OutProductVO op = dataList.get(j);
			
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24f);							// 设置行高
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCustomName()); 
			nCell.setCellStyle(this.text(wb, nStyle, nFont));		// 设置字体样式
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getContractNo());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getProductNo());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCnumber());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getFactoryName());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getExts());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getDeliveryPeriod());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getShipTime());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getTradeTerms());
			nCell.setCellStyle(this.text(wb, nStyle, nFont));
			
		}
		
//		OutputStream os = new FileOutputStream(new File("C:\\Users\\asus\\Desktop\\outproduct.xls"));
		
//		wb.write(os);
//		os.flush();
//		os.close();
		
		// 下载
		DownloadUtil du = new DownloadUtil();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		wb.write(os);
		du.download(os, response, "出货表.xls");
		
	}
	
	// 模板开发
	@RequestMapping("/cargo/outproduct/printHSSF.action")
	public void printHSSF(String inputDate,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//linux下jdk1.8 方法获取时，不会拼接自己写的目录 
		String path = request.getSession().getServletContext().getRealPath("/") + "/make/xlsprint/";	//就算有多的/，Tomcat也会将他去掉
		InputStream is = new FileInputStream(new File(path + "tOUTPRODUCT.xls"));
		
		Workbook wb = new HSSFWorkbook(is);
		Sheet sheet = wb.getSheetAt(0); // 获取文件里面的第一个sheet；
		
		Row nRow = null;
		Cell nCell = null;
		int rowNo = 0; // 行号
		int colNo = 1; // 列号
		
		// 获取模板上的单元格样式
		nRow = sheet.getRow(2);
		
		// 客户的样式
		nCell = nRow.getCell(1);
		CellStyle customStyle = nCell.getCellStyle();
		
		// 订单号的样式
		nCell = nRow.getCell(2);
		CellStyle contractNoStyle = nCell.getCellStyle();
		
		// 货号的样式
		nCell = nRow.getCell(3);
		CellStyle productNoStyle = nCell.getCellStyle();
		
		// 数量的样式
		nCell = nRow.getCell(4);
		CellStyle numStyle = nCell.getCellStyle();
		
		// 生产厂家的样式
		nCell = nRow.getCell(5);
		CellStyle factoryStyle = nCell.getCellStyle();
		
		// 日期的样式
		nCell = nRow.getCell(5);
		CellStyle dateStyle = nCell.getCellStyle();
		
		// 贸易条款的样式
		nCell = nRow.getCell(5);
		CellStyle tradeStyle = nCell.getCellStyle();
		
		// 声明样式对象和字体对象
		CellStyle nStyle = wb.createCellStyle();
		Font nFont = wb.createFont();
		
		// 处理大标题
		nRow = sheet.getRow(rowNo++);				// 获取一个行对象
		nCell = nRow.getCell(colNo);				// 获取一个单元格对象
		nCell.setCellValue(inputDate.replaceFirst("-0", "-").replaceFirst("-", "年") + "月份出货表");
		
		rowNo++;									// 跳过静态表格头
		List<OutProductVO> dataList = outProductService.find(inputDate);
		
		// 处理数据
		for (int j = 0; j < dataList.size(); j++) {
			colNo = 1;
			OutProductVO op = dataList.get(j);
			
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24);							// 设置行高
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCustomName()); 
			nCell.setCellStyle(customStyle);		// 设置字体样式
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getContractNo());
			nCell.setCellStyle(contractNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getProductNo());
			nCell.setCellStyle(productNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCnumber());
			nCell.setCellStyle(contractNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getFactoryName());
			nCell.setCellStyle(factoryStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getDeliveryPeriod());
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getShipTime());
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getTradeTerms());
			nCell.setCellStyle(tradeStyle);
			
		}
		
//		OutputStream os = new FileOutputStream(new File("C:\\Users\\asus\\Desktop\\outproduct.xls"));
		
//		wb.write(os);
//		os.flush();
//		os.close();
		
		// 下载
		DownloadUtil du = new DownloadUtil();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		wb.write(os);
		du.download(os, response, "出货表.xls");				//直接弹出下载框，用户可以打开，可以保存
		
		os.flush();
		os.close();
	}
	
	// 大标题样式
	public CellStyle bigTitle(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("宋体");
		nFont.setFontHeightInPoints((short)16);
		nFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);			// 字体加粗
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);			// 横向居中
		nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);	// 纵向居中
		
		nStyle.setFont(nFont);
		
		return nStyle;
	}
	
	// 模板开发 XSSF
	@RequestMapping("/cargo/outproduct/print.action")
	public void print(String inputDate,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//linux下jdk1.8 方法获取时，不会拼接自己写的目录 
		String path = request.getSession().getServletContext().getRealPath("/") + "/make/xlsprint/";	//就算有多的/，Tomcat也会将他去掉
		InputStream is = new FileInputStream(new File(path + "tOUTPRODUCT.xlsx"));
		
		Workbook wb = new XSSFWorkbook(is);
		Sheet sheet = wb.getSheetAt(0); // 获取文件里面的第一个sheet；
		
		Row nRow = null;
		Cell nCell = null;
		int rowNo = 0; // 行号
		int colNo = 1; // 列号
		
		// 获取模板上的单元格样式
		nRow = sheet.getRow(2);
		
		// 客户的样式
		nCell = nRow.getCell(1);
		CellStyle customStyle = nCell.getCellStyle();
		
		// 订单号的样式
		nCell = nRow.getCell(2);
		CellStyle contractNoStyle = nCell.getCellStyle();
		
		// 货号的样式
		nCell = nRow.getCell(3);
		CellStyle productNoStyle = nCell.getCellStyle();
		
		// 数量的样式
		nCell = nRow.getCell(4);
		CellStyle numStyle = nCell.getCellStyle();
		
		// 生产厂家的样式
		nCell = nRow.getCell(5);
		CellStyle factoryStyle = nCell.getCellStyle();
		
		// 日期的样式
		nCell = nRow.getCell(5);
		CellStyle dateStyle = nCell.getCellStyle();
		
		// 贸易条款的样式
		nCell = nRow.getCell(5);
		CellStyle tradeStyle = nCell.getCellStyle();
		
		// 声明样式对象和字体对象
		CellStyle nStyle = wb.createCellStyle();
		Font nFont = wb.createFont();
		
		// 处理大标题
		nRow = sheet.getRow(rowNo++);				// 获取一个行对象
		nCell = nRow.getCell(colNo);				// 获取一个单元格对象
		nCell.setCellValue(inputDate.replaceFirst("-0", "-").replaceFirst("-", "年") + "月份出货表");
		
		rowNo++;									// 跳过静态表格头
		List<OutProductVO> dataList = outProductService.find(inputDate);
		
		// 处理数据
		for (int j = 0; j < dataList.size(); j++) {
			colNo = 1;
			OutProductVO op = dataList.get(j);
			
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24);							// 设置行高
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCustomName()); 
			nCell.setCellStyle(customStyle);		// 设置字体样式
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getContractNo());
			nCell.setCellStyle(contractNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getProductNo());
			nCell.setCellStyle(productNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCnumber());
			nCell.setCellStyle(contractNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getFactoryName());
			nCell.setCellStyle(factoryStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getDeliveryPeriod());
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getShipTime());
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getTradeTerms());
			nCell.setCellStyle(tradeStyle);
			
		}
		
//		OutputStream os = new FileOutputStream(new File("C:\\Users\\asus\\Desktop\\outproduct.xls"));
		
//		wb.write(os);
//		os.flush();
//		os.close();
		
		// 下载
		DownloadUtil du = new DownloadUtil();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		wb.write(os);
		du.download(os, response, "出货表.xls");				//直接弹出下载框，用户可以打开，可以保存
		
		os.flush();
		os.close();
	}
	
	// 大标题样式
	public CellStyle bigTitle(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("宋体");
		nFont.setFontHeightInPoints((short)16);
		nFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);			// 字体加粗
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);			// 横向居中
		nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);	// 纵向居中
		
		nStyle.setFont(nFont);
		
		return nStyle;
	}
	
	// 标题样式
	public CellStyle title(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("黑体");
		nFont.setFontHeightInPoints((short)12);
		
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);			// 横向居中
		nStyle.setVerticalAlignment(CellStyle.ALIGN_CENTER);	// 纵向居中
		
		// 表格线
		// nStyle.setBorderTop(CellStyle.BORDER_THICK);			// 上粗线
		nStyle.setBorderTop(CellStyle.BORDER_THIN);				// 上粗线
		nStyle.setBorderBottom(CellStyle.BORDER_THIN);			// 下细线
		nStyle.setBorderLeft(CellStyle.BORDER_THIN);			// 左细线
		nStyle.setBorderRight(CellStyle.BORDER_THIN);			// 右细线
		
		nStyle.setFont(nFont);
		
		return nStyle;
	}
	
	// 文字样式
	public CellStyle text(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("Times New Roman");
		nFont.setFontHeightInPoints((short)10);
		
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);			// 横向居中
		nStyle.setVerticalAlignment(CellStyle.ALIGN_CENTER);	// 纵向居中
		
		// 表格线
		nStyle.setBorderTop(CellStyle.BORDER_THIN);				// 上细线
		nStyle.setBorderBottom(CellStyle.BORDER_THIN);			// 下细线
		nStyle.setBorderLeft(CellStyle.BORDER_THIN);			// 左细线
		nStyle.setBorderRight(CellStyle.BORDER_THIN);			// 右细线
		
		nStyle.setFont(nFont);
		
		return nStyle;
	}

}
