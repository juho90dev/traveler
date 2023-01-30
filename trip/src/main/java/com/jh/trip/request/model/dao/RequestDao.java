package com.jh.trip.request.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.request.model.vo.Request;

@Repository
public interface RequestDao extends JpaRepository<Request, String>{
	
	Request save();

}
