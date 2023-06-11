package com.java5.Asm.Controller;



import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class RequestCountInterceptorController implements HandlerInterceptor {
	  private long accessCount = 0;

	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        // Tăng biến đếm khi có yêu cầu truy cập
	        accessCount++;
//	        System.out.println("sl truy cập: "+accessCount);
	        return true;
	    }

	    public long getAccessCount() {
	        return accessCount;
	    }
}





