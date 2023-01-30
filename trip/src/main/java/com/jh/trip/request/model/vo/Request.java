package com.jh.trip.request.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_reqno", sequenceName = "seq_reqno", allocationSize = 1)
public class Request {
	
	@Id
	@GeneratedValue(generator = "seq_reqno", strategy = GenerationType.SEQUENCE)
	private int reqNo;
	
	private String memberId; // 요청자 아이디
	
	private String plannerId; // 플래너 아이디
	
	private String requestTitle; // 요청 제목
	private String requestContent; // 요청 내용
	
	private String startDay; // 여행 첫날
	private String endDay;  // 여행 마지막 날
	private String transport;  // 교통 수단
	private String theme;  // 테마
	
	@Column(columnDefinition = "varchar2(50) default 'N' not null ")
	private String approval;  // 요청 수락 여부
	
	@Column(name="reqDate", columnDefinition = "date default sysdate not null" )
	@Temporal(TemporalType.DATE)
	private Date reqDate;  // 요청일
	
	
	
	public void prepersist() {
		this.approval=this.approval==null?"N":this.approval;
		this.reqDate=this.reqDate==null?new Date():this.reqDate;
	}
	
	
	
	
	

}
