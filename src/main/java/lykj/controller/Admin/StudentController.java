package lykj.controller.Admin;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lykj.util.Page;
import lykj.service.CourseService;
import lykj.service.StudentService;
import lykj.database.model.Course;
import lykj.database.model.Student;


@Controller
@RequestMapping("/admin")
public class StudentController extends RedisController{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private CourseService courseService;
	

	/*学生列表*/
	@RequestMapping(value="/studentList",method = RequestMethod.GET)
	public ModelAndView studentList() {
		ModelAndView mv = new ModelAndView();
		try {
			Page page=new Page();
			Map<String,Object> map = new HashMap<String,Object>();
			List<Student> list = studentService.findStudentList(page,map);
			mv.setViewName("/admin/studentList");
			mv.addObject("list",list);
			mv.addObject("page",page);
		} catch (Exception e) {
			logger.error("学生列表显示错误",e);
			mv.addObject("error","学生列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*学生列表(POST)*/
	@RequestMapping(value="/studentList",method = RequestMethod.POST)
	public ModelAndView studentList(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex,
			@RequestParam(required = false,value="name")String name) {
		ModelAndView mv = new ModelAndView();
		try {
			Page page=new Page();
			page.setPageIndex(pageIndex);
			Map<String,Object> map = new HashMap<String,Object>();
			if(StringUtils.isNotEmpty(name)){
				map.put("name", name);
				mv.addObject("name",name);  }
			List<Student> list = studentService.findStudentList(page,map);
			mv.setViewName("/admin/studentList");
			mv.addObject("list",list);
			mv.addObject("page",page);
		} catch (Exception e) {
			logger.error("学生列表显示错误",e);
			mv.addObject("error","学生列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*查看学生信息*/
	@RequestMapping(value="/studentInfo",method = RequestMethod.GET)
	public ModelAndView studentInfo(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			Student student = new Student();
			student = studentService.findByid(id);
			mv.addObject("student", student);
			mv.setViewName("/admin/studentInfo");
			
		} catch (Exception e) {
			logger.error("学生信息错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*跳转添加学生信息*/
	@RequestMapping(value="/goStudentAdd",method = RequestMethod.GET)
	public ModelAndView goStudentAdd() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/admin/studentAdd");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*添加学生信息*/
	@RequestMapping(value="/studentAdd",method = RequestMethod.POST)
	public ModelAndView studentAdd(Student student) {
		ModelAndView mv = new ModelAndView();
		try {
			if(student ==null) {
				mv.addObject("errmsg", student);
				mv.setViewName("admin/studentAdd");
				return mv;
			}
			studentService.addStudent(student);
			logger.info("admin - studentAdd:"+student);
			mv.setViewName("redirect:/admin/studentList");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*跳转修改学生信息*/
	@RequestMapping(value="/goStudentUpdate",method = RequestMethod.GET)
	public ModelAndView goStudentUpdate(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			Student student = studentService.findByid(id);
			mv.addObject("student", student);
			mv.setViewName("/admin/studentUpdate");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	/*修改学生信息*/
	@RequestMapping(value="/studentUpdate",method = RequestMethod.POST)
	public ModelAndView studentUpdate(Student student) {
		ModelAndView mv = new ModelAndView();
		try {
			
			studentService.updateStudent(student);
			logger.info("admin - studentUpdate:"+student);
			mv.setViewName("redirect:/admin/studentList");
		} catch (Exception e) {
			logger.error("修改错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*学生退学*/
	@RequestMapping(value = "/studentGo" ,method = RequestMethod.GET)
	public ModelAndView studentGo(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    Student student = studentService.findByid(id);
			    student.setDecide(1);
				studentService.decideStudent(student);
				mv.setViewName("redirect:/admin/studentList");
		} catch (Exception e) {
			logger.error("退学错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*学生返学*/
	@RequestMapping(value = "/studentBack" ,method = RequestMethod.GET)
	public ModelAndView studentBack(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    Student student = studentService.findByid(id);
			    student.setDecide(0);
				studentService.decideStudent(student);
				mv.setViewName("redirect:/admin/studentList");
		} catch (Exception e) {
			logger.error("退学错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	/*删除学生*/
	@RequestMapping(value = "/studentDel" ,method = RequestMethod.GET)
	public ModelAndView studentDel(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    
			    studentService.deleteStudent(id);
				mv.setViewName("redirect:/admin/studentList");
		} catch (Exception e) {
			logger.error("删除错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*学生课程安排*/
	@RequestMapping(value = "/studentCourse" ,method = RequestMethod.GET)
	public ModelAndView studentCourse(Integer sid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("student - sid:"+sid);
			Page page = new Page();
			if(sid != null) {
				logger.info("student - sid:"+sid);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("sid", sid);
				List<Course> list = courseService.findCourseList1(page,map);
				mv.addObject("list", list);
				mv.addObject("page",page);
				mv.addObject("sid", sid);
			}
				mv.setViewName("admin/studentCourse");
		} catch (Exception e) {
			logger.error("课程显示错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*学生课程安排(分页)*/
	@RequestMapping(value = "/studentCourse" ,method = RequestMethod.POST)
	public ModelAndView studentCourse(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex,Integer sid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("student - sid:"+sid);
			Page page = new Page();
			page.setPageIndex(pageIndex);
			if(sid != null) {
				logger.info("student - sid:"+sid);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("sid", sid);
				List<Course> list = courseService.findCourseList1(page,map);
				mv.addObject("list", list);
				mv.addObject("page",page);
				mv.addObject("sid", sid);
			}
				mv.setViewName("admin/studentCourse");
		} catch (Exception e) {
			logger.error("课程显示错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
}
	