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



购销合同的上报和取消

上报：当销售人员录入合同后，确认无误后，点击“提交”，初次提交之后的信息都是为草稿状态，如果我们录入人员不更新状态的话下一个流程的人事看不到这个记录的。我们更改合同状态为上报后，下一个流程的工作人员就可以看见相对应的信息。

取消：当提交之后，发现信息有误，我们可以点击取消上报。如果报运人员没有操作，则我们可以正常回退；当报运人员开始操作并有了相应的记录，我们无法回退只能走补录流程。







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
   	<option value="T/T(电汇
                      
                      )" <c:if test="${obj.tradeTerms eq 'T/T(电汇)' }">selected</c:if>>T/T(电汇)</option>
   	<option value="L/C(远期信用)" ${obj.tradeTerms=="L/C(远期信用)"?'selected':''}>L/C(远期信用)</option>
   </select>
   ```

   ​	不论我们使用 **<c:if ></c:if >标签** 还是使用  **三目运算符** 都可以达成我们的目的		

   4. 有时在我们前端页面中，前端input框的name属性和我们控制层接收的参数名字不一致，会导致我们接收不到前端传递过来的参数。
      例子：

      ```html
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

   5.    
      
   6. 







