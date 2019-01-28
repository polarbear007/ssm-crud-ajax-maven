package cn.itcast.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.entity.Job;
import cn.itcast.mapper.JobMapper;

@Service
public class JobService {
	@Autowired
	private JobMapper jobMapper;

	public List<Job> findAll() {
		return jobMapper.selectByExample(null);
	}
}
