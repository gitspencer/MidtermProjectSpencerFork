package com.skilldistillery.skyreport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.skyreport.data.UserDAO;
import com.skilldistillery.skyreport.entities.User;

@Controller
public class IndexController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path= {"/", "home.do"})
	private String home(Model model) {
		User Test = userDAO.findByUsernameAndPass("admin", "1234");
		model.addAttribute("SMOKETEST", Test);
		return "home";
	}
}