package com.jh.trip.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	
	// 자유게시판 페이지
	@RequestMapping("/boardList")
	public String board() {
		return "board/boardList";
	}

}
