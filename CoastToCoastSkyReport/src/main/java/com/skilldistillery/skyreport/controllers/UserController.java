package com.skilldistillery.skyreport.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.skyreport.data.UserDAO;
import com.skilldistillery.skyreport.entities.Location;
import com.skilldistillery.skyreport.entities.Sighting;
import com.skilldistillery.skyreport.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping("login.do")
	public String loginView(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "home";
		}
		return "login";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(Model model, User user, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "home";
		}
		String viewName = "";
		User authenticatedUser = userDAO.findByUsernameAndPass(user.getUsername(), user.getPassword());
		if (authenticatedUser != null) {
			viewName = "account";
			session.setAttribute("loggedInUser", authenticatedUser);
		} else {
			viewName = "createAccount";
		}
		return viewName;
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "home";
	}
	@GetMapping(path = "createAccount.do")
	public String routeToCreate() {
		return "createAccount";
	}
	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String create(Location location, User user, Model model, HttpSession session) {
		try {
			User newUser = userDAO.create(location, user);
			session.setAttribute("loggedInUser", newUser);
			return "account";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "createAccount";
		}
	}
}