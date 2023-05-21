package com.skilldistillery.skyreport.data;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;

@Service
@Transactional
public class SightingDAOImpl implements SightingDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Sighting findById(int id) {
		return em.find(Sighting.class, id);
	}
	
	@Override
	public Sighting create(Sighting sighting) {
		Location location = new Location();
		LocalDate ldt = LocalDate.now();
		sighting.setUserId(1);
		sighting.setSightingDate(ldt);
		location.setAddress("303 Main st.");
		location.setCity("ABQ");
		location.setZipcode("87115");
		location.setState("New Mexico");
		location.setCountry("United States");
		em.persist(location);
		sighting.setLocation(location);
		em.persist(sighting);
		return sighting;
	}
	
	@Override
	public boolean deleteById(int id) {
		try {
			Sighting sighting = em.find(Sighting.class, id);
			em.remove(sighting);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
