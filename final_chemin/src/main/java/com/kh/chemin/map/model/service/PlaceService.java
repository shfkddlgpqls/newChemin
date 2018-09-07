package com.kh.chemin.map.model.service;

import java.util.List;

import com.kh.chemin.map.model.vo.Place;
import com.kh.chemin.map.model.vo.PlaceAttachment;
import com.kh.chemin.map.model.vo.PlaceMenu;

public interface PlaceService {
	int placeInsert(Place place,List<PlaceMenu> menuList,List<PlaceAttachment> attList);
}
