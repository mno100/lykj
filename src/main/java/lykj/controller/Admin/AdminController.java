package lykj.controller.Admin;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/admin")
public class AdminController extends RedisController{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	

	
	/*主页*/
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		logger.info("admin - index");
		try {
			mv.setViewName("/admin/main");
		}catch (Exception e) {
			logger.error("跳转主页错误",e);
			mv.addObject("error","跳转主页错误："+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*退出登录*/
	@RequestMapping(value="/exit",method = RequestMethod.GET)
	public ModelAndView exit() {
		ModelAndView mv = new ModelAndView();
		try {
			delRedisData("admin");
			mv.setViewName("admin/login");
		} catch (Exception e) {
			logger.error("退出登录错误",e);
			mv.addObject("error","退出登录错误:"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	

}
	