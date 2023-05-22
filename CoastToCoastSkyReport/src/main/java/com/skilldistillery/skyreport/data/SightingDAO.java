package com.skilldistillery.skyreport.data;

import java.util.List;

import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

public interface SightingDAO {
	
	Sighting findById(int id);
	Sighting create(Sighting sighting);
	boolean deleteById(int id);
	List<Sighting> viewSightingByUserId(int id);

}
