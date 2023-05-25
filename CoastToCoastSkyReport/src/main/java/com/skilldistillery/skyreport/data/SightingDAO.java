package com.skilldistillery.skyreport.data;

import java.util.List;

import com.skilldistillery.skyreport.entities.Comment;
import com.skilldistillery.skyreport.entities.KnownObject;
import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.SightingRating;
import com.skilldistillery.skyreport.entities.User;

public interface SightingDAO {
	
	Sighting findById(int id);
	boolean deleteById(int id);
	List<Sighting> viewSightingByUserId(int id);
	Location createLocation(Location location);
	Sighting create(Location location, Sighting sighting, User user);
	Sighting updateSighting(int sightingId, Sighting editedSighting, Location location);
	List<Sighting> viewSightingByKeyword(String keyword);
	Comment createComment(Comment comment, int sightingId, User user);
	List<Comment> getCommentList(int sightingId);
	List<Sighting> findAllSightings();
	KnownObject findKnownObjectById(int sightingId);
	List<SightingRating> getSightingRatingsList(int sightingId);
	List<KnownObject> getKnownObjectList(int sightingId);
	

}
