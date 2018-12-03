package lykj.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import lykj.database.model.Course;
import lykj.util.Page;


public interface CourseService {

	public List<Course> findCourseList1(Page page,Map<String, Object> map);
	public List<Course> findCourseList2(Page page,Map<String, Object> map);
	public List<Course> findCourseList(Page page, Map<String, Object> map);
	
	public int addCourse(Course course);
	public Course findByid(int id);
	public int finishCourse(Course course);
	public Course findByTeacherSalary(Integer id);
	public List<Course> teacherSalaryList(Page page,Map<String, Object> map);
	
	public BigDecimal teacherBaseSalarySum(Integer tid);
	public BigDecimal teacherRewardSum(Integer tid);
	public BigDecimal teacherSalarySum(Integer tid);
	
	public int updateSalary(Course course);
	public int updateCourse(Course course);
	
	public int endSalary(Integer tid);
	public int deleteCourse(int id);
	

	
	


}
