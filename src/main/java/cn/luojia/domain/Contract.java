package cn.luojia.domain;

import java.util.Date;

import lombok.Data;

/**
 * 合同类实体
 * @author luojiaBusiness
 * @CreateDate 2020年2月9日
 * @Description
 */
@Data
public class Contract {
	private String id;
	
	private String cpnum;			//货物数
	private String extnum;			//附件数
	
	private String offeror;         //合作方
	private String contractNo;      //合同号
	private Date signingDate;       //签单日期
	private String inputBy;         //制单人
	private String checkBy;         //审单人
	private String inspector;       //验货人
	private Double totalAmount;     //总金额
	private Integer importNum;      //重要程度(1, 2, 3)
	private String crequest;        //要求
	private String customName;      //客户名称
	private Date deliveryPeriod;    //交货日期
	private Date shipTime;          //船期
	private String tradeTerms;      //贸易条款
	private String remark;          //说明
	private String printStyle;      //打印板式
	private Integer oldState;       //归档前状态
	private Integer state;          //状态
	private Integer outState;       //走货状态
	private String createBy;        //创建人
	private String createDept;      //创建部门
	private Date createTime;        //创建时间

}
