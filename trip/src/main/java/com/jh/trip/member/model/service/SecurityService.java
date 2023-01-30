package com.jh.trip.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jh.trip.member.model.dao.MemberRepository;
import com.jh.trip.member.model.vo.Member;


@Service
public class SecurityService implements UserDetailsService{
	
	@Autowired
	private MemberRepository memberRepo;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		Member m = memberRepo.findByUserId(userId);
		if(m == null) throw new UsernameNotFoundException(userId + "을 찾을 수 없습니다.");
		return m;
	}
	

	
}
