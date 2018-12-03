package lykj.controller.Admin;

import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;


@Controller
public class RedisController {
	
	@Autowired
	protected RedisTemplate<String,String> redisTemplate;
	
	protected static long pageSize = 10;
	protected static final int EXPIRETIME = 40;//缓存时间
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
	protected void setRedisData(String key,String value) {
		if (StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(value)) {
			redisTemplate.opsForValue().set(key, value);
			redisTemplate.expire(key,EXPIRETIME,TimeUnit.MINUTES);
		}
	}
	
	
	protected String getRedisData(String key) {
		String x =null;
		if(StringUtils.isNotEmpty(key)) {
			x = redisTemplate.opsForValue().get(key);
			}
		return x;
	}
	
	
	protected void delRedisData(String key){
		redisTemplate.delete(key);
	}
}
