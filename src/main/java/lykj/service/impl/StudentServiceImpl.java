package lykj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lykj.util.Page;
import lykj.service.StudentService;
import lykj.database.dao.StudentMapper;
import lykj.database.model.Student;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	

	
	@Override
	public List<Student> findStudentList(Page page,Map<String, Object> map){
		long count=studentMapper.selectStudentCount(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return studentMapper.findStudentList(map);
	}
	
	@Override
	public Student findByid(int id) {
		return studentMapper.findById(id);
	}
	
	@Override
	public int addStudent(Student student) {
		return studentMapper.addStudent(student);
	}
	
	@Override
	public int updateStudent(Student student) {
		return studentMapper.updateStudent(student);
	}
	
	@Override
	public int decideStudent(Student student) {
		return studentMapper.decideStudent(student);
	}
	
	@Override
	public int deleteStudent(int id) {
		return studentMapper.deleteStudent(id);
	}
}
