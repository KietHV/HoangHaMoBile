package com.java5.Asm.Config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

//	@Bean
//	public AuthenticationProvider authenticationProvider() {
//		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
//		authenticationProvider.setUserDetailsService(userDetailsService);
//		authenticationProvider.setPasswordEncoder(passwordEncoder());
//		return authenticationProvider;
//	}

	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
				.antMatchers("/", "/hoanghamobile/login", "/error", "/hoanghamobile/**").permitAll().anyRequest()
				.authenticated().and().formLogin().loginPage("/hoanghamobile/login").usernameParameter("email")
				.defaultSuccessUrl("/hoanghamobile/").permitAll().and().logout().invalidateHttpSession(true)
				.clearAuthentication(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/hoanghamobile/").and().httpBasic(); // Add this line if you want to enable basic
																		// authentication
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		return http.build();
	}
}
