package com.jh.trip.member.model.service;

import java.util.List;
import java.util.Map;

import com.jh.trip.member.model.vo.Member;

public interface MemberService {
	
	//회원가입 
	Member join(Member member);
	
	Member getData(String userId);
	
	// 해당 회원 정보 가져오기
	Member selectMember(String userId);
	
	// 회원 정보 수정
	int updateMember(Member m);
	
	// 회원 리스트
	List<Member> memberList(Map param);
	
	int memberCount();
	
	// 승급
	int upgrade(Member m);
	
	// 강등
	int downGrade(Member m);
	
	// 일반 회원 리스트
	List<Member> normalMember(Map param,String grade);
	
	int normalmemberCount(String grade);
	
	// 플래너 회원 리스트
	List<Member> plannerMember(Map param, String grade);
	
	int plannermemberCount(String grade);
	
	// 대도시로 검색
	List<Member> searchMemberCity(Map param, String keyword);
	int searchMemberCityCount(String keyword);
	
	// 소도시로 검색
	List<Member> searchMemberCountry(Map param, String keyword);
	int searchMemberCountryCount(String keyword);
	// 이메일로 검색
	List<Member> searchMemberEmail(Map param, String keyword);
	int searchMemberEmailCount(String keyword);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
