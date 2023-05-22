package com.skilldistillery.skyreport.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;

@Service
@Transactional
public class SightingDAOImpl implements SightingDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Sighting findById(int id) {
		return em.find(Sighting.class, id);
	}

	@Override
	public Location createLocation(Location location) {
		em.persist(location);
		return location;
	}
	
	
	@Override
	public Sighting create(Location location, Sighting sighting) {
		LocalDate ldt = LocalDate.now();
		sighting.setUserId(1);
		sighting.setSightingDate(ldt);
		sighting.setEnabled(true);
		sighting.setLocation(location);
		em.persist(sighting);
		return sighting;
	}

	@Override
	public boolean deleteById(int id) {
		try {
			Sighting sighting = em.find(Sighting.class, id);
//			em.remove(sighting);
			sighting.setEnabled(false);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Sighting> viewSightingByUserId(int id) {

		String jpql = "SELECT s FROM Sighting s WHERE s.userId = :userId AND s.enabled = true";

		List<Sighting> userSighting = em.createQuery(jpql, Sighting.class).setParameter("userId", id).getResultList();

		return userSighting;
	}

}
