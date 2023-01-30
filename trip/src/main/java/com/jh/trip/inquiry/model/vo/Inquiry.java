package com.jh.trip.inquiry.model.vo;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import com.jh.trip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_inquiryno", sequenceName="seq_inquiryno", allocationSize = 1)
public class Inquiry {
	
	@Id
	@GeneratedValue(generator = "seq_inquiryno", strategy = GenerationType.SEQUENCE)
	private int inquiryNo;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private Member writer;
	
	private String inquiryType;
	private String inquiryPhone;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryEmail;
	
	// 파일원본/재설정 이름
	private String originalFileName;
	private String renameFileName;
	
	
	@Column(name="inquiryDate", columnDefinition = "date default sysdate not null")
	private Date inquiryDate;
	
	@Cascade(CascadeType.REMOVE)
	@OneToOne(mappedBy = "inquiry")
	private ReplyInquiry reInquiry;
	
	@PrePersist
	public void prepersist() {
		this.inquiryDate=this.inquiryDate==null?new Date():this.inquiryDate;
	}
	

}
