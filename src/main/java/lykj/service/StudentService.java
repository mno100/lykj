package lykj.service;

import java.util.List;
import java.util.Map;

import lykj.util.Page;
import lykj.database.model.Student;

public interface StudentService {

	public List<Student> findStudentList(Page page,Map<String, Object> map);

	public Student findByid(int id);

	public int addStudent(Student student);

	public int updateStudent(Student student);

	public int decideStudent(Student student);

	public int deleteStudent(int id);

}
