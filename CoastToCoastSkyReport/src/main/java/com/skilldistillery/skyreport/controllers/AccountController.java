package com.skilldistillery.skyreport.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.skyreport.data.SightingDAO;
import com.skilldistillery.skyreport.data.UserDAO;
import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private SightingDAO sightingDAO;

	@RequestMapping(path = "account.do")
	public String goToAccount(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if (session.getAttribute("loggedInUser") != null) {
			List<Sighting> sightings = sightingDAO.viewSightingByUserId(user.getId());
			model.addAttribute("sightingList", sightings);
			
			List<Sighting> adminSightings = sightingDAO.findAllSightings();
			model.addAttribute("adminSightingList", adminSightings);
			return "account";
		} else {
			return "login";
		}
	}

}
