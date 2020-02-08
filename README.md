# luojiaBusiness
#珞珈商贸系统项目

主页设计时，企业中常用的两种设计方式

1）帧框架 frameset table（业务系统）

2）DIV + CSS + iframe （大型门户网站）

使用oracle 的jdbc驱动时，当后台传入的值为null时，必须告诉它当前字段的默认值类型jdbcType=VARCHAR

	#{fullName,jdbcType=VARCHAR}这种写法是 mybatis定义的，必须要这么写,我们才能将null变成空字符串,mysql就不用写