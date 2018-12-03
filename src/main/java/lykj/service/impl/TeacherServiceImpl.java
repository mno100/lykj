package lykj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lykj.service.TeacherService;
import lykj.util.Page;
import lykj.database.dao.TeacherMapper;
import lykj.database.model.Teacher;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper teacherMapper;
	

	@Override
	public List<Teacher> findTeacherList(Page page,Map<String, Object> map){
		int count = teacherMapper.teacherCount(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return teacherMapper.findTeacherList(map);
	}
	
	@Override
	public Teacher findByid(int id) {
		return teacherMapper.findById(id);
	}
	
	@Override
	public int addTeacher(Teacher teacher) {
		return teacherMapper.addTeacher(teacher);
	}
	
	@Override
	public int updateTeacher(Teacher teacher) {
		return teacherMapper.updateTeacher(teacher);
	}
	
	@Override
	public int decideTeacher(Teacher teacher) {
		return teacherMapper.decideTeacher(teacher);
	}
	
	@Override
	public int deleteTeacher(int id) {
		return teacherMapper.deleteTeacher(id);
	}
	
}
