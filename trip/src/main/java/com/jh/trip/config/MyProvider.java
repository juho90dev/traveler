package com.jh.trip.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jh.trip.member.model.service.SecurityService;
import com.jh.trip.member.model.vo.Member;

public class MyProvider implements AuthenticationProvider{

	@Autowired
	private SecurityService service;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		// DB데이터에서 인증하는내용을 구성
		String username = authentication.getName();
		String password = (String)authentication.getCredentials();
		Member loginMember = (Member)service.loadUserByUsername(username);
		System.out.println(loginMember.getUserId());
		System.out.println(loginMember.getPassword());
		System.out.println(loginMember);
		if(loginMember == null || !encoder.matches(password, loginMember.getPassword()))
//		if(loginMember == null)
			throw new BadCredentialsException("인증 실패");  		
		return new UsernamePasswordAuthenticationToken(loginMember, 
				loginMember.getPassword(), loginMember.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
	
	
	
}
