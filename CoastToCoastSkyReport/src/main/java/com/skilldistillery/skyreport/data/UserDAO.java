package com.skilldistillery.skyreport.data;

import com.skilldistillery.skyreport.entities.User;

public interface UserDAO {
	
	User findByUsernameAndPass(String username, String password);

}
