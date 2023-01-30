package com.jh.trip.member.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.member.model.vo.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member,String>{

	Member save(Member member);
	
	Member findByUserId(String userId);
}
 