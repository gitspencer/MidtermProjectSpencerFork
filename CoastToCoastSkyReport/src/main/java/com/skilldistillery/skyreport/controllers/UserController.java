package com.skilldistillery.skyreport.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.skyreport.data.UserDAO;
import com.skilldistillery.skyreport.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	// Either works
	// @RequestMapping(path = "login.do", method = RequestMethod.GET)
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
	  User authenticatedUser = userDao.findByUsernameAndPass(user.getUsername(), user.getPassword());
	  if (authenticatedUser != null) {
	   viewName = "account";
	   session.setAttribute("loggedInUser", authenticatedUser);
	  } else {
	   viewName = "login";
	  }
	  return viewName;
	 }

	 @RequestMapping(path = "logout.do")
	 public String logout(HttpSession session) {
	//  Also able to remove all user data from session with invalidate()
	//  session.invalidate();
	  session.removeAttribute("loggedInUser");
	  return "home";
	 }

}
