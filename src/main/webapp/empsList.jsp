<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
</head>

<body>
	<div class="modal fade" id="addEmp-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close addEmp-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel">添加员工信息</h4>
	      </div>
	      <div class="modal-body">
	        <form id="addEmp-form">
	          <div class="form-group">
	            <label for="firstName" class="control-label">firstName:<font id="firstNameMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="firstName">
	          </div>
	          <div class="form-group">
	            <label for="lastName" class="control-label">lastName:<font id="lastNameMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="lastName">
	          </div>
	          <div class="form-group">
	            <label for="email" class="control-label">email:<font id="emailMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="email">
	          </div>
	          <div class="form-group">
	            <label for="phoneNumber" class="control-label">phoneNumber:<font id="phoneNumberMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="phoneNumber">
	          </div>
	           <div class="form-group">
	            <label for="salary" class="control-label">salary:<font id="salaryMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="salary">
	          </div>
	           <div class="form-group">
	            <label for="hireDate" class="control-label">hireDate:<font id="hireDateMsg"></font></label>
	            <input type="text" class="form-control input-sm"  name="hireDate">
	          </div>
	           <div class="form-group">
	            <label for="departmentId" class="control-label">departmentName:<font id="departmentIdMsg"></font></label>
	            <select  name="departmentId" class="form-control ">
	            	<option value="">-- 请选择部门 --</option>
	            </select>
	          </div>
	           <div class="form-group">
	            <label for="jobId" class="control-label">jobTitle:<font id="jobIdMsg"></font></label>
	            <select  name="jobId" class="form-control">
	            	<option value="">-- 请选择工种 --</option>
	            </select>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button"  class="btn btn-default addEmp-close" data-dismiss="modal">关闭</button>
	        <button type="button" id="addEmp-submit" class="btn btn-primary">添加</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="updateEmp-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close updateEmp-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel">修改员工信息</h4>
	      </div>
	      <div class="modal-body">
	        <form id="updateEmp-form">
	          <input type="hidden" name="_method" value="put">
	          <input type="hidden" name="employeeId" >
	          <input type="hidden" name="pageNum" >
	          <div class="form-group">
	            <label for="firstName" class="control-label">firstName:<font id="update-firstNameMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="firstName">
	          </div>
	          <div class="form-group">
	            <label for="lastName" class="control-label">lastName:<font id="update-lastNameMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="lastName">
	          </div>
	          <div class="form-group">
	            <label for="email" class="control-label">email:<font id="update-emailMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="email">
	          </div>
	          <div class="form-group">
	            <label for="phoneNumber" class="control-label">phoneNumber:<font id="update-phoneNumberMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="phoneNumber">
	          </div>
	           <div class="form-group">
	            <label for="salary" class="control-label">salary:<font id="update-salaryMsg"></font></label>
	            <input type="text" class="form-control input-sm" name="salary">
	          </div>
	           <div class="form-group">
	            <label for="hireDate" class="control-label">hireDate:<font id="update-hireDateMsg"></font></label>
	            <input type="text" class="form-control input-sm"  name="hireDate">
	          </div>
	           <div class="form-group">
	            <label for="departmentId" class="control-label">departmentName:<font id="update-departmentIdMsg"></font></label>
	            <select  name="departmentId" class="form-control ">
	            	<option value="">-- 请选择部门 --</option>
	            </select>
	          </div>
	           <div class="form-group">
	            <label for="jobId" class="control-label">jobTitle:<font id="update-jobIdMsg"></font></label>
	            <select  name="jobId" class="form-control">
	            	<option value="">-- 请选择工种 --</option>
	            </select>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button"  class="btn btn-default updateEmp-close" data-dismiss="modal">关闭</button>
	        <button type="button" id="updateEmp-submit" class="btn btn-primary">修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="container-fluid">
		 <div id="table-header-row" class="row">
			  <div class="col-md-4 col-md-offset-4" ><h2>显示所有员工信息</h2></div>
		 </div>
		 <div id="add-delete-row" class="row">
				<div class="col-md-2 col-md-offset-10" >
					<button type="button" id="addEmp-btn" class="btn btn-primary">添加</button>
					<button type="button" id="deleteEmps-selected-btn" class="btn btn-danger">删除</button>
				</div>
		 </div>
		 <div id="table-row" class="row">
			 <form id="batchDeleteForm" action="" method="get">
			 	<input type="hidden" name="_method" value="delete">
			 	<table id="emps-table" class="table table-bordered table-hover">
			 		<thead>
			 			<tr>
			 				<th><input id="select-all" type="checkbox">全选</th>
			 				<th>编号</th>
			 				<th>姓</th>
			 				<th>名</th>
			 				<th>邮箱</th>
			 				<th>电话</th>
			 				<th>薪水</th>
			 				<th>入职日期</th>
			 				<th>部门</th>
			 				<th>工种</th>
			 				<th colspan="2">操作</th>
			 			</tr>
			 		</thead>
			 		<tbody></tbody>
				</table>
			</form>
		 </div>
		 <div id="nav-row" class="row">
		 	<div id="pageInfo" class="col-md-4 col-md-offset-1"></div>
		 	<div id="pageNavi" class="col-md-6 col-md-offset-8">
		 		<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	
				  </ul>
				</nav>
		 	</div>
		 </div>	
	</div>
	
</body>
	<script type="text/javascript">
		$(function () {
			// 加载完页面以后，首先，自动去请求第一页的数据
			getEmpsByPage(1);
		})
		
		// 根据页数向数据库请求数据
		function getEmpsByPage(pageNum) {
			$.get(
				"${pageContext.request.contextPath }/employee/emps/",
				{"pageNum": pageNum},
				function (data) {
					//  状态码200 说明请求成功，拿到数据了
					//  接下来就是解析json 数据，然后封装数据
					if(data.code == 200){
						// 填充员工数据
						buildEmpsData(data);
						// 填充分页信息数据
						buildPageInfo(data);
						// 填充分页导航信息
						buildPageNavi(data);
						
						// 如果状态码是 400 的话，那么说明请求失败了，我们就提示请求失败
					}else if(data.code == 400){
						alert(data.message);
					}else{
						alert("服务器没有响应！");
					}
				},
				"json"
			); 
		}
			
			// 填充员工数据
			function buildEmpsData(data) {
				// 解析data 数据，拿到员工数据集合
				var emps = data.content.page.list;
				// console.log(emps);
				// 找到指定的表格标签元素  tbody 
				// 拿到以后要清空一下里面的元素，不然以前的数据还在，会把所有数据都拼接在一起
				var tbody = $("#emps-table tbody").empty();
				// 拼接一个隐藏的标签，传输当前页面，用于批量操作成功后，再次请求该页面查看操作效果
				tbody.append("<input name='pageNum' type='hidden' value='"+ data.content.page.pageNum +"'>")
				
				//遍历集合
				$.each(emps, function (index, emp) {
					/* <tr>
			 				<td><input type="checkbox"></td>
			 				<td>0001</td>
			 				<td>王</td>
			 				<td>小明</td>
			 				<td>xiaoming@qq.com</td>
			 				<td>123456789</td>
			 				<td>5000.0</td>
			 				<td>2019-1-1</td>
			 				<td>开发部</td>
			 				<td>java初级工程师</td>
			 				<td><button type="button" class="btn btn-primary">修改</button></td>
			 				<td><button type="button" class="btn btn-danger">删除</button></td>
			 			</tr> */
					// 每遍历一条数据就创建一个tr 元素，然后把数据填充进去
					var tr = $("<tr></tr>");
					tr.append("<td><input type='checkbox' name='empIds' value='" + emp.employeeId + "'></td>")
					  .append("<td>"+ emp.employeeId +"</td>")
					  .append("<td>"+ emp.firstName +"</td>")
					  .append("<td>"+ emp.lastName +"</td>")
					  .append("<td>"+ emp.email +"</td>")
					  .append("<td>"+ emp.phoneNumber +"</td>")
					  .append("<td>"+ emp.salary +"</td>")
					  .append("<td>"+ dateFormat(emp.hireDate) +"</td>")
					  .append("<td>"+ emp.dept.departmentName +"</td>")
					  .append("<td>"+ emp.job.jobTitle +"</td>")
					  .append("<td><button type='button' pageNum='"+ data.content.page.pageNum +"' empid='"+ emp.employeeId +"' class='btn btn-primary updateEmp'>修改</button></td>")
					  .append("<td><button type='button' pageNum='"+ data.content.page.pageNum +"' empid='"+ emp.employeeId +"' class='btn btn-danger deleteEmp'>删除</button></td>");
					// 然后把这个tr 拼接到 tbody 里面
					tbody.append(tr);
				});
				
				// 为每条员工记录后面的删除按钮添加绑定事件,记住我们已经在填充完员工数据以后
				// 也就是员工数据存在以后再绑定事件
				$(".deleteEmp").click(function() {
					var empId = $(this).attr("empId");
					var pageNum = $(this).attr("pageNum");
					$.post(
						"${pageContext.request.contextPath }/employee/deleteEmp",
						{"employeeId": empId, "_method": "delete", "pageNum": pageNum},
						function (data) {
							if(data.code == 200){
								alert("删除成功！");
								// 删除成功以后，我们应该再次请求这一页数据，看到删除效果
								getEmpsByPage(data.content.pageNum);
							}else if(data.code == 400){
								// 删除失败的话，我们就弹窗提示一下，也不需要再请求数据了
								alert("删除失败！！");
							}else{
								alert("服务器没有响应，删除操作可能会失败！");
							}
						},
						"json"
					)
				})
				
				// 为每条员工记录后面的更新按钮绑定点击事件，一定要在填充完员工数据后再去绑定
				// 也就是员工数据存在以后再绑定事件
				$(".updateEmp").click(function() {
					// 首先，点击以后，我们应该先根据 empId 去后台请求这个 Employee 对象的最新值
					var empId = $(this).attr("empId");
					
					$.get(
						"${pageContext.request.contextPath }/employee/updateEmpPage",
						{"employeeId": empId},
						function(data) {
							if(data.code == 200){
								// 获取到了更新员工信息需要的数据以后，我们就要遍历json 数据
								// 先填充更新模态框的数据
								var pageNum = $("#pageNum-hidden").val();
								if(pageNum != undefined && pageNum != null){
									$("#updateEmp-form input[name=pageNum]").val(pageNum);
								}
								
								var employeeId = data.content.emp.employeeId;
								if(employeeId != undefined && employeeId != null){
									$("#updateEmp-form input[name=employeeId]").val(employeeId);
								}
								
								var firstName = data.content.emp.firstName;
								if(firstName != undefined && firstName != null){
									$("#updateEmp-form input[name=firstName]").val(firstName);
								}
								
								var lastName = data.content.emp.lastName;
								if(lastName != undefined && lastName != null){
									$("#updateEmp-form input[name=lastName]").val(lastName);
								}
								
								var email = data.content.emp.email;
								if(email != undefined && email != null){
									$("#updateEmp-form input[name=email]").attr("oldEmail", email).val(email);
								}
								
								var phoneNumber = data.content.emp.phoneNumber;
								if(phoneNumber != undefined && phoneNumber != null){
									$("#updateEmp-form input[name=phoneNumber]").val(phoneNumber);
								}
								
								var salary = data.content.emp.salary;
								if(salary != undefined && salary != null){
									$("#updateEmp-form input[name=salary]").val(salary);
								}
								
								var hireDate = data.content.emp.hireDate;
								if(hireDate != undefined && hireDate != null){
									$("#updateEmp-form input[name=hireDate]").val(dateFormat(hireDate));
								}
								
								// 遍历 deptList ，填充部门选项
								var deptList = data.content.deptList;
								console.log(deptList);
								if(deptList != undefined && deptList != null && deptList.length > 0){
									// 首先，我们获取父元素对象
									var deptIdSelect = $("#updateEmp-form select[name=departmentId]").empty();
									// 遍历deptList 填充数据
									$.each(deptList, function(index, item) {
										var option = $("<option></option>").prop("value", item.departmentId)
										                                   .text(item.departmentName);
										if(item.departmentId == data.content.emp.departmentId){
											option.prop("selected", "selected");
										}
										option.appendTo(deptIdSelect);
									});
								}else{
									alert("没有接收到部门信息，无法更新数据");
									return;
								}
								
								// 遍历jobList ，填充工种选项
								var jobList = data.content.jobList;
								console.log(jobList);
								if(jobList != undefined && jobList != null && jobList.length > 0){
									// 首先，我们获取父元素对象
									var jobIdSelect = $("#updateEmp-form select[name=jobId]").empty();
									// 遍历deptList 填充数据
									$.each(jobList, function(index, item) {
										var option = $("<option></option>").prop("value", item.jobId)
										                                   .text(item.jobTitle);
										if(item.jobId == data.content.emp.jobId){
											option.prop("selected", "selected");
										}
										option.appendTo(jobIdSelect);
									});
								}else{
									alert("没有接收到工种信息，无法更新数据");
									return;
								}
								// 然后显示模态框
								$("#updateEmp-modal").modal("show");
								
							}else if(data.code == 400){
								alert("服务器出现异常，暂时无法更新员工信息！");
							}else{
								alert("服务器没有响应，暂时无法更新员工信息！");
							}
						},
						"json"
					)
					
				})
				
			}
			// 填充分页信息数据
			function buildPageInfo(data) {
				// 拿到以后要清空一下里面的元素，不然以前的数据还在，会把所有数据都拼接在一起
				var pageInfo = $("#pageInfo").empty();
				pageInfo.append("<span>当前页"+data.content.page.pageNum+", 共有 "+data.content.page.pages+"页, 总计"+data.content.page.total+"条记录</span>");
				// 这里我们使用一个隐藏的标签保存当前页数据，只为在其他地方方便拿到
				pageInfo.append("<input id='pageNum-hidden' type='hidden' value='"+ data.content.page.pageNum +"'>");
			};
			
			// 填充分页导航信息
				/* <li>
			      <a id="firstPage" href="#" >
			        <span aria-hidden="true">首页</span>
			      </a>
			    </li>
			    <li>
			      <a id="prePage" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a id="nextPage" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    <li>
			      <a id="lastPage" href="#" >
			        <span aria-hidden="true">尾页</span>
			      </a>
			    </li> */
			function buildPageNavi(data){
			    // 首先，拿到放分页导航的那个元素
			    // 拿到以后要清空一下里面的元素，不然以前的数据还在，会把所有数据都拼接在一起
			    var ul = $("#pageNavi nav ul").empty();
			    // 然后根据情况拼接首页导航和上一页导航
			    if(data.content.page.hasPreviousPage){
			    	ul.append($("<li></li>").append("<a id='firstPage' href='#' ><span aria-hidden='true'>首页</span></a>"));
			    	ul.append($("<li></li>").append("<a id='prePage' href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>"));
			   		// 创建完这些a标签以后，我们就马上绑定点击事件
			    	$("#firstPage").click(function() {
			   			getEmpsByPage(1);
			   			return false;
					})
					
					$("#prePage").click(function() {
						getEmpsByPage(data.content.page.prePage);
						return false;
					})
			    }else{
			    	ul.append($("<li class='disabled'></li>").append("<span id='firstPage' href='#' ><span aria-hidden='true'>首页</span></span>"));
			    	ul.append($("<li class='disabled'></li>").append("<span id='prePage' href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></span>"));
			    	// 如果根本就没有上一页的话，那么我们直接不绑定事件
			    }
			    
			    // 遍历导航数组，然后填充导航数据
				var navigatepageNums = data.content.page.navigatepageNums;
			    //console.log(navigatepageNums);
				$.each(navigatepageNums, function (index, item) {
					if(item == data.content.page.pageNum){
						ul.append($("<li class='active'></li>").append("<span href='#'>"+item+"</span>"));
					}else{
						var li = $("<li></li>").append("<a href='#'>"+item+"</a>");
						ul.append(li);
						// 同样的道理，这里也是创建完 a 标签以后，马上绑定点击事件
						// 注意： 我们不要像首页、上一页那样，在a 标签上面添加个 id ，因为这是在一个循环中
						//      如果你给 a 标签搞个 id ， 那么所有的 id 都会相同。于是绑定的事件会相互覆盖。
						//      所以我们干脆绑定在父元素 li 上面，事件会冒泡的，所以相当于 a 标签也绑定了点击事件
						// 【注意】 这里会产生闭包吗？  没有。 因为 item 是全局变量  data 的引用，所以没有什么闭包不闭包的问题。
						//                      如果 item 本身也是一样局部变量，那么就会产生闭包问题。
						 //                     如果闭包很久没看，肯定会忘，忘了再复习下就是了
						li.click(function() {
							getEmpsByPage(item);
							return false;
						}); 
					}
				}); 
				
				// 根据情况拼接尾页导航和下一页导航
				if(data.content.page.hasNextPage){
			    	ul.append($("<li></li>").append("<a id='nextPage' href='#'"+ data.content.page.nextPage +"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>"));
			    	ul.append($("<li></li>").append("<a id='lastPage' href='#'"+ data.content.page.pages +"' ><span aria-hidden='true'>尾页</span></a>"));
			    	// 创建完这些a标签以后，我们就马上绑定点击事件
			    	$("#nextPage").click(function() {
			   			getEmpsByPage(data.content.page.pageNum + 1);
			   			return false;
					})
					
					$("#lastPage").click(function() {
						getEmpsByPage(data.content.page.pages);
						return false;
					})
				}else{
			    	ul.append($("<li class='disabled'></li>").append("<span id='nextPage' href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></span>"));
			    	ul.append($("<li class='disabled'></li>").append("<span id='lastPage' href='#' ><span aria-hidden='true'>尾页</span></span>"));
			    }

			}
			
			// 把一个时间戳（long 类型的整数）转成指定格式的日期
			function dateFormat(timeStamp) {
				var date = new Date(timeStamp);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				return [year, month, day].join("-");
			};
			
			// 给添加员工按钮绑定点击事件
			$("#addEmp-btn").click(function() {
				// 使用异步请求，去后台拉取部门和工种选项信息
				$.get(
					"${pageContext.request.contextPath }/employee/addEmpPage",
					{},
					function(data){
						if(data.code == 200){
							//请求成功，我们就开始封装数据
							// 先获取部门select 标签， 然后清除里面的所有数据
							var departmentSelect = $("#addEmp-form select[name='departmentId']").empty();
							// 然后遍历   json 数据，生成对应的 option 标签，拼接到 部门的select 标签里面去
							// 首先拼接一个默认的 option 标签
							departmentSelect.append("<option value=''>-- 请选择部门 --</option>");
							$.each(data.content.deptList, function(index, item) {
								$("<option></option>").attr("value", item.departmentId)
								                      .text(item.departmentName)
								                      .appendTo(departmentSelect);
							});
							
							// 获取工种 select 标签，然后清除里面的所有数据
							var jobSelect = $("#addEmp-form select[name='jobId']").empty();
							// 拼接一个默认的 option 标签
							jobSelect.append("<option value=''>-- 请选择工种 --</option>");
							// 遍历 json 数据，生成对应的 option 标签
							$.each(data.content.jobList, function(index, item) {
								$("<option></option>").attr("value", item.jobId)
								                      .text(item.jobTitle)
								                      .appendTo(jobSelect);
							});
							
							// 设置模态框的属性
							$("#addEmp-modal").modal({
								// 是否点击一下背景就隐藏模态框，如果true 就是隐藏， false 或者 字符串就是不隐藏
								backdrop : false,
								keyboard : false
							});
							
							// 显示模态框
							$("#addEmp-modal").modal('show');
						}else if(data.code == 400){
							// 请求失败，我们就弹窗说无法添加
							alert("服务器异常，请稍后添加！");
						}
					},
					"json"
				);
			});
		
	
	
		// 给添加员工信息页面的  邮箱栏添加 onchange 事件，看看是否跟数据库的数据重复
		$("#addEmp-form input[name=email]").change(function() {
			var email = this.value;
			$.get(
				"${pageContext.request.contextPath }/employee/checkEmail",
				{"email": email},
				function(data) {
					if(data.code == 200){
						$("#emailMsg").attr("color", "green").text(data.content.msg);
					}else if(data.code == 400){
						$("#emailMsg").attr("color", "red").text(data.content.msg);
					}else{
						alert("服务器没有响应，无法校验邮箱");
					}
				},
				"json"
			)
		});
		
		// 给添加按钮添加点击事件，当点击此按钮，会请求数据库添加员工信息
		// 如果添加成功，我们做以下几件事：
		//         1、 清除模态框的所有数据和状态，以便下次再次打开的时候会出现混乱 
		//         2、 隐藏模态框
		//         3、 请求所有的员工分页数据，请求最后一页（主要是为了看一下刚才添加的数据有没有成功）

		// 如果添加失败，一般就是服务端那边校验失败了，我们要解析 json 数据，把校验失败的原因分别显示在对应的字段上面
		$("#addEmp-submit").click(function() {
			// 先进行一些简单的校验，但是 js 校验只能防君子不能防小人，重要的数据都需要在服务端再校验一次
			// 这些校验很多，很烦，我懒得再写了，这里就略过了
			
			
			// 不管我们有没有做 js 校验，反正我们先前是使用 ajax 校验了邮箱
			// 如果邮箱校验没有通过的话，那么我们就不提单表单了
			if($("#emailMsg").attr("color") == "red"){
				return ;
			}
			
			// 使用$.post提交表单数据,然后根据返回结果进行处理
			// 使用 serialize() 获取表单数据
			var data = $("#addEmp-form").serialize();
			$.post(
				"${pageContext.request.contextPath }/employee/addEmp",
				data,
				function(data) {
					if(data.code == 200){
						// 添加成功的话，我们首先是清除原来的数据
						$("#addEmp-form")[0].reset();
						// 清除所有的提示信息
						$("#addEmp-form font").removeAttr("color").text("");
						// 关闭模态框 
						$("#addEmp-modal").modal("hide");
						// 请求最后一页
						// 因为我们现在不知道哪一页才是最后一页，以前的数据可能也不准，所以我们干脆输入一个很大的数
						// 如果我们要稳一点的话，那么就需要添加员工的时候把保存之前的总记录数记一下，
						// 然后保存成功以后服务器再把这个数据返回给前台，再然后我们根据这个数据推算应该在哪一页可以看到刚插入的数据
						// 当然，如果是高并发的情况下，那种方法也不好用。 这里就随意一点，直接来个很大的数去最后一页
						// 【注意】 这里之所以能直接去最后一页是因为PageHelper 设置了reasonable 参数为true
						getEmpsByPage(Math.pow(2, 25));
					}else if(data.code == 400){
						// 添加失败可能是因为参数校验失败，会有 errors 参数;  也可能是抛异常了，我们暂时不管什么异常
						if(data.content.errors == undefined){
							alert("出现未知异常，保存失败");
							// 清空所有数据
							$("#addEmp-form")[0].reset();
							// 清除所有的提示信息
							$("#addEmp-form font").removeAttr("color").text("");
							// 关闭模态框 
							$("#addEmp-modal").modal("hide");
						}else{
							// 因为参数校验而添加失败以后，我们不要清除数据，但是以前的错误信息还是要清除一下的
							$("#addEmp-form font").removeAttr("color").text("");
							// 把错误消息填充到对应的字段上面去就可以了
							$.each(data.content.errors, function(index, item) {
								var selector = "#" + item.field + "Msg";
								if(item.field != 'hireDate'){
									$(selector).attr("color", "red").text(item.defaultMessage);
								}else{
									$(selector).attr("color", "red").text(data.content.dateError.defaultMessage);
								}
							})
						}
						
					}else{
						alert("服务器无响应，添加可能失败！");
					}
				},
				"json"
			);
		})
		
		// 为手动关闭模态框的两个地方添加绑定事件
		// 手动关闭以后，应该要清除所有的提示信息和所有数据
		$(".addEmp-close").click(function() {
			// 清空所有数据
			$("#addEmp-form")[0].reset();
			// 清除所有的提示信息
			$("#addEmp-form font").removeAttr("color").text("");
			// 不需要取消默认事件
		});
		
		// 为批量删除按钮添加点击事件，点击以后会获取选中的员工编号，然后提交表单
		$("#deleteEmps-selected-btn").click(function() {
			var data = $("#batchDeleteForm").serialize();
			//console.log(data);
			$.post(
				"${pageContext.request.contextPath }/employee/deleteEmps",	
				data,
				function(data) {
					if(data.code == 200){
						// 批量删除成功以后，我们弹框提示一下成功删除多少条
						alert(data.content.msg);
						// 重新请求原来的页面，查看删除的效果
						getEmpsByPage(data.content.pageNum);
					}else if(data.code == 400){
						alert(data.content.msg);
					}else{
						alert("服务器没有响应！批量删除操作可能失败！")
					}
				},
				"json"
				
			)
		});
		
		// 给修改员工信息页面的  邮箱栏添加 onchange 事件，看看是否跟数据库的数据重复
		$("#updateEmp-form input[name=email]").change(function() {
			var oldEmail = $(this).attr("oldEmail");
			var email = this.value;
			// 如果我们改了半天以后，又改回原来的那个 email 的话，那么也不用去数据库查什么重复了
			// 直接显示可以使用就好了
			if(oldEmail == email){
				$("#update-emailMsg").attr("color", "green").text("该邮箱可以使用");
			}else{
				$.get(
						"${pageContext.request.contextPath }/employee/checkEmail",
						{"email": email},
						function(data) {
							if(data.code == 200){
								$("#update-emailMsg").attr("color", "green").text(data.content.msg);
							}else if(data.code == 400){
								$("#update-emailMsg").attr("color", "red").text(data.content.msg);
							}else{
								alert("服务器没有响应，无法校验邮箱");
							}
						},
						"json"
					)
			}
			
		});
		
		// 给更新按钮绑定点击事件，当我们点击更新按钮，会提交表单到后台 
		// 更新前后进行js 校验，如果校验不通过，就不提交表单
		// 提交表单后有以下几种可能情况：
		// 1、 提交成功，那么我们再次请求这个页面，查看更新的效果
		// 2、 提交失败，我们就弹窗提示一下更新失败了
		// 3、 参数绑定异常，那么我们不需要清空数据，只需要把错误信息写到指定的字段上面去就可以了
		$("#updateEmp-submit").click(function() {
			// 先进行一些简单的校验，但是 js 校验只能防君子不能防小人，重要的数据都需要在服务端再校验一次
			// 这些校验很多，很烦，我懒得再写了，这里就略过了
			
			// 不管我们有没有做 js 校验，反正我们先前是使用 ajax 校验了邮箱
			// 如果邮箱校验没有通过的话，那么我们就不提单表单了
			if($("#update-emailMsg").attr("color") == "red"){
				return ;
			}
			
			// 使用$.post提交表单数据,然后根据返回结果进行处理
			// 使用 serialize() 获取表单数据
			var data = $("#updateEmp-form").serialize();
			console.log(data);
			$.post(
				"${pageContext.request.contextPath }/employee/updateEmp",
				data,
				function(data) {
					console.log(data);
					if(data.code == 200){
						alert("修改员工信息成功！");
						// 更新成功的话，我们首先是清除原来的数据
						$("#updateEmp-form")[0].reset();
						// 清除所有的提示信息
						$("#updateEmp-form font").removeAttr("color").text("");
						// 关闭模态框 
						$("#updateEmp-modal").modal("hide");
						
						// 更新成功以后，我们重新请求原来的页面，就可以查看更新的结果
						getEmpsByPage(data.content.pageNum);
					}else if(data.code == 400){
						// 添加失败可能是因为参数校验失败，会有 errors 参数;  也可能是抛异常了，我们暂时不管什么异常
						if(data.content.errors == undefined){
							alert("出现未知异常，更新失败");
							// 不要清空数据
							// 清除所有的提示信息
							$("#updateEmp-form font").removeAttr("color").text("");
							// 关闭模态框 
							$("#updateEmp-modal").modal("hide");
						}else{
							// 弹窗提示一下修改失败了
							alert("参数绑定失败，修改失败了");
							// 因为参数校验而添加失败以后，我们不要清除数据，但是以前的错误信息还是要清除一下的
							$("#updateEmp-form font").removeAttr("color").text("");
							// 把错误消息填充到对应的字段上面去就可以了
							$.each(data.content.errors, function(index, item) {
								var selector = "#update-" + item.field + "Msg";
								console.log(selector);
								if(item.field != 'hireDate'){
									$(selector).attr("color", "red").text(item.defaultMessage);
								}else{
									$(selector).attr("color", "red").text(data.content.dateError.defaultMessage);
								}
							})
						}
					}else{
						alert("服务器无响应，添加可能失败！");
					}
				},
				"json"
			);
		})
	</script>
</html>