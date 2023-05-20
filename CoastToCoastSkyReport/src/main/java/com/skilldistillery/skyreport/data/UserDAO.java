package com.skilldistillery.skyreport.data;

import java.util.List;

import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

public interface UserDAO {
	
	User findByUsernameAndPass(String username, String password);
	List<Sighting> findAll();
	

}
