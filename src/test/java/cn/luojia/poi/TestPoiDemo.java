package cn.luojia.poi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;

public class TestPoiDemo {

	@Test
	public void HSSF() throws IOException {
		// 1.创建一个工作簿
		Workbook wb = new HSSFWorkbook(); // 只能操作2003以下版本
		// 2.创建一个工作表
		Sheet sheet = wb.createSheet();
		// 3.创建一个行对象
		Row nRow = sheet.createRow(4); // 第五行，坐标从0开始
		// 4.创建一个单元格对象，指定列
		Cell nCell = nRow.createCell(5); // 第六列
		// 5.给单元格赋值
		nCell.setCellValue("珞珈商贸国际物流");
		// 6.保存
		OutputStream os = new FileOutputStream(new File("C:\\Users\\asus\\Desktop\\HSSF.xls"));
		wb.write(os);
		// 7.关闭
		os.close();
	}
	
	// 带格式
	@Test
	public void HSSFStyle() throws IOException {
		Workbook wb = new HSSFWorkbook(); // 只能操作2003以下版本
		Sheet sheet = wb.createSheet();
		Row nRow = sheet.createRow(4); // 第五行，坐标从0开始
		Cell nCell = nRow.createCell(5); // 第六列
		
		CellStyle nStyle = wb.createCellStyle();
		Font nFont = wb.createFont();
		
		nCell.setCellValue("珞珈商贸国际物流");
		nCell.setCellStyle(this.titleStyle(wb, nStyle, nFont));
		
		//样式初始化
		nStyle = wb.createCellStyle();
		nFont = wb.createFont();
		nRow = sheet.createRow(5);
		nCell = nRow.createCell(7);
		nCell.setCellValue("https://www.whu.edu.cn");
		
		nCell.setCellStyle(this.textStyle(wb, nStyle, nFont));
		
		
		// 6.保存
		OutputStream os = new FileOutputStream(new File("C:\\Users\\asus\\Desktop\\HSSF.xls"));
		wb.write(os);
		// 7.关闭
		os.close();
	}
	
	// 标题样式
	public CellStyle titleStyle(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("华文行楷"); 			// 设置字体样式
		nFont.setFontHeightInPoints((short)26);	// 设置字体大小
		nStyle.setFont(nFont);					// 设置字体对象
		
		return nStyle;
	}
	
	// 文字样式
	public CellStyle textStyle(Workbook wb, CellStyle nStyle, Font nFont) {
		nFont.setFontName("宋体"); 				// 设置字体样式
		nFont.setFontHeightInPoints((short)12);	// 设置字体大小
		nStyle.setFont(nFont);					// 设置字体对象
		
		return nStyle;
	}
}
