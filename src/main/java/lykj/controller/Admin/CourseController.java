package lykj.controller.Admin;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lykj.database.model.Course;

import lykj.service.CourseService;
import lykj.util.Page;

@Controller
@RequestMapping("/admin")
public class CourseController extends RedisController{
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	@Autowired
	private CourseService courseService;
	
	/*课程列表*/
	@RequestMapping(value="/courseList",method = RequestMethod.GET)
	public ModelAndView teacherList() {
		ModelAndView mv = new ModelAndView();
		try {
			Page page = new Page();
			Map<String,Object> map = new HashMap<String,Object>();
			List<Course> list = courseService.findCourseList(page,map);
			mv.setViewName("/admin/courseList");
			mv.addObject("page", page);
			mv.addObject("list",list);
		} catch (Exception e) {
			logger.error("课程列表显示错误",e);
			mv.addObject("error","课程列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*课程列表(分页)*/
	@RequestMapping(value="/courseList",method = RequestMethod.POST)
	public ModelAndView teacherListPost(@RequestParam(required = false,defaultValue = "1",value="pageIndex") int pageIndex) {
		ModelAndView mv = new ModelAndView();
		try {
			Page page = new Page();
			page.setPageIndex(pageIndex);
			Map<String,Object> map = new HashMap<String,Object>();
		
			List<Course> list = courseService.findCourseList(page,map);
			mv.setViewName("/admin/courseList");
			mv.addObject("page", page);
			mv.addObject("list",list);
		} catch (Exception e) {
			logger.error("课程列表显示错误",e);
			mv.addObject("error","课程列表显示错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*课程添加跳转*/
	@RequestMapping(value = "/goCourseAdd" ,method = RequestMethod.GET)
	public ModelAndView goCourseAdd(Integer tid) {
		ModelAndView mv = new ModelAndView();
		try {
				mv.setViewName("admin/courseAdd");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*课程添加*/
	@RequestMapping(value = "/courseAdd" ,method = RequestMethod.POST)
	public ModelAndView courseAdd(Course course,String starttime,String endtime) {
		ModelAndView mv = new ModelAndView();
		try {
			if(course ==null) {
				mv.addObject("errmsg", course);
				mv.setViewName("admin/courseAdd");
				return mv;
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			Date one = df.parse(starttime);
			logger.info("admin - one:"+one);
			course.setStart(one);
			Date two = df.parse(endtime);
			logger.info("admin - two:"+two);
			course.setEnd(two);
			courseService.addCourse(course);
			logger.info("admin - courseAdd:"+course);
			mv.setViewName("redirect:/admin/courseList");
		} catch (Exception e) {
			logger.error("添加错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*课程修改跳转*/
	@RequestMapping(value = "/goCourseUpdate" ,method = RequestMethod.GET)
	public ModelAndView goCourseUpdate(Integer id) {
		ModelAndView mv = new ModelAndView();
		try {
			logger.info("course - id :"+id);
			Course course =	courseService.findByid(id);
			mv.addObject("course",course);
			mv.setViewName("admin/courseUpdate");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*课程修改*/
	@RequestMapping(value = "/courseUpdate" ,method = RequestMethod.POST)
	public ModelAndView courseUpdate(Course course,String starttime,String endtime) {
		ModelAndView mv = new ModelAndView();
		try {
			if(course ==null) {
				mv.addObject("errmsg", course);
				mv.setViewName("admin/courseAdd");
				return mv;
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			Date one = df.parse(starttime);
			logger.info("admin - one:"+one);
			course.setStart(one);
			Date two = df.parse(endtime);
			logger.info("admin - two:"+two);
			course.setEnd(two);
			courseService.updateCourse(course);
			logger.info("admin - courseAdd:"+course);
			mv.setViewName("redirect:/admin/courseList");
		} catch (Exception e) {
			logger.error("修改错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	/*删除课程*/
	@RequestMapping(value = "/courseDel" ,method = RequestMethod.GET)
	public ModelAndView courseDel(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			    courseService.deleteCourse(id);
				mv.setViewName("redirect:/admin/courseList");
		} catch (Exception e) {
			logger.error("删除错误",e);
			mv.addObject("error","错误原因："+e);
			mv.setViewName("error");
		}
		return mv;
	}
}
