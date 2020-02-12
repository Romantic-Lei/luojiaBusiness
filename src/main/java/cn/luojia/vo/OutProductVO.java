package cn.luojia.vo;

import lombok.Data;

@Data
public class OutProductVO {
	private String customName;			// 客户名称
	private String contractNo;			// 订单号
	private String productNo;			// 货号
	private String cnumber;				// 数量
	private String factoryName;			// 厂家名称
	private String exts;				// 附件
	private String deliveryPeriod;		// 交期
	private String shipTime;			// 船期
	private String tradeTerms;			// 贸易条款
}
