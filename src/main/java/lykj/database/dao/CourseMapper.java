package lykj.database.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import lykj.database.model.Course;

public interface CourseMapper {

	Course findByUsername(String username);

	List<Course> findCourseList1(Map<String, Object> map);
	List<Course> findCourseList2(Map<String, Object> map);
    List<Course> findCourseList(Map<String, Object> map);
	Course findById(int id);

	int addCourse(Course course);

	int updateCourse(Course course);

	int finishCourse(Course course);

	List<Course> teacherSalaryList(Map<String, Object> map);

	BigDecimal teacherBaseSalarySum(Integer tid);
	BigDecimal teacherRewardSum(Integer tid);
	BigDecimal teacherSalarySum(Integer tid);
	
	int updateSalary(Course course);

	Course findByTeacherSalary(Integer id);

	int endSalary(Integer tid);

	int deleteCourse(int id);

	int salaryCount(Map<String, Object> map);

	int teacherCount(Map<String, Object> map);

	int studentCount(Map<String, Object> map);

	int count(Map<String, Object> map);

	

	

}
