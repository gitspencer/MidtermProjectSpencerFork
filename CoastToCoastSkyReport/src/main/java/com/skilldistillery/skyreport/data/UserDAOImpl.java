package com.skilldistillery.skyreport.data;

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
		String jpql = "SELECT s FROM Sighting s WHERE s.enabled = true";
		return em.createQuery(jpql, Sighting.class).getResultList();
	}

	@Override
	public User create(Location location, User user) {
		em.persist(location);
		user.setLocation(location);
		em.persist(user);
		return user;
	}

	@Override
	public Location createLocation(Location location) {
		em.persist(location);
		return location;
	}
	
	@Override
	public User findUserById(int id) {
		return em.find(User.class, id);
	}
	

}
