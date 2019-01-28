package cn.itcast.test;


import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.itcast.entity.Department;
import cn.itcast.entity.Employee;
import cn.itcast.entity.Job;
import cn.itcast.mapper.DepartmentMapper;
import cn.itcast.mapper.EmployeeMapper;
import cn.itcast.mapper.JobMapper;
import cn.itcast.service.DepartmentService;
import cn.itcast.service.EmployeeService;
import cn.itcast.service.JobService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DataSourceTest {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private JobService jobService;
	
	
	@Test
	public void test() throws SQLException {
		System.out.println(dataSource.getConnection());
	}
	
	@Test
	public void test2() {
		System.out.println(sqlSessionFactory.getClass().getName());
		System.out.println(employeeMapper.getClass().getName());
		System.out.println(jobMapper.getClass().getName());
		System.out.println(departmentMapper.getClass().getName());
	}
	
	@Test
	public void test3() {
		System.out.println(employeeService.getClass().getName());
		System.out.println(departmentService.getClass().getName());
		System.out.println(jobService.getClass().getName());
	}
	
	// 测试一下自定义自定义的关联查询有没有效果
	@Test
	public void test4() {
		List<Employee> list = employeeService.findAll();
		for (Employee employee : list) {
			System.out.println(list);
		}
	}
}
