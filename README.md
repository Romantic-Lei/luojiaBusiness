# luojiaBusiness
#珞珈商贸系统项目

#####主页设计时，企业中常用的两种设计方式

1）帧框架 frameset table（业务系统）

2）DIV + CSS + iframe （大型门户网站）



###业务关系

#####货运管理：

业务：购销合同

珞珈商务和生产厂家签订的合同叫做购销合同，购销合同包括合同主信息，多个货物信息，多个附件信息。一个购销合同包括多个货物信息，一个货物信息包含多个附件信息。两层一对多的关系



###开发时注意点：

1. 使用oracle 的jdbc驱动时，当后台传入的值为null时，必须告诉它当前字段的默认值类型jdbcType=VARCHAR

{fullName,jdbcType=VARCHAR}这种写法是 mybatis定义的，必须要这么写,我们才能将null变成空字符串,mysql就不用写

2. 有时我们在数据库中存值是想刻意换行存储，例如 ：
   和(换行 \n)
   谐，但是我们点击查看时，会显示成**和 谐**，换行被显示成了**空格**，这时我们如果依旧想要原样显示那么我们可以在jsp中添加<pre></pre>>
   <td class="columnTitle_mustbe">备注：</td>
   <td class="tableContent"><pre>${obj.cnote}</pre></td>
3. 