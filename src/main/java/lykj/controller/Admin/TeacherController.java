package lykj.controller.Admin;



import java.math.BigDecimal;
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


import lykj.service.CourseService;
import lykj.service.TeacherService;
import lykj.util.Page;
import lykj.database.model.Course;
import lykj.database.model.Teacher;


@Controller
@RequestMapping("/admin")
public class TeacherController extends RedisController{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	

	@Autowired
	private TeacherService teacherService;
	@Autowired
	private CourseService courseService;
	
	/*教师列表*/
	@RequestMapping(value="/teacherList",method = RequestMethod.GET)
	public ModelAndView teacherList() {
		ModelAndView mv = new ModelAndView();
		try {
			Page page = new Page();
			Map<String,Object> map = new HashMap<String,Object>();
			List<Teacher> list = teacherService.findTeacherList(page,map);
			mv.setViewName("/admin/teacherList");
			mv.addObject("page", page);
			mv.addObject("list",list);
		} catch (Exception e) {
			logger.error("教师列表显示错误",e);
			mv.addObject("error","教师列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*教师列表(分页)*/
	@RequestMapping(value="/teacherList",method = RequestMethod.POST)
	public ModelAndView teacherListPost(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex,
			@RequestParam(required = false,value="name")String name) {
		ModelAndView mv = new ModelAndView();
		try {
			Page page = new Page();
			page.setPageIndex(pageIndex);
			Map<String,Object> map = new HashMap<String,Object>();
			if(StringUtils.isNotEmpty(name)){
				map.put("name", name);
				mv.addObject("name",name);  }
			List<Teacher> list = teacherService.findTeacherList(page,map);
			mv.setViewName("/admin/teacherList");
			mv.addObject("page", page);
			mv.addObject("list",list);
		} catch (Exception e) {
			logger.error("教师列表显示错误",e);
			mv.addObject("error","教师列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	/*查看教师信息*/
	@RequestMapping(value="/teacherInfo",method = RequestMethod.GET)
	public ModelAndView teacherInfo(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			Teacher teacher = new Teacher();
			teacher = teacherService.findByid(id);
			mv.addObject("teacher", teacher);
			mv.setViewName("/admin/teacherInfo");
			
		} catch (Exception e) {
			logger.error("教师信息错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*跳转添加教师信息*/
	@RequestMapping(value="/goTeacherAdd",method = RequestMethod.GET)
	public ModelAndView goTeacherAdd() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/admin/teacherAdd");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*添加教师信息*/
	@RequestMapping(value="/teacherAdd",method = RequestMethod.POST)
	public ModelAndView teacherAdd(Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		try {
			if(teacher ==null) {
				mv.addObject("errmsg", teacher);
				mv.setViewName("admin/teacherAdd");
				return mv;
			}
			teacherService.addTeacher(teacher);
			logger.info("admin - teacherAdd:"+teacher);
			mv.setViewName("redirect:/admin/teacherList");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*跳转修改教师信息*/
	@RequestMapping(value="/goTeacherUpdate",method = RequestMethod.GET)
	public ModelAndView goTeacherUpdate(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			Teacher teacher = teacherService.findByid(id);
			mv.addObject("teacher", teacher);
			mv.setViewName("/admin/teacherUpdate");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	/*修改教师信息*/
	@RequestMapping(value="/teacherUpdate",method = RequestMethod.POST)
	public ModelAndView teacherUpdate(Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		try {
			
			teacherService.updateTeacher(teacher);
			logger.info("admin - teacherUpdate:"+teacher);
			mv.setViewName("redirect:/admin/teacherList");
		} catch (Exception e) {
			logger.error("修改错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*教师离开*/
	@RequestMapping(value = "/teacherGo" ,method = RequestMethod.GET)
	public ModelAndView teacherGo(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    Teacher teacher = teacherService.findByid(id);
			    teacher.setDecide(1);
				teacherService.decideTeacher(teacher);
				mv.setViewName("redirect:/admin/teacherList");
		} catch (Exception e) {
			logger.error("退学错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*教师回归*/
	@RequestMapping(value = "/teacherBack" ,method = RequestMethod.GET)
	public ModelAndView teacherBack(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    Teacher teacher = teacherService.findByid(id);
			    teacher.setDecide(0);
				teacherService.decideTeacher(teacher);
				mv.setViewName("redirect:/admin/teacherList");
		} catch (Exception e) {
			logger.error("退学错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*删除教师*/
	@RequestMapping(value = "/teacherDel" ,method = RequestMethod.GET)
	public ModelAndView teacherDel(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    
			    teacherService.deleteTeacher(id);
				mv.setViewName("redirect:/admin/teacherList");
		} catch (Exception e) {
			logger.error("删除错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*教师课程安排*/
	@RequestMapping(value = "/teacherCourse" ,method = RequestMethod.GET)
	public ModelAndView teacherCourse(Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("teacher - tid:"+tid);
			Page page = new Page();	
			if(tid != null) {
				logger.info("teacher - tid:"+tid);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("tid", tid);
				List<Course> list = courseService.findCourseList2(page,map);
				mv.addObject("list", list);
				mv.addObject("page", page);
				mv.addObject("tid", tid);
			}
				mv.setViewName("admin/teacherCourse");
		} catch (Exception e) {
			logger.error("课程显示错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*教师课程安排(分页)*/
	@RequestMapping(value = "/teacherCourse" ,method = RequestMethod.POST)
	public ModelAndView teacherCourse(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex,Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("teacher - tid:"+tid);
			Page page = new Page();
			page.setPageIndex(pageIndex);
			if(tid != null) {
				logger.info("teacher - tid:"+tid);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("tid", tid);
				List<Course> list = courseService.findCourseList2(page,map);
				mv.addObject("list", list);
				mv.addObject("page", page);
				mv.addObject("tid", tid);
			}
				mv.setViewName("admin/teacherCourse");
		} catch (Exception e) {
			logger.error("课程显示错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	

	

	
	/*改为已上课*/
	@RequestMapping(value = "/courseFinish" ,method = RequestMethod.GET)
	public ModelAndView courseFinish(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			
			    Course course = courseService.findByid(id);
			    course.setFinish(1);
				courseService.finishCourse(course);
				int tid = course.getTid();
				mv.addObject("tid", tid);
				mv.setViewName("redirect:/admin/teacherCourse?tid={tid}");
		} catch (Exception e) {
			logger.error("上课错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*改为未上课*/
	@RequestMapping(value = "/courseNotFinish" ,method = RequestMethod.GET)
	public ModelAndView courseNotFinish(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    Course course = courseService.findByid(id);
			    course.setFinish(0);
				courseService.finishCourse(course);
				int tid = course.getTid();
				mv.addObject("tid", tid);
				mv.setViewName("redirect:/admin/teacherCourse?tid={tid}");
		} catch (Exception e) {
			logger.error("上课错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	


	/*查看教师工资*/
	@RequestMapping(value="/teacherSalary",method = RequestMethod.GET)
	public ModelAndView teacherSalary(Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("teacher - tid:"+tid);
			Page page = new Page();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("tid", tid);
			List<Course> list = courseService.teacherSalaryList(page,map);
			BigDecimal one = courseService.teacherBaseSalarySum(tid);
			BigDecimal two = courseService.teacherRewardSum(tid);
			BigDecimal total = courseService.teacherSalarySum(tid);
			logger.info("teacher - one:"+one);
			logger.info("teacher - two:"+two);
			logger.info("teacher - total:"+total);
			mv.addObject("list", list);
			mv.addObject("page", page);
			mv.addObject("one", one);
			mv.addObject("two", two);
			mv.addObject("tid", tid);
			mv.addObject("total", total);			
			mv.setViewName("/admin/teacherSalary");			
		} catch (Exception e) {
			logger.error("教师工资错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*查看教师工资(分页)*/
	@RequestMapping(value="/teacherSalary",method = RequestMethod.POST)
	public ModelAndView teacherSalary(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex,
			Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("teacher - tid:"+tid);
			Page page = new Page();
			page.setPageIndex(pageIndex);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("tid", tid);
			List<Course> list = courseService.teacherSalaryList(page,map);
			BigDecimal one = courseService.teacherBaseSalarySum(tid);
			BigDecimal two = courseService.teacherRewardSum(tid);
			BigDecimal total = courseService.teacherSalarySum(tid);
			logger.info("teacher - one:"+one);
			logger.info("teacher - two:"+two);
			logger.info("teacher - total:"+total);
			mv.addObject("list", list);
			mv.addObject("page", page);
			mv.addObject("one", one);
			mv.addObject("two", two);
			mv.addObject("tid", tid);
			mv.addObject("total", total);			
			mv.setViewName("/admin/teacherSalary");
			
		} catch (Exception e) {
			logger.error("教师工资错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*跳转修改教师工资页面*/
	@RequestMapping(value="/goSalaryUpdate",method=RequestMethod.GET)
		public ModelAndView goSalaryUpdate(Integer id) {
			ModelAndView mv = new ModelAndView();
			logger.info("salary - id :"+id);
			try {
				Course course =	courseService.findByTeacherSalary(id);				
				mv.addObject("course",course);
				mv.setViewName("admin/salaryUpdate");
			} catch (Exception e) {
				logger.error("教师工资错误",e);
				mv.addObject("error","错误原因:"+e);
				mv.setViewName("error");
			}
			return mv;
	}
	/*修改教师工资*/
	@RequestMapping(value="/salaryUpdate", method=RequestMethod.POST)
	public ModelAndView updateSalary(Course course) {
		ModelAndView mv = new ModelAndView();
		try {
			
			BigDecimal salary = course.getBasesalary();
			salary = salary.add(course.getReward());
			course.setSalary(salary);
			courseService.updateSalary(course);
			logger.info("salary - course :"+course);
			int tid = course.getTid();
			mv.addObject("tid", tid);
			logger.info("salary - tid :"+tid);
			mv.setViewName("redirect:/admin/teacherSalary?tid={tid}");
		} catch (Exception e) {
			logger.error("教师工资错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*完结工资*/
	@RequestMapping(value="/salaryEnd", method=RequestMethod.GET)
	public ModelAndView salaryEnd(Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
			courseService.endSalary(tid);
			mv.addObject("tid", tid);
			mv.setViewName("redirect:/admin/teacherSalary?tid={tid}");
		} catch (Exception e) {
			logger.error("教师工资错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
}

	