package com.skilldistillery.skyreport.data;

import com.skilldistillery.skyreport.entities.Sighting;

public interface SightingDAO {
	
	Sighting findById(int id);
	Sighting create(Sighting sighting);
	boolean deleteById(int id);

}
