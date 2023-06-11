package com.java5.Asm.Config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.java5.Asm.Controller.RequestCountInterceptorController;

@Configuration
public class WebConfig implements WebMvcConfigurer  {

	  @Autowired
	    private RequestCountInterceptorController accessCounterInterceptor;

	    @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        // Đăng ký Interceptor
	        registry.addInterceptor(accessCounterInterceptor);
	    }
}
