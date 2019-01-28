package cn.itcast.entity;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import cn.itcast.validation.EmailOnlyValidation;
import cn.itcast.validation.InsertValidation;
import cn.itcast.validation.UpdateValidation;

public class Employee implements Serializable{
	private static final long serialVersionUID = -4649227635385877135L;
	@NotNull(message="员工编号不能为空", groups= {UpdateValidation.class})
	private Integer employeeId;
	@NotBlank(message="员工的姓不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    private String firstName;
	@NotBlank(message="员工的名不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    private String lastName;
	@NotBlank(message="邮箱不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    @Email(message="非法邮箱格式", groups= {InsertValidation.class, UpdateValidation.class, EmailOnlyValidation.class})
    private String email;
    @NotBlank(message="电话不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    // 说明一下，这里的电话正则其实很不准，但是只是用于演示参数校验，真正开发再去百度个电话正则
    @Pattern(message="非法电话格式", regexp="^\\d{11}$", groups= {InsertValidation.class, UpdateValidation.class})
    private String phoneNumber;
    @DecimalMin(value="0.0", message="工资不能小于 0.0", groups= {InsertValidation.class, UpdateValidation.class})
    private Double salary;
    
    // 这两个值都是用下拉框选择的，一般不会错的，这里就不再校验了
    // 因为我们在数据库中有设置外键，如果输入的值在另外的两张表中不存在 ，那么会插入失败
    @NotNull(message="部门的值不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    private Integer departmentId;
    @NotBlank(message="工种的值不能为空", groups= {InsertValidation.class, UpdateValidation.class})
    private String jobId;
    
    @DateTimeFormat(iso=ISO.DATE)
    @Past(message="入职的日期不能是未来的日期")
    private Date hireDate;
    
    private Department dept;
    
    private Job job;
    
    public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName == null ? null : firstName.trim();
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }
}