package com.jh.trip.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jh.trip.common.PageBar;
import com.jh.trip.member.model.dao.MemberMapperDao;
import com.jh.trip.member.model.dao.MemberRepository;
import com.jh.trip.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	public MemberServiceImpl(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Autowired
	private MemberMapperDao mmdao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	
	
	//회원가입
	@Override
	public Member join(Member member){
		
		// 여기서 패스워드 암호화 시킨 후 저장.
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		return memberRepository.save(member);
	}
	
	public Member getData(String userId) {
		return null;
	}
	
	// 회원정보 수정
	@Override
	public int updateMember(Member m) {
		m.setPassword(passwordEncoder.encode(m.getPassword()));
		return mmdao.updateMember(session, m);
	}

	
	// 해당 회원 정보 가져오기.
	@Override
    public Member selectMember(String userId) {
		return memberRepository.findByUserId(userId);
	}
	
	public List<Member> selectMembers(){
		return memberRepository.findAll();
	}
	
	// 회원 리스트 
	@Override
	public List<Member> memberList(Map param) {
		return mmdao.memberList(session, param);
	}
	
	@Override
	public int memberCount() {
		return mmdao.memberCount(session);
	}
	
	// 승급
	@Override
	public int upgrade(Member m) {
		return mmdao.upgrade(session, m);
	}
	
	// 강등
	@Override
	public int downGrade(Member m) {
		return mmdao.downGrade(session, m);
	}
	
	// 일반 회원 리스트
	@Override
	public List<Member> normalMember(Map param,String grade) {
		return mmdao.normalMember(session, param, grade);
	}
	@Override
	public int normalmemberCount(String grade){
		return mmdao.normalmemberCount(session, grade);
	}
	// 플래너 회원 리스트
	@Override
	public List<Member> plannerMember(Map param, String grade) {
		return mmdao.plannerMember(session, param, grade);
	}
	@Override
	public int plannermemberCount(String grade) {
		return mmdao.plannermemberCount(session, grade);
	}
	
	// 대도시로 검색
	@Override
	public List<Member> searchMemberCity(Map param, String keyword) {
		return mmdao.searchMemberCity(session, param, keyword);
	}
	@Override
	public int searchMemberCityCount(String keyword) {
		return mmdao.searchMemberCityCount(session, keyword);
	}
	
	// 소도시로 검색
	@Override
	public List<Member> searchMemberCountry(Map param, String keyword) {
		return mmdao.searchMemberCountry(session, param, keyword);
	}
	@Override
	public int searchMemberCountryCount(String keyword) {
		return mmdao.searchMemberCountryCount(session, keyword);
	}
	
	// 이메일로 검색
	@Override
	public List<Member> searchMemberEmail(Map param, String keyword) {
		return mmdao.searchMemberEmail(session, param, keyword);
	}
	@Override
	public int searchMemberEmailCount(String keyword) {
		return mmdao.searchMemberEmailCount(session, keyword);
	}
	
	
}	
