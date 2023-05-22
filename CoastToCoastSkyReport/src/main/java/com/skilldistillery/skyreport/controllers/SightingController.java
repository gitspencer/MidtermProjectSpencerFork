package com.skilldistillery.skyreport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.skyreport.data.SightingDAO;
import com.skilldistillery.skyreport.entities.Sighting;

@Controller
public class SightingController {

	@Autowired
	private SightingDAO sightingDAO;
	
	@GetMapping("sightingById.do")
	public String getSighting(int id, Model model) {
		Sighting sighting = sightingDAO.findById(id);
		
		model.addAttribute("sighting", sighting);
		return "sightingById";
	}

	@GetMapping(path = "addNewSighting.do")
	public String routeToSighting() {

		return "addNewSighting";

	}

	@RequestMapping(path = "addNewSighting.do", method = RequestMethod.POST)
	public String addSighting(Sighting sighting, Model model) {
		model.addAttribute("sighting", sightingDAO.create(sighting));
		return "addedSighting";

	}
	
	@RequestMapping(path = "deleteSightingPage.do", method = RequestMethod.GET)
	public String deleteSighting(int id, Model model) {
		if (sightingDAO.deleteById(id)) {
			model.addAttribute("sighting", "Delete successful");
			return "result";
		} else {
			model.addAttribute("sighting", "Delete unsuccessful");
		}
		return "result";

	}

}
