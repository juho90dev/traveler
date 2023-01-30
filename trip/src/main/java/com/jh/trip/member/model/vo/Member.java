package com.jh.trip.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Member implements UserDetails{
	/**
	 * 
	 */
	private static final long serialVersionUID = -166710625843363616L;

	@Id
	@Column(name = "userid")
	private String userId;//아이디
	
	private String email; //이메일
	private String password; //비밀번호
	private String phone; //휴대폰
	
	@Column(columnDefinition = "varchar2(100) default '서울' not null ")
	private String city; //대도시
	@Column(columnDefinition = "varchar2(100) default '강남구' not null ")
	private String country; //소도시
	private String image; //이미지
	@Column(columnDefinition = "number(10) default 0 not null ")
	private int avgscore; //평점
	@Column(columnDefinition = "varchar2(100) default '일반' not null ")
	private String grade; // 등급
	private String introduce; //자기소개
	
	@Column(name="enrollDate", columnDefinition = "date default sysdate not null " )
	@Temporal(TemporalType.DATE)
	private Date enrollDate; //가입일
	
	@Column(columnDefinition = "varchar2(50) default 'n' not null ")
	private String pay;//결제 
	
	@PrePersist
	public void prepersist() {
		this.city=this.city==null?"서울":this.city;
		this.country=this.country==null?"강남":this.country;
		this.grade=this.grade==null?"일반":this.city;
		this.pay=this.pay==null?"N":this.pay;
		this.enrollDate=this.enrollDate==null?new Date():this.enrollDate;
		
		
		
		
	
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//계정 권한목록을 리턴
		// TODO Auto-generated method stub
		List<GrantedAuthority> auth = new ArrayList();
		auth.add(new SimpleGrantedAuthority("ROLE_USER"));
		return auth;
	}


	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userId;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}




}
