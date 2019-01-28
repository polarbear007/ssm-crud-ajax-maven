package cn.itcast.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.entity.Employee;
import cn.itcast.entity.EmployeeExample;


public interface EmployeeMapper {
    int countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer employeeId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer employeeId);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    // 连同关联部门和工种对象一起查询
    List<Employee> findAllWithDeptNameAndJobTitle();
    
    // 根据 id 批量删除 
    int batchDeleteByIds(Integer[] empIds);
}