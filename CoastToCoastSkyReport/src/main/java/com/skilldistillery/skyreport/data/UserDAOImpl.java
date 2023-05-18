package com.skilldistillery.skyreport.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.skyreport.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	//No transaction begin/commit
	// No em.close()
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsernameAndPass(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
