package lykj.controller.Admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import lykj.util.PictureVerifyCodeUtil;
import lykj.service.AdminService;
import lykj.database.model.Admin;


@Controller
@RequestMapping("/login")
public class LoginController extends RedisController{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private AdminService adminService;
	
	
	
	/*登录页面*/
	@RequestMapping(value = "/gologin",method = RequestMethod.GET)
	public ModelAndView beforeLogin() {
		ModelAndView mv = new ModelAndView();
		logger.info("user - gologin");
		try {
			mv.setViewName("admin/login");
		}catch (Exception e) {
			logger.error("登录错误",e);
			mv.addObject("error","登录错误"+e);
			mv.setViewName("error");
		}
		return mv;
	}
	
	/*登录操作*/
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView login(String username,String password,String code) {
		ModelAndView mv = new ModelAndView();
		logger.info("admin - login-username="+username);
		logger.info("admin - login-password="+password);
		logger.info("admin - login-code="+code);
		try {
			
            String verifyCode=getRedisData("verifyCode");
            logger.info("admin - login-verifyCode="+verifyCode);
            
            if(StringUtils.isEmpty(username)) {
            	mv.addObject("errmsg", "账号不能为空!");
				mv.setViewName("/admin/login");
				return mv;
            }
            if (StringUtils.isEmpty(password)) {
				mv.addObject("errmsg", "密码不能为空!");
				mv.setViewName("/admin/login");
				return mv;
			}
            if (StringUtils.isEmpty(verifyCode) || StringUtils.isEmpty(code) || !verifyCode.equals(code)) {
				mv.addObject("errmsg", "验证码不正确!");
				mv.setViewName("/admin/login");
				return mv;
			}
            
			mv.setViewName("admin/main");
		}catch (Exception e) {
			logger.error("登录错误",e);
			mv.addObject("error","登录错误"+e);
			mv.setViewName("error");
		}
		
		Admin admin=adminService.findByUsername(username);
		if(admin==null){
			mv.addObject("errmsg", "管理员未注册!");
			mv.setViewName("/admin/login");
			return mv;
		}else {
			String adminPassword = admin.getPassword();
			logger.info("admin - login-adminPassword="+adminPassword);
			password=DigestUtils.md5Hex(password);
			if(adminPassword.equals(password)) {
				logger.info("admin - login-userPassword=true");
				setRedisData("admin", JSON.toJSONString(admin));
				mv.addObject("admin", admin);
				mv.setViewName("/admin/main");
		}else {
			logger.info("admin - login-userPassword=flase");
			mv.addObject("errmsg", "管理员密码不正确!");
			mv.setViewName("/admin/login");
			return mv;
		    }
		}
		return mv;
	}
	
	@RequestMapping(value="/imageCode", method=RequestMethod.GET)
	@ResponseBody
	public void getVerifyCode(HttpServletResponse httpResponse,HttpServletRequest request) {
		try {
			// 设置httpResponse
			httpResponse.setHeader("Pragma", "No-cache");
			httpResponse.setHeader("Cache-Control", "no-cache");
			httpResponse.setDateHeader("Expires", 0);
			httpResponse.setContentType("image/jpeg");
			//生成随机字串
			String verifyCode ="";
			verifyCode=PictureVerifyCodeUtil.generateVerifyCode(4);
			logger.info("getVerifyCode -  verifyCode:" + verifyCode);
			verifyCode = verifyCode.toLowerCase();
			//生成随机数字串

			setRedisData("verifyCode",verifyCode);
			logger.info("getVerifyCode2 -  verifyCode:" + verifyCode);
			//生成图片
			int w = 85, h = 35;
			PictureVerifyCodeUtil.outputImage(w, h, httpResponse.getOutputStream(), verifyCode);
		} catch (Exception e) {
			logger.error("getVerifyCode - error:" , e);
		}
	}
	

}
	