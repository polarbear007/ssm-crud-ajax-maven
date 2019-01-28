package cn.itcast.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.itcast.entity.Department;
import cn.itcast.entity.Employee;
import cn.itcast.entity.Job;
import cn.itcast.entity.JsonMessage;
import cn.itcast.service.DepartmentService;
import cn.itcast.service.EmployeeService;
import cn.itcast.service.JobService;
import cn.itcast.validation.EmailOnlyValidation;
import cn.itcast.validation.InsertValidation;
import cn.itcast.validation.UpdateValidation;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private JobService jobService;
	
	@GetMapping("/emps")
	public JsonMessage getEmps(@RequestParam(name="pageNum", defaultValue="1")Integer pageNum) {
		PageHelper.startPage(pageNum, 10);
		List<Employee> emps = employeeService.findAll();
		PageInfo<Employee> page = PageInfo.of(emps, 8);
		return JsonMessage.success().add("page", page);
	}
	
	@GetMapping("/addEmpPage")
	public JsonMessage addEmpPage() {
		List<Department> deptList = departmentService.findAll();
		List<Job> jobList = jobService.findAll();
		if(deptList != null && deptList.size() > 0 && jobList != null && jobList.size() > 0) {
			return JsonMessage.success().add("deptList", deptList).add("jobList", jobList);
		}else {
			return JsonMessage.fail();
		}
	}
	
	// 虽然我们只需要那么邮箱，但是最好封装成 Employee 对象，因为Hibernate-validator 只能对 bean 进行校验
	// 如果我们没有封装成 bean 对象的话，那我们还得自己写一遍校验规则
	@GetMapping("/checkEmail")
	public JsonMessage checkEmail(@Validated(EmailOnlyValidation.class) Employee emp, BindingResult bindingResult) {
		if(bindingResult.hasFieldErrors("email")) {
			return JsonMessage.fail().add("msg", bindingResult.getFieldError("email").getDefaultMessage());
		}else {
			boolean result = employeeService.checkEmail(emp);
			if(result) {
				return JsonMessage.fail().add("msg", "此邮箱已经存在，请确认是否已经添加过该员工！");
			}else {
				return JsonMessage.success().add("msg", "该邮箱可以使用");
			}
		}
	}
	
	// 虽然理论上我们通过 post 请求，就可以确定是添加用户了，但是感觉还是使用  addEmp 会更清楚一些
	@PostMapping("/addEmp")
	public JsonMessage addEmp(@Validated(InsertValidation.class)Employee employee, BindingResult bindingResult) {
		if(bindingResult.hasFieldErrors()) {
			JsonMessage msg = JsonMessage.fail();
			// 获取所有的参数校验结果
			List<FieldError> errors = bindingResult.getFieldErrors();
			// 如果参数校验失败中，有因为日期格式转换失败的，那么我们就创建一个新的  fieldError 对象来替换
			// 其他的数字类型、布尔类型、枚举类型也可能出现类型转换失败，所以我们如果要细致的话，应该封装个工具类来处理这些错误信息
			// 这个 errors 集合是个不可修改的集合，也不能复制，所以我们是无法用新对象去替换旧对象的
			// 如果我们想要替换的话，只能在工具类里面遍历集合，然后一个一个复制到新的集合里，再然后替换那些类型转换失败的错误信息
			// 【思考】 为什么不直接使用 properties 资源文件去配置错误信息？ 因为这里演示的是前后端分离，不能使用 spring标签和jstl 标签！
			//        你必须在服务端把数据处理好，再用json 发给前台
			// 这里我们就不处理了，搞个日期演示一下就好了
			FieldError fieldError = bindingResult.getFieldError("hireDate");
			if(fieldError != null && fieldError.getCode().equals("typeMismatch")) {
				FieldError newFieldError = new FieldError(fieldError.getObjectName(),
														  fieldError.getField(), 
														  "日期类型转换失败，请输入这种类型的日期格式：2019-1-1");
				msg.add("dateError", newFieldError);
			}
			
			return msg.add("errors", errors);
		}else {
			int result = employeeService.saveEmp(employee);
			if(result == 1) {
				return JsonMessage.success();
			}else {
				return JsonMessage.fail();
			}
		}
	}
	
	@GetMapping("/updateEmpPage")
	public JsonMessage updateEmpPage(@RequestParam(name="employeeId") Integer employeeId) {
		Employee emp = employeeService.selectById(employeeId);
		List<Department> deptList = departmentService.findAll();
		List<Job> jobList = jobService.findAll();
		if(emp != null && deptList != null && deptList.size() > 0 && jobList != null && jobList.size() > 0) {
			return JsonMessage.success().add("emp", emp).add("deptList", deptList).add("jobList", jobList);
		}else {
			return JsonMessage.fail();
		}
	}
	
	@PutMapping("/updateEmp")
	public JsonMessage updateEmp(@Validated(UpdateValidation.class) Employee employee,
			               BindingResult bindingResult, 
			               @RequestParam("pageNum")Integer pageNum) {
		if(bindingResult.hasFieldErrors()) {
			JsonMessage msg = JsonMessage.fail();
			// 获取所有的参数校验结果
			List<FieldError> errors = bindingResult.getFieldErrors();
			FieldError fieldError = bindingResult.getFieldError("hireDate");
			if(fieldError != null && fieldError.getCode().equals("typeMismatch")) {
				FieldError newFieldError = new FieldError(fieldError.getObjectName(),
														  fieldError.getField(), 
														  "日期类型转换失败，请输入这种类型的日期格式：2019-1-1");
				msg.add("dateError", newFieldError);
			}
			
			return msg.add("errors", errors);
		}else {
			int result = employeeService.updateEmpById(employee);
			if(result == 1) {
				return JsonMessage.success().add("pageNum", pageNum);
			}else {
				return JsonMessage.fail();
			}
		}
	}
	
	@DeleteMapping("/deleteEmp")
	public JsonMessage deleteEmp(@RequestParam(name="employeeId") Integer employeeId, @RequestParam("pageNum") Integer pageNum) {
		Integer result = employeeService.deleteById(employeeId);
		if(result == 1) {
			return JsonMessage.success().add("pageNum", pageNum);
		}else {
			return JsonMessage.fail();
		}
	}
	
	@DeleteMapping("/deleteEmps")
	public JsonMessage deleteEmps(@RequestParam(name="empIds") Integer[] empIds,  @RequestParam("pageNum") Integer pageNum) {
		// 正常提交 的话，我们每页只显示 10 条数据，那么最多一次删除十条数据
		// 如果接收到的参数超过 10 条，那么我们就认为是非法参数
		// 其实这样还是不能完全解决非法删除的风险，如果我们的主键使用的是整数、自增，那么
		// 有人就可以很随意地猜到其他记录的主键值，写个脚本，批量去删除你的数据。就算你没有批量删除，一条一条删除也很恐怖
//		if(empIds.length > 10) {
//			return JsonMessage.fail().add(key, value)
//		}
		Integer result = employeeService.deleteByIds(empIds);
		if(result == 0) {
			return JsonMessage.fail().add("msg", "操作失败！ 删除了0条数据");
		}else {
			return JsonMessage.success().add("msg", "选中"+empIds.length+"条，实际删除了" + result + "条数据")
					                    .add("pageNum", pageNum);
		}
	}
}
