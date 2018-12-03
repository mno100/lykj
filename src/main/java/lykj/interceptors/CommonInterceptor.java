package lykj.interceptors;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.alibaba.fastjson.JSON;
import lykj.database.model.Admin;
  
/** 
 * 拦截器
 * @author 徐景煜
 * 2018-10-18 
 */  

public class CommonInterceptor extends HandlerInterceptorAdapter{  
    private final Logger log = LoggerFactory.getLogger(CommonInterceptor.class);  
    public static final String LAST_PAGE = "lykj.interceptors";
    @Autowired
	protected RedisTemplate<String, String> redisTemplate;

       /*取值*/
	protected String getRedisData(String key) {
		String rds = null;
		if(StringUtils.isNotEmpty(key)){
			rds= redisTemplate.opsForValue().get(key);
			if(StringUtils.isEmpty(rds)){
				rds = null;
			}
		}else{
			rds = null;
		}
		return rds;
	}
	
    /*设值*/
	protected void setRedisData(String key, String value) {
		if(StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(value)){
			redisTemplate.opsForValue().set(key, value);
			redisTemplate.expire(key, 40, TimeUnit.MINUTES);
		}
	}
  
    /**  
     * 在业务处理器处理请求之前被调用  
     * 如果返回false  
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 
     * 如果返回true  
     *    执行下一个拦截器,直到所有的拦截器都执行完毕  
     *    再执行被拦截的Controller  
     *    然后进入拦截器链,  
     *    从最后一个拦截器往回执行所有的postHandle()  
     *    接着再从最后一个拦截器往回执行所有的afterCompletion()  
     */    
	
    @Override    
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {    

        //==============拦截执行 第一步================ 
        String requestUri = request.getRequestURI();         
        log.info("requestUri:"+requestUri); 
        
        String admin = getRedisData("admin");   
        if(admin == null){ 
            log.info("Interceptor：跳转到login页面！");
            request.getRequestDispatcher("/WEB-INF/view/admin/login.jsp").forward(request, response);  
            return false;  
        }else{
        	setRedisData("admin", admin);
        	return true; 	
        }
                
    }    
    
    /** 
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作    
     * 可在modelAndView中加入数据，比如当前时间 
     */  
    @Override    
    public void postHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {     
        //==============admin拦截执行 第二步 postHandle================
        if(modelAndView != null){  
        	String adminstr=getRedisData("admin");
            Admin admin=JSON.parseObject(adminstr, Admin.class);
            modelAndView.addObject("admin",admin);
        }    
    }    
    
    /**  
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等   
     *   
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()  
     */    
    @Override    
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)    
            throws Exception {    
        	//==============admin拦截执行 第三步 afterCompletion================;    
    }    
  
} 
