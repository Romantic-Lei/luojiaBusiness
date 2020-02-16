package cn.luojia.domain;

import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月16日
 * @Description 装箱单实体
 */
@Data
public class PackingList {
	private String id;
	private String seller;					//卖方
	private String buyer;					//买方
	private String invoiceNo;				//发票号
	private java.util.Date invoiceDate;		//发票日期
	private String marks;					//唛头
	private String descriptions;			//描述
	
	private String exportIds;				//存储报运的id的串(打断设计)
	private String exportNos;				//存储报运号	 (打断设计)
	
	private Integer state;					//状态0草稿 1已上报
	
	private String createBy;
	private String createDept;
	private java.util.Date createTime;
}
