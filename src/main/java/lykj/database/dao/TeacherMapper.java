package lykj.database.dao;

import java.util.List;
import java.util.Map;

import lykj.database.model.Teacher;

public interface TeacherMapper {

	
	List<Teacher> findTeacherList(Map<String, Object> map);

	Teacher findById(int id);

	int addTeacher(Teacher teacher);

	int updateTeacher(Teacher teacher);

	int decideTeacher(Teacher teacher);

	int deleteTeacher(int id);

	int teacherCount(Map<String, Object> map);

}
