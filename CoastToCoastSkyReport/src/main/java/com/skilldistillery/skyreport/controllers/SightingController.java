package com.skilldistillery.skyreport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.skyreport.data.UserDAO;
import com.skilldistillery.skyreport.entities.Sighting;

@Controller
public class SightingController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = "addNewSighting.do")
	public String routeToSighting() {

		return "addNewSighting";

	}

	@RequestMapping(path = "addNewSighting.do", method = RequestMethod.POST)
	public String addSighting(Sighting sighting, Model model) {
		model.addAttribute("sighting", userDAO.create(sighting));
		return "addedSighting";

	}

}
