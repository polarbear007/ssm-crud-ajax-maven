package cn.itcast.entity;

import java.io.Serializable;

public class Department implements Serializable{
	private static final long serialVersionUID = -1892240147509865526L;

	private Integer departmentId;

    private String departmentName;

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }
}