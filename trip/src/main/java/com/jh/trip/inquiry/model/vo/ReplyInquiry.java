package com.jh.trip.inquiry.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_reinquiryno", sequenceName="seq_reinquiryno", allocationSize = 1)
public class ReplyInquiry {
	
	@Id
	@GeneratedValue(generator = "seq_reinquiryno",  strategy = GenerationType.SEQUENCE)
	private int reinquiryNo;
	
	private String writer;
	
	
	private String reinquiryTitle;
	private String reinquiryContent;
	
	@ToString.Exclude
	@OneToOne
	@JoinColumn(name="inquiryNo")
	private Inquiry inquiry;
	
	
	@Column(name="reinquiryDate", columnDefinition = "date default sysdate not null")
	@Temporal(TemporalType.DATE)
	private Date reinquiryDate;
	
	@PrePersist
	public void prepersist() {
		this.reinquiryDate=this.reinquiryDate==null?new Date():this.reinquiryDate;
		
	}
	
	
	

}
