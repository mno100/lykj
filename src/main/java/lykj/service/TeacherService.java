package lykj.service;

import java.util.List;
import java.util.Map;

import lykj.database.model.Teacher;
import lykj.util.Page;

public interface TeacherService {

	
	public List<Teacher> findTeacherList(Page page,Map<String, Object> map);

	public Teacher findByid(int id);

	public int addTeacher(Teacher teacher);

	public int updateTeacher(Teacher teacher);

	public int decideTeacher(Teacher teacher);

	public int deleteTeacher(int id);

}
