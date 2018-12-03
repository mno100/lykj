package lykj.controller.Admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lykj.database.model.Student;
import lykj.service.StudentService;

@Controller
@RequestMapping("/")
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private StudentService studentService;
	
	/*添加学生信息*/
	@RequestMapping(value="/studentAdd",method = RequestMethod.POST)
	public ModelAndView studentAdd(Student student) {
		ModelAndView mv = new ModelAndView();
		try {
			if(student ==null) {
				mv.addObject("errmsg", student);
				mv.setViewName("redirect:/index.jsp");
				return mv;
			}
			studentService.addStudent(student);
			logger.info(" studentAdd:"+student);
			mv.setViewName("redirect:/index.jsp");
		} catch (Exception e) {
			logger.error("跳转错误",e);
			mv.addObject("error","错误原因:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
}
