package com.jh.trip.place.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jh.trip.place.model.service.PlaceService;
import com.jh.trip.place.model.vo.Place;

@Controller
public class PlaceController {
	
	
	@Autowired
	private PlaceService ps;
	
	
	// 장소 검색 페이지
	@RequestMapping("/placeList")
	public String plate() {
		return "place/placeList";
	}


	
	// 장소 검색
	
	@RequestMapping("/searchPlace")
	public ModelAndView searchResult(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage,@RequestParam("mainTema") String mainTema, @RequestParam("subTema") String subTema,
			@RequestParam("addressDo") String addressDo, @RequestParam("addressDogun") String addressDogun, ModelAndView mv) {
		
		
		
		String areacode = "";
		String sigungucode = "";
		
		// 분기 처리 
		if (addressDo.equals("서울")) {
			areacode = "1";
			if (addressDogun.equals("강남구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("강동구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("강북구")) {
				sigungucode = "3";
			} else if (addressDogun.equals("강서구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("관악구")) {
				sigungucode = "5";
			} else if (addressDogun.equals("광진구")) {
				sigungucode = "6";
			} else if (addressDogun.equals("구로구")) {
				sigungucode = "7";
			} else if (addressDogun.equals("금천구")) {
				sigungucode = "8";
			} else if (addressDogun.equals("노원구")) {
				sigungucode = "9";
			} else if (addressDogun.equals("도봉구")) {
				sigungucode = "10";
			} else if (addressDogun.equals("동대문구")) {
				sigungucode = "11";
			} else if (addressDogun.equals("동작구")) {
				sigungucode = "12";
			} else if (addressDogun.equals("마포구")) {
				sigungucode = "13";
			} else if (addressDogun.equals("서대문구")) {
				sigungucode = "14";
			} else if (addressDogun.equals("서초구")) {
				sigungucode = "15";
			} else if (addressDogun.equals("성동구")) {
				sigungucode = "16";
			} else if (addressDogun.equals("성북구")) {
				sigungucode = "17";
			} else if (addressDogun.equals("송파구")) {
				sigungucode = "18";
			} else if (addressDogun.equals("양천구")) {
				sigungucode = "19";
			} else if (addressDogun.equals("영등포구")) {
				sigungucode = "20";
			} else if (addressDogun.equals("용산구")) {
				sigungucode = "21";
			} else if (addressDogun.equals("은평구")) {
				sigungucode = "22";
			} else if (addressDogun.equals("종로구")) {
				sigungucode = "23";
			} else if (addressDogun.equals("중구")) {
				sigungucode = "24";
			} else if (addressDogun.equals("중랑구")) {
				sigungucode = "25";
			}
		} else if (addressDo.equals("인천")) {
			areacode = "2";
			if (addressDogun.equals("강화군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("계양구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("미추홀구")) {
				sigungucode = "3";
			} else if (addressDogun.equals("남동구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "5";
			} else if (addressDogun.equals("부평구")) {
				sigungucode = "6";
			} else if (addressDogun.equals("서구")) { 
				sigungucode = "7";
			} else if (addressDogun.equals("연수구")) {
				sigungucode = "8";
			} else if (addressDogun.equals("용진군")) {
				sigungucode = "9";
			} else if (addressDogun.equals("중구")) {
				sigungucode = "10";
			}
		} else if (addressDo.equals("대전")) {
			areacode = "3";
			if (addressDogun.equals("대덕구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("서구")) {
				sigungucode = "3";
			} else if (addressDogun.equals("유성구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("중구")) {
				sigungucode = "5";
			}
		} else if (addressDo .equals("대구")) {
			areacode = "4";
			if (addressDogun.equals("남구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("달서구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("달성군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("북구")) {
				sigungucode = "5";
			} else if (addressDogun.equals("서구")) {
				sigungucode = "6";
			} else if (addressDogun.equals("수성구")) {
				sigungucode = "7";
			} else if (addressDogun.equals("중구")) {
				sigungucode = "8";
			}

		} else if (addressDo.equals("대구")) {
			areacode = "5";
			if (addressDogun.equals("남구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("달서구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("달성군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("북구")) {
				sigungucode = "5";
			}
		} else if (addressDo.equals("광주")) {
			areacode = "5";
			if (addressDogun.equals("광산구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("남구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "3";
			} else if (addressDogun.equals("북구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("서구")) {
				sigungucode = "5";
			}
		} else if (addressDo.equals("부산")) {
			areacode = "5";
			if (addressDogun.equals("서구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("금정구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("기장군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("남구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "5";
			} else if (addressDogun.equals("동래구")) {
				sigungucode = "6";
			} else if (addressDogun.equals("부산진구")) {
				sigungucode = "7";
			} else if (addressDogun.equals("북구")) {
				sigungucode = "8";
			} else if (addressDogun.equals("사상구")) {
				sigungucode = "9";
			} else if (addressDogun.equals("사하구")) {
				sigungucode = "10";
			} else if (addressDogun.equals("서구")) {
				sigungucode = "11";
			} else if (addressDogun.equals("수영구")) {
				sigungucode = "12";
			} else if (addressDogun.equals("연제구")) {
				sigungucode = "13";
			} else if (addressDogun.equals("영도구")) {
				sigungucode = "14";
			} else if (addressDogun.equals("중구")) {
				sigungucode = "15";
			} else if (addressDogun.equals("해운대구")) {
				sigungucode = "16";
			}
		} else if (addressDo.equals("울산")) {
			areacode = "7";
			if (addressDogun.equals("중구")) {
				sigungucode = "1";
			} else if (addressDogun.equals("남구")) {
				sigungucode = "2";
			} else if (addressDogun.equals("동구")) {
				sigungucode = "3";
			} else if (addressDogun.equals("북구")) {
				sigungucode = "4";
			} else if (addressDogun.equals("울주군")) {
				sigungucode = "5";
			}
		} else if (addressDo.equals("세종")) {
			areacode = "8";
			if (addressDogun.equals("세종특별자치시")) {
				sigungucode = "1";
			}
		} else if (addressDo.equals("경기도")) {
			areacode = "31";
			if (addressDogun.equals("가평군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("고양시")) {
				sigungucode = "2";
			} else if (addressDogun.equals("과천시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("광명시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("광주시")) {
				sigungucode = "5";
			} else if (addressDogun.equals("구리시")) {
				sigungucode = "6";
			} else if (addressDogun.equals("군포시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("김포시")) {
				sigungucode = "8";
			} else if (addressDogun.equals("남양주시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("동두천시")) {
				sigungucode = "10";
			} else if (addressDogun.equals("부천시")) {
				sigungucode = "11";
			} else if (addressDogun.equals("성남시")) {
				sigungucode = "12";
			} else if (addressDogun.equals("수원시")) {
				sigungucode = "13";
			} else if (addressDogun.equals("시흥시")) {
				sigungucode = "14";
			} else if (addressDogun.equals("안산시")) {
				sigungucode = "15";
			} else if (addressDogun.equals("안성시")) {
				sigungucode = "16";
			} else if (addressDogun.equals("안양시")) {
				sigungucode = "17";
			} else if (addressDogun.equals("양주시")) {
				sigungucode = "18";
			} else if (addressDogun.equals("양평군")) {
				sigungucode = "19";
			} else if (addressDogun.equals("여주시")) {
				sigungucode = "20";
			} else if (addressDogun.equals("연천군")) {
				sigungucode = "21";
			} else if (addressDogun.equals("오산시")) {
				sigungucode = "22";
			} else if (addressDogun.equals("용인시")) {
				sigungucode = "23";
			} else if (addressDogun.equals("의왕시")) {
				sigungucode = "24";
			} else if (addressDogun.equals("의정부시")) {
				sigungucode = "25";
			} else if (addressDogun.equals("이천시")) {
				sigungucode = "26";
			} else if (addressDogun.equals("파주시")) {
				sigungucode = "27";
			} else if (addressDogun.equals("평택시")) {
				sigungucode = "28";
			} else if (addressDogun.equals("포천시")) {
				sigungucode = "29";
			} else if (addressDogun.equals("하남시")) {
				sigungucode = "30";
			} else if (addressDogun.equals("화성시")) {
				sigungucode = "31";
			}
		} else if (addressDo.equals("강원도")) {
			areacode = "32";
			if (addressDogun.equals("강릉시")) {
				sigungucode = "1";
			} else if (addressDogun.equals("고성군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("동해시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("삼척시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("속초시")) {
				sigungucode = "5";
			} else if (addressDogun.equals("양구군")) {
				sigungucode = "6";
			} else if (addressDogun.equals("양양군")) {
				sigungucode = "7";
			} else if (addressDogun.equals("영월군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("원주시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("인제군")) {
				sigungucode = "10";
			} else if (addressDogun.equals("정선군")) {
				sigungucode = "11";
			} else if (addressDogun.equals("철원군")) {
				sigungucode = "12";
			} else if (addressDogun.equals("춘천시")) {
				sigungucode = "13";
			} else if (addressDogun.equals("태백시")) {
				sigungucode = "14";
			} else if (addressDogun.equals("평창군")) {
				sigungucode = "15";
			} else if (addressDogun.equals("홍천군")) {
				sigungucode = "16";
			} else if (addressDogun.equals("화천군")) {
				sigungucode = "17";
			} else if (addressDogun.equals("횡성군")) {
				sigungucode = "18";
			}
		} else if (addressDo.equals("충청북도")) {
			areacode = "33";
			if (addressDogun.equals("괴산군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("단양군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("보은군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("영동군")) {
				sigungucode = "4";
			} else if (addressDogun.equals("옥천군")) {
				sigungucode = "5";
			} else if (addressDogun.equals("음성군")) {
				sigungucode = "6";
			} else if (addressDogun.equals("제천시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("진천군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("청원군")) {
				sigungucode = "9";
			} else if (addressDogun.equals("청주시")) {
				sigungucode = "10";
			} else if (addressDogun.equals("충주시")) {
				sigungucode = "11";
			} else if (addressDogun.equals("증평군")) {
				sigungucode = "12";
			}
		} else if (addressDo.equals("충청남도")) {
			areacode = "34";
			if (addressDogun.equals("공주시")) {
				sigungucode = "1";
			} else if (addressDogun.equals("금산군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("논산시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("당진시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("보령시")) {
				sigungucode = "5";
			} else if (addressDogun.equals("부여군")) {
				sigungucode = "6";
			} else if (addressDogun.equals("서산시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("서천군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("아산시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("예산군")) {
				sigungucode = "11";
			} else if (addressDogun.equals("천안시")) {
				sigungucode = "12";
			} else if (addressDogun.equals("청양군")) {
				sigungucode = "13";
			} else if (addressDogun.equals("태안군")) {
				sigungucode = "14";
			} else if (addressDogun.equals("홍성군")) {
				sigungucode = "15";
			} else if (addressDogun.equals("계룡시")) {
				sigungucode = "16";
			}
		} else if (addressDo.equals("경상북도")) {
			areacode = "35";
			if (addressDogun.equals("공주시")) {
				sigungucode = "1";
			} else if (addressDogun.equals("금산군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("논산시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("당진시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("보령시")) {
				sigungucode = "5";
			} else if (addressDogun.equals("부여군")) {
				sigungucode = "6";
			} else if (addressDogun.equals("서산시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("서천군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("아산시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("예산군")) {
				sigungucode = "11";
			} else if (addressDogun.equals("천안시")) {
				sigungucode = "12";
			} else if (addressDogun.equals("청양군")) {
				sigungucode = "13";
			} else if (addressDogun.equals("태안군")) {
				sigungucode = "14";
			} else if (addressDogun.equals("홍성군")) {
				sigungucode = "15";
			} else if (addressDogun.equals("계룡시")) {
				sigungucode = "16";
			}
		} else if (addressDo.equals("경상북도")) {
			areacode = "35";
			if (addressDogun.equals("경산시")) {
				sigungucode = "1";
			} else if (addressDogun.equals("경주시")) {
				sigungucode = "2";
			} else if (addressDogun.equals("고령군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("구미시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("군위군")) {
				sigungucode = "5";
			} else if (addressDogun.equals("김천시")) {
				sigungucode = "6";
			} else if (addressDogun.equals("문경시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("봉화군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("상주시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("성주군")) {
				sigungucode = "10";
			} else if (addressDogun.equals("안동시")) {
				sigungucode = "11";
			} else if (addressDogun.equals("영덕군")) {
				sigungucode = "12";
			} else if (addressDogun.equals("영양군")) {
				sigungucode = "13";
			} else if (addressDogun.equals("영주시")) {
				sigungucode = "14";
			} else if (addressDogun.equals("영천시")) {
				sigungucode = "15";
			} else if (addressDogun.equals("예천군")) {
				sigungucode = "16";
			} else if (addressDogun.equals("울릉군")) {
				sigungucode = "17";
			} else if (addressDogun.equals("울진군")) {
				sigungucode = "18";
			} else if (addressDogun.equals("의성군")) {
				sigungucode = "19";
			} else if (addressDogun.equals("청도군")) {
				sigungucode = "20";
			} else if (addressDogun.equals("청송군")) {
				sigungucode = "21";
			} else if (addressDogun.equals("칠곡군")) {
				sigungucode = "22";
			} else if (addressDogun.equals("포항시")) {
				sigungucode = "23";
			}
		} else if (addressDogun.equals("경상남도")) {
			areacode = "36";
			if (addressDogun.equals("거제시")) {
				sigungucode = "1";
			} else if (addressDogun.equals("거창군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("고성군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("김해시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("남해군")) {
				sigungucode = "5";
			} else if (addressDogun.equals("마산시")) {
				sigungucode = "6";
			} else if (addressDogun.equals("밀양시")) {
				sigungucode = "7";
			} else if (addressDogun.equals("사천시")) {
				sigungucode = "8";
			} else if (addressDogun.equals("산청군")) {
				sigungucode = "9";
			} else if (addressDogun.equals("양산시")) {
				sigungucode = "10";
			} else if (addressDogun.equals("의령군")) {
				sigungucode = "12";
			} else if (addressDogun.equals("진주시")) {
				sigungucode = "13";
			} else if (addressDogun.equals("진해시")) {
				sigungucode = "14";
			} else if (addressDogun.equals("창녕군")) {
				sigungucode = "15";
			} else if (addressDogun.equals("창원시")) {
				sigungucode = "16";
			} else if (addressDogun.equals("통영시")) {
				sigungucode = "17";
			} else if (addressDogun.equals("하동군")) {
				sigungucode = "18";
			} else if (addressDogun.equals("함안군")) {
				sigungucode = "19";
			} else if (addressDogun.equals("함양군")) {
				sigungucode = "20";
			} else if (addressDogun.equals("합천군")) {
				sigungucode = "21";
			}
		} else if (addressDogun.equals("전라북도")) {
			areacode = "37";
			if (addressDogun.equals("고창군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("군산시")) {
				sigungucode = "2";
			} else if (addressDogun.equals("김제시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("남원시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("무주군")) {
				sigungucode = "5";
			} else if (addressDogun.equals("부안군")) {
				sigungucode = "6";
			} else if (addressDogun.equals("순창군")) {
				sigungucode = "7";
			} else if (addressDogun.equals("완주군")) {
				sigungucode = "8";
			} else if (addressDogun.equals("익산시")) {
				sigungucode = "9";
			} else if (addressDogun.equals("임실군")) {
				sigungucode = "10";
			} else if (addressDogun.equals("장수군")) {
				sigungucode = "11";
			} else if (addressDogun.equals("전주시")) {
				sigungucode = "12";
			} else if (addressDogun.equals("정읍시")) {
				sigungucode = "13";
			} else if (addressDogun.equals("진안군")) {
				sigungucode = "14";
			}
		} else if (addressDogun.equals("전라남도")) {
			areacode = "38";
			if (addressDogun.equals("강진군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("고흥군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("곡성군")) {
				sigungucode = "3";
			} else if (addressDogun.equals("광양시")) {
				sigungucode = "4";
			} else if (addressDogun.equals("구례군")) {
				sigungucode = "5";
			} else if (addressDogun.equals("나주시")) {
				sigungucode = "6";
			} else if (addressDogun.equals("담양군")) {
				sigungucode = "7";
			} else if (addressDogun.equals("목포시")) {
				sigungucode = "8";
			} else if (addressDogun.equals("무안군")) {
				sigungucode = "9";
			} else if (addressDogun.equals("보성군")) {
				sigungucode = "10";
			} else if (addressDogun.equals("순천시")) {
				sigungucode = "11";
			} else if (addressDogun.equals("신안군")) {
				sigungucode = "12";
			} else if (addressDogun.equals("여수시")) {
				sigungucode = "13";
			} else if (addressDogun.equals("영광군")) {
				sigungucode = "16";
			} else if (addressDogun.equals("영암군")) {
				sigungucode = "17";
			} else if (addressDogun.equals("완도군")) {
				sigungucode = "18";
			} else if (addressDogun.equals("장성군")) {
				sigungucode = "19";
			} else if (addressDogun.equals("장흥군")) {
				sigungucode = "20";
			} else if (addressDogun.equals("진도군")) {
				sigungucode = "21";
			} else if (addressDogun.equals("함평군")) {
				sigungucode = "22";
			} else if (addressDogun.equals("해남군")) {
				sigungucode = "23";
			} else if (addressDogun .equals("화순군")) {
				sigungucode = "24";
			}
		} else if (addressDogun.equals("제주")) {
			areacode = "39";
			if (addressDogun.equals("남제주군")) {
				sigungucode = "1";
			} else if (addressDogun.equals("북제주군")) {
				sigungucode = "2";
			} else if (addressDogun.equals("서귀포시")) {
				sigungucode = "3";
			} else if (addressDogun.equals("제주시")) {
				sigungucode = "4";
			}
		}
		// ---------------------------------------------


		//String text1 = request.getParameter("text1");
		String cat1 = "";
		String cat2 = "";
		// 분기처리
		if (mainTema.equals( "자연")) {
			cat1 = "A01";
			if (subTema.equals("자연관광지")) {
				cat2 = "A0101";
			} else if (subTema.equals( "관광자원")) {
				cat2 = "A0102";
			}
		} else if (mainTema.equals("인문")) {
			cat1 = "A02";
			if (subTema.equals("역사관광지")) {
				cat2 = "A0201";
			} else if (subTema.equals("휴양관광지")) {
				cat2 = "A0202";
			} else if (subTema.equals("체험관광지")) {
				cat2 = "A0203";
			} else if (subTema.equals("산업관광지")) {
				cat2 = "A0204";
			} else if (subTema.equals("건축/조형물")) {
				cat2 = "A0205";
			} else if (subTema.equals("문화시설")) {
				cat2 = "A0206";
			} else if (subTema.equals("축제")) {
				cat2 = "A0207";
			} else if (subTema.equals("공연/행사")) {
				cat2 = "A0208";
			}
		} else if (mainTema.equals("추천코스")) {
			cat1 = "C01";
			if (subTema.equals("가족코스")) {
				cat2 = "C0112";
			} else if (subTema.equals("나홀로코스")) {
				cat2 = "C0113";
			} else if (subTema.equals("힐링코스")) {
				cat2 = "C0114";
			} else if (subTema.equals("도보코스")) {
				cat2 = "C0115";
			} else if (subTema.equals("캠핑코스")) {
				cat2 = "C0116";
			} else if (subTema.equals("맛코스")) {
				cat2 = "C0117";
			}
		} else if (mainTema.equals("레포츠")) {
			cat1 = "A03";
			if (subTema.equals("레포츠 소개")) {
				cat2 = "A0301";
			} else if (subTema.equals("육상 레포츠")) {
				cat2 = "A0302";
			} else if (subTema.equals("수상 레포츠")) {
				cat2 = "A0303";
			} else if (subTema.equals("항공 레포츠")) {
				cat2 = "A0304";
			} else if (subTema.equals("복합 레포츠")) {
				cat2 = "A0305";
			}
		} else if (mainTema.equals("숙박")) {
			cat1 = "B02";
			if (subTema.equals("숙박 시설")) {
				cat2 = "B0201";
			}
		} else if (mainTema.equals("쇼핑")) {
			cat1 = "A04";
			if (subTema.equals("쇼핑")) {
				cat2 = "A0401";
			}
		} else if (mainTema.equals("음식")) {
			cat1 = "A05";
	 		if (subTema.equals("음식점")) {
				cat2 = "A0502";
			}
		}
		
		Place p = Place.builder().areacode(areacode).sigungucode(sigungucode)
				.cat1(cat1).cat2(cat2).build();
		System.out.println("넘어온 파라미터 : "+mainTema +","+ subTema +","+ addressDo +","+ addressDogun);
		System.out.println("대분류 :"+cat1 +","+"소분류 :"+ cat2 +","+"지역코드 :"+ areacode +","+ "시군구코드 :"+sigungucode);
		System.out.println("객체에 담음 :"+p);
		
		List<Place> place = new ArrayList();
		int totalData = 0;
		
		Map param = Map.of("cPage", cPage, "numPerpate", numPerpage);
		Map<String, Object> pData = new HashMap<>();
		
		pData.put("cat1", cat1);
		pData.put("cat2", cat2);
		pData.put("areacode", areacode);
		pData.put("sigungucode", sigungucode);
		
		
		System.out.println("------------");
		System.out.println("Map에 담음 : "+pData);
		System.out.println(pData.get("areacode"));
		System.out.println("------------");
		// 1. 오류1 페이징과 Map에 담아서 파라미터 전달하기 
		place = ps.searchPlaceTest(param,pData);
		// 2. 오류2 Map이 아니라 객체에 담아서 전달해보기
//		place = ps.searchPlace(param,p);
		// 3. 그냥 Map만 전달하기. -> 테이블에 값이 들어가 있음에도 null이 나온다......
//		place = ps.searchTest(pData); 
		// 4. 그럼 그냥 파라미터 4개를 Map에 담지말고 객체에 담아서 보내보자. 그래도 null이 나온다//
//		place = ps.param(p);
//		System.out.println(place);
		
		
		
		// 특정 파라미터 테스트 이건 잘 나온다.
		String test1 = "134808";
		String test2 = "A0502";
		Place rtest1 = ps.test1(test1);
		List<Place> rtest2 = ps.test2(test2);
		// 파라미터 조건의 해당하는 지역의 총 갯수
		totalData = ps.searchPlaceCount(pData);
		System.out.println("------------");
		System.out.println("test1(특정 contentId) : "+rtest1);
		System.out.println("------------");
		System.out.println("------------");
		System.out.println("test2(특정 소분류) : "+rtest2.get(0));
		System.out.println("test2 : "+rtest2.get(1));
//		System.out.println("test2 : "+rtest2.get(2));
//		System.out.println("test2 : "+rtest2.get(3));
//		System.out.println("test2 : "+rtest2.get(4));
//		System.out.println("------------");
		for(int i=0;i<10;i++) {
			
			System.out.println(place.get(i));
		}
//
//
//		System.out.println(totalData);
		
		mv.setViewName("place/placeList");
		return mv;
	}
	

}