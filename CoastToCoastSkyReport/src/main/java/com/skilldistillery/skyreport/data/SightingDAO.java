package com.skilldistillery.skyreport.data;

import java.util.List;

import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;

public interface SightingDAO {
	
	Sighting findById(int id);
	boolean deleteById(int id);
	List<Sighting> viewSightingByUserId(int id);
	Location createLocation(Location location);
	Sighting create(Location location, Sighting sighting);
	Sighting updateSighting(int sightingId, Sighting editedSighting, Location location);
	List<Sighting> viewSightingByKeyword(String keyword);

}
