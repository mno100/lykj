package lykj.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lykj.service.CourseService;
import lykj.util.Page;
import lykj.database.dao.CourseMapper;
import lykj.database.model.Course;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseMapper courseMapper;
	
	@Override
	public List<Course> findCourseList1(Page page,Map<String, Object> map){
		int count = courseMapper.teacherCount(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return courseMapper.findCourseList1(map);
	}
	
	@Override
	public List<Course> findCourseList2(Page page,Map<String, Object> map){
		int count = courseMapper.studentCount(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return courseMapper.findCourseList2(map);
	}
	
	public List<Course> findCourseList(Page page, Map<String, Object> map){
		int count = courseMapper.count(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return courseMapper.findCourseList(map);
	}
	@Override
	public int addCourse(Course course) {
		return courseMapper.addCourse(course);
	}
	
	@Override
	public Course findByid(int id) {
		return courseMapper.findById(id);
	}
	
	@Override
	public int finishCourse(Course course) {
		return courseMapper.finishCourse(course);
	}

	@Override
	public List<Course> teacherSalaryList(Page page,Map<String, Object> map){
		int count = courseMapper.salaryCount(map);
		page.setTotalCount(count);
		map.put("startRow", page.getStartRow());
		map.put("pageSize", page.getPageSize());
		return courseMapper.teacherSalaryList(map);
	}
	
	@Override
	public BigDecimal teacherBaseSalarySum(Integer tid) {
		return courseMapper.teacherBaseSalarySum(tid);
	}
	
	@Override
	public int updateSalary(Course course) {
		return courseMapper.updateSalary(course);
	}
	
	@Override
	public int updateCourse(Course course) {
		return courseMapper.updateCourse(course);
	}
	
	@Override
	public Course findByTeacherSalary(Integer id) {
		return courseMapper.findByTeacherSalary(id);
	}
	
	@Override
	public BigDecimal teacherRewardSum(Integer tid) {
		return courseMapper.teacherRewardSum(tid);
	}
	
	@Override
	public BigDecimal teacherSalarySum(Integer tid) {
		return courseMapper.teacherSalarySum(tid);
	}
	
	@Override
	public int endSalary(Integer tid) {
		return courseMapper.endSalary(tid);
	}
	
	@Override
	public int deleteCourse(int id) {
		return courseMapper.deleteCourse(id);
	}
}
