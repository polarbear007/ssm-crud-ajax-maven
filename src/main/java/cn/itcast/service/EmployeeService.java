package cn.itcast.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.entity.Employee;
import cn.itcast.entity.EmployeeExample;
import cn.itcast.mapper.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;

	public List<Employee> findAll() {
		return employeeMapper.findAllWithDeptNameAndJobTitle();
	}
	
	@Transactional
	public Integer saveEmp(Employee employee) {
		return employeeMapper.insertSelective(employee);
	}

	public Employee selectById(Integer employeeId) {
		return employeeMapper.selectByPrimaryKey(employeeId);
	}

	@Transactional
	public Integer  updateEmpById(Employee employee) {
		return employeeMapper.updateByPrimaryKeySelective(employee);
	}
	
	@Transactional
	public Integer deleteById(Integer employeeId) {
		 return employeeMapper.deleteByPrimaryKey(employeeId);
	}

	public boolean checkEmail(Employee emp) {
		EmployeeExample example = new EmployeeExample();
		example.createCriteria().andEmailEqualTo(emp.getEmail());
		return employeeMapper.countByExample(example) > 0 ;
	}

	// 演示一下如果我们要删除的数据被锁住了，要怎么处理
	// 设置一下 timeout ,如果超过某个值，spring 会帮我们抛异常
	@Transactional(timeout=3)
	public Integer deleteByIds(Integer[] empIds) {
		try {
			return employeeMapper.batchDeleteByIds(empIds);
		}catch(Exception e ) {
			return 0;
		}
	}
}
