package cn.luojia.domain;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月14日
 * @Description 货物报运
 */
@Data
public class Export {
	private String id;
	private Date inputDate;
	
	private String epnum;				//报运货物数
	private String extnum;				//报运附件数
	
	private String contractIds;			//打断设计，合同的ID集合
	private String customerContract;	//合同或确认书号
	private String lcno;				//信用证号
	private String consignee;			//收货人及地址
	private String marks;				//唛头
	private String remark;				//说明
	private String shipmentPort;		//装运港
	private String destinationPort;		//目的港
	private String transportMode;		//运输方式
	private String priceCondition;		//价格条件
	private Integer state;				//0-草稿 1-已上报 2-装箱 3-委托 4-发票 5-财务
	private Double grossWeight;			//毛重	
	private Double netWeight;			//净重
	private Double measurement;			//体积
	
	private String createBy;
	private String createDept;
	private java.util.Date createTime;	
}
