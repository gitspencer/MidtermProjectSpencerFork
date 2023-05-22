package com.skilldistillery.skyreport.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.skyreport.data.SightingDAO;
import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

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
	public String addSighting(Sighting sighting, Location location, Model model) {
		model.addAttribute("location", sightingDAO.createLocation(location));
		model.addAttribute("sighting", sightingDAO.create(location, sighting));
		return "addedSighting";
	}

	@GetMapping(path = "deleteSightingRouting.do")
	public String routeToDeleteSighting(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			List<Sighting> sightings = sightingDAO.viewSightingByUserId(user.getId());
			model.addAttribute("sightingList", sightings);
			return "deleteSightingPage";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = "deleteSightingPage.do", method = RequestMethod.POST)
	public String deleteSighting(int id, Model model) {
		boolean deleted = sightingDAO.deleteById(id);
		model.addAttribute("deleted", deleted);
		return "result";
	}

	@GetMapping(path = "updateSighting.do")
	public String routeToUpdateSighting(int id, Sighting sighting, Model model) {
		model.addAttribute("sighting", sightingDAO.findById(id));
		return "updateSighting";
	}

	@RequestMapping(path = "updateSighting.do", method = RequestMethod.POST)
	public String updateSighting(Sighting sighting, Model model) {
		model.addAttribute(model)
		
		model.addAttribute("location", sightingDAO.createLocation(location));
		model.addAttribute("sighting", sightingDAO.create(location, sighting));
		return "updatedSighting";
	}
//
//	@RequestMapping(path = { "editShoe.do" }, method = RequestMethod.GET)
//	public ModelAndView editShoe(int id) {
//		Shoes shoe = shoeDao.findById(id);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("shoe", shoe);
//		mv.setViewName("editShoe");
//		return mv;
//	}
//
//	@RequestMapping(path = { "SubmitEditShoe.do" }, method = RequestMethod.POST)
//	public ModelAndView submitShoe(ModelAndView mv, Shoes shoe, @RequestParam int id, RedirectAttributes redir) {
//		Shoes userEditedShoe = shoe;
//		boolean updated = shoeDao.updateShoe(id, userEditedShoe);
//		System.out.println(updated);
//		mv.addObject("updated", updated);
//		mv.setViewName("updateResult");
//		return mv;
//	}
//
//	@RequestMapping(path = { "updateShoe.do" }, method = RequestMethod.GET)
//	public ModelAndView editFormRoute() {
//		System.out.println("hitting the editformroute method");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("updateResult");
//		return mv;
//	}

}
