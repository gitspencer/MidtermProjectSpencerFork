package com.skilldistillery.skyreport.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	// No transaction begin/commit
	// No em.close()

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsernameAndPass(String username, String password) {
		User user = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid Login");
		}
		return user;
	}

	@Override
	public List<Sighting> findAll() {
		String jpql = "SELECT s FROM Sighting s";
		return em.createQuery(jpql, Sighting.class).getResultList();
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

}
