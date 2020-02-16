# luojiaBusiness
#珞珈商贸系统项目

#####主页设计时，企业中常用的两种设计方式

1）帧框架 frameset table（业务系统）

2）DIV + CSS + iframe （大型门户网站）



###业务关系

#####货运管理：

业务：购销合同

珞珈商务和生产厂家签订的合同叫做购销合同，购销合同包括合同主信息，多个货物信息，多个附件信息。一个购销合同包括多个货物信息，一个货物信息包含多个附件信息。两层一对多的关系



数据库基础设计原则：**三范式**

1. 表必须有主键
2. 字段内容不能是其他的字段加工而成
3. 行数据不能相同

现在业界主流数据库设计原则：**反三范式**

1. 表不必须是主键
2. 字段存一些加工后的结果，**冗余设计**
3. 记录冗余

#####**区别：**

​	三范式追求的目标存储空间尽量小；反三范式追求的目标是查询速度快

​	创建数据库设计时首先按三范式设计，然后在局部优化。



#####购销合同的上报和取消

上报：当销售人员录入合同后，确认无误后，点击“提交”，初次提交之后的信息都是为草稿状态，如果我们录入人员不更新状态的话下一个流程的人事看不到这个记录的。我们更改合同状态为上报后，下一个流程的工作人员就可以看见相对应的信息。

取消：当提交之后，发现信息有误，我们可以点击取消上报。如果报运人员没有操作，则我们可以正常回退；当报运人员开始操作并有了相应的记录，我们无法回退只能走补录流程。



#####数据字典：

它是一个通用结构，和业务没有关系，数据字段使用户可以动态的扩充内容。它的分类用户不能改，分类是系统上线时，开发人员初始化。



##### 两层一对多

子表数据不设置外键关联时，当删除主表时，我们子表的数据就无法删除，然后就变成了脏数据

**级联删除**

Hibernate	多层关联关系最简单；配置关联关系时，只关心上级对象

MyBatis		多层关联关系时，级联删除必须一级一级的删除。多级时要专门写mapper方法（写专门SQL进行删除）

1）在MyBatis 的service，删除货物时，先调用附件的service删除方法

2）通过SQL 高速删除（批量删除）



##### 合同总金额

1）可以通过货物的新增时，同步计算货物的总金额和合同的总金额；在附件新增时，同步计算附件的总金额和合同的总金额（程序完成，修改、删除时重新计算）

2）利用SQL计算



##### 购销合同查看

购销合同查看，查看合同的主信息，查看合同下的货物信息，还要查看附件信息，**货物和附件的信息要显示出它们的关联关系。**

利用面向对象的关联关系来实现上面的需求非常简单。

合同、货物、附件、生产厂家构建复杂多级关联的SQL时的原则：

1）挑选最小的结果集

2）滚雪球（一般是使用左链接），逐步往上加内容

3）重复字段，需要起别名（mybatis）。他可以把一个结果作为一个字段，这样的SQL返回结果集必须是一个列。同时在这个子查询中它的条件可以拼接动态的查询条件

在实际业务中几户没有内连接的情况，直接使用左链接即可。



##### mybatis配置多对一与一对多

当配置**<u>一对多</u>**时，我们使用 **collection 元素**，其中与collection 搭配使用的是 **ofType** 属性

当配置**<u>多对一</u>**时，我们使用 **association元素**，其中与association搭配使用的是 **javaType**属性

```xml
<!-- 合同和货物（一对多） -->
<collection property="contractProduct" ofType="cn.luojia.vo.ContractProductVO">
	<id property="id" column="CONTRACT_PRODUCT_ID"/>
	<result property="productNo" column="PRODUCT_NO"/>
</collection>

<!-- 货物和生产厂家（多对一） -->
<association property="factory" javaType="cn.luojia.domain.Factory">
    <id property="id" column="FACTORY_ID"/>
    <result property="fullName" column="FULL_NAME"/>
    <result property="factoryName" column="FACTORY_NAME"/>
    <result property="contacts" column="CONTACTS"/>
</association>

```



####出货表

对购销合同进行统计，按船期进行统计

合同、货物、生产厂家、附件设计，关联四张表

通过冗余设计，只需要从合同，货物表中获取数据；取数据更加方便，代码更加简洁

##### JAVA语言操作 Excel

1.POI Apache 它是用来操作 Office 所有的软件，而且支持所有的版本

2.JXL 它是用来操作 Excel 2003以下版本，2007以上版本不支持

**POI入门**

Excel 文件

POI 开发步骤

​		 * 开发步骤：

​		 * 1、创建一个工作簿

​		 * 2、创建一个工作表

​		 * 3、创建一个行对象

​		 * 4、创建一个单元格对象，指定它的列

​		 * 5、给单元格设置内容

​		 * 6、样式进行修饰

​		 * 7、保存，写文件

​		 * 8、关闭对象

```java
// 带格式
@Test
public void HSSFStyle() throws IOException {
    // 1.创建一个工作簿
    Workbook wb = new HSSFWorkbook(); // 只能操作2003以下版本
    // 2.创建一个工作表
    Sheet sheet = wb.createSheet();
    // 3.创建一个行对象
    Row nRow = sheet.createRow(4); // 第五行，坐标从0开始
    // 4.创建一个单元格对象，指定列
    Cell nCell = nRow.createCell(5); // 第六列
    // 创建一个单元格样式
    CellStyle titleStyle = wb.createCellStyle();
    // 创建一个字体对象
    Font titleFont = wb.createFont();
    titleFont.setFontName("华文行楷"); // 设置字体样式
    titleFont.setFontHeightInPoints((short)26);	// 设置像素

    titleStyle.setFont(titleFont);

    Row xRow = sheet.createRow(5);
    Cell xCell = xRow.createCell(7);
    xCell.setCellValue("https://www.whu.edu.cn");

    CellStyle textStyle = wb.createCellStyle();
    Font textFont = wb.createFont();
    textFont.setFontName("仿宋");
    textFont.setFontHeightInPoints((short)12);

    nCell.setCellStyle(titleStyle);
    xCell.setCellStyle(textStyle);

    // 5.给单元格赋值
    nCell.setCellValue("珞珈商贸国际物流");
    // 6.保存
    OutputStream os = new FileOutputStream(new File("C:\\HSSF.xls"));
    wb.write(os);
    // 7.关闭
    os.close();
}
```

上面代码存在问题

1）POI 创建的这些对象统统在内存中

2）行对象，列队向，样式对象，字体对象都是反复创建

POI操作百万数据的打印

1） 从数据库读取数据，LIST在构造时十分耗费内存，还占用CPU资源

2）Xlsx一个单sheet可以支持1048576条数据。它加工这些数据时，都是暂时放在内存中。报内存堆溢出。



#### 出口报运

我们商贸公司 (以下用我司代替) 和厂家签订购销合同，厂家就开始准备生产货物，与此同时，我司也开始准备申报材料。一个出口报运单包含多个购销合同(典型的一对多)











###开发时注意点：

1. 使用oracle 的jdbc驱动时，当后台传入的值为null时，必须告诉它当前字段的默认值类型jdbcType=VARCHAR

{fullName,jdbcType=VARCHAR}这种写法是 mybatis定义的，必须要这么写,我们才能将null变成空字符串,mysql就不用写

2. 有时我们在数据库中存值是想刻意换行存储，例如 ：
   和(换行 \n)
   谐，但是我们点击查看时，会显示成**和 谐**，换行被显示成了**空格**，这时我们如果依旧想要原样显示那么我们可以在jsp中添加
   
   ```html
    <pre></pre> 添加此标签
   <td class="column">备注：</td>
   <td class="table"><pre>${obj.cnote}</pre></td>
   ```
   
   
   
3. 在我们的下拉框更新回显中，我们需要显示数据库中存储的信息，所以在更新回显时我们需要做一个判断才能显示，此时我们可以有两种回显判断方法，例如在我们的购销合同更新文件中：

  ```html
  <select name="tradeTerms">
     	<option value="T/T(电汇 )" <c:if test="${obj.tradeTerms eq 'T/T(电汇)' }">selected</c:if>>T/T(电汇)</option>
  	<option value="L/C(远期信用)" ${obj.tradeTerms=="L/C(远期信用)"?'selected':''}>L/C(远期信用)</option>
  </select>
  ```

   	不论我们使用 **<c:if ></c:if >标签** 还是使用  **三目运算符** 都可以达成我们的目的
  
4. 有时在我们前端页面中，前端input框的name属性和我们控制层接收的参数名字不一致，会导致我们接收不到前端传递过来的参数。
   例子：

   ```xml
     <td><input type="checkbox" name="id" value="${o.id}" /></td>
   ```

   ```java
   @RequestMapping("/cargo/contract/submit.action")
      public String submit(String[] id) {
      	contractService.submit(id);
      		
      	return "redirect:/cargo/contract/list.action";
      }
      
      @RequestMapping("/cargo/contract/cancel.action")
      public String cancel(@RequestParam("id") String[] ids) {
      	contractService.cancel(ids);
      	
      	return "redirect:/cargo/contract/list.action";
      }
   ```

   在本例中，前端 input 框中name属性为id，在我们 Controller 层中，我们有两种方式接收 input 框传递过来的参数，方法一就是和 input 框 name属性一致，方法二就是我们加上一个 @RequestParam()注解，注解的参数就是input 框中的name属性，然后他会自动帮我们装到 名为ids 的数组中。

   

5. 在使用 POI做报表的时候，在显示金额时，我们可以设置金额显示格式：

   ```java
   public short rmb2Format(HSSFWorkbook wb) {
       HSSFDataFormat format = wb.createDataFormat();
       return format.getFormat("\"￥\"#,###,###.00"); // 设置格式
   }
   ```

   0表示，这位值如果不为0，显示原来的内容，否则就输出0

   \#表示，这位值如果存在，就直接显示，如果不存在，就不显示

6. 数据库优化设计
   打断设计：传统方式创建对象关联：当业务层级过多，查询效率急速下降，在设计数据库表时，关联关系不要超过4层，打断设计将业务多级进行分解，硬拆成多个块，具体实现就是通过一个字段来存储两个表之间的关系，存储主表的id，将多个id用测速符号分隔。

7. 数据搬家（冗余）
   将合同下的部分信息直接放到报运下的货物表中，这样直接在报运的货物表中查询（无需关心哪个合同的货物信息，也无需关心货物部分信息和报运部分信息的对应

8. 

9. 

      

     


​    



   







