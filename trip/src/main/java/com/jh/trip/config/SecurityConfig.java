package com.jh.trip.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Bean
	public AuthenticationProvider authenticationProvider() {
		return new MyProvider();
	}
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain authentiatePath(HttpSecurity http) throws Exception{
		return http.csrf().disable()
				.formLogin()
					.loginPage("/loginPage")
					.loginProcessingUrl("/loginaction")
					.successForwardUrl("/successlogin")
					.usernameParameter("userId")
					.passwordParameter("password")
				.and()
					.authorizeRequests() // 인증 권한 설정 
					.antMatchers("/plannerMember","/plan","/inquiryList","/boardList","/report").hasAnyRole("USER","ADMIN")
		            
					.antMatchers("/","/joinForm","/**","/resources/**").permitAll()
					.anyRequest().authenticated()
				.and()
				.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/successLogout.do")
				.and()
				.authenticationProvider(authenticationProvider())
				
				.build();
	}
	
	

}
