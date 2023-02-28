package com.jh.trip.place.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jh.trip.place.model.vo.Place;

@Repository
public interface PlaceDao extends JpaRepository<Place, String>{
	
	Place findByContentId(String p);
	List<Place> findBysubTema(String k);

}
