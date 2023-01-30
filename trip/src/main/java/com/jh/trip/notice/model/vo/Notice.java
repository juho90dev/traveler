package com.jh.trip.notice.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
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
@SequenceGenerator(name="seq_notino", sequenceName="seq_notino", allocationSize = 1)
public class Notice {
	
	// 공지사항 클래스
	@Id
	@GeneratedValue(generator="seq_notino", strategy= GenerationType.SEQUENCE)
	private int notiNo;
	
	// 관리자만 작성하니 String으로 가자...
	private String writer; // 작성자(실상 관리자)
	
	private String noticeTitle; // 제목
	private String noticeContent; // 공지사항 내용
	
	// 파일원본/재설정 이름
	private String originalFileName;
	private String renameFileName;
	
	
	@Column(name="notiDate", columnDefinition = "date default sysdate not null " )
	@Temporal(TemporalType.DATE)
	private Date notiDate; // 작성일
	

	@PrePersist
	public void prepersist() {
		this.notiDate=this.notiDate==null?new Date():this.notiDate;
	}
}
