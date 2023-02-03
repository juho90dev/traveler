package com.jh.trip.place.model.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Place {

	@Id
	private String contentId; // 해당 장소 번호
	
	private String address; // 주소
	
	private String areacode; // 지역코드(ex. 서울=1, 경기=31)
	
	private String sigungucode; // 시군구코드 (ex. 강남=1)
	
	private String cat1; // 대분류(ex. 자연, 인문)
	
	private String cat2; // 소분류(ex. 스포츠, 역사, 체험)
	
	private String contenttypeId; // 타입 (ex. 관광, 숙박 등)
	
	private String firstImage; // 사진
	
	private String mapx;  // 위도, 경도
	
	private String mapy;
	
	private String title;
	
	private String tel;
	
	
	
}
