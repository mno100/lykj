package lykj.database.dao;

import java.util.List;
import java.util.Map;

import lykj.database.model.Student;

public interface StudentMapper {

	Student findByUsername(String username);

	List<Student> findStudentList(Map<String, Object> map);

	Student findById(int id);

	int addStudent(Student student);

	int updateStudent(Student student);

	int decideStudent(Student student);

	int selectStudentCount(Map<String, Object> map);

	int deleteStudent(int id);
	

}
