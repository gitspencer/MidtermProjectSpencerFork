package com.skilldistillery.skyreport.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.skyreport.data.UserDAO;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "account.do")
	public String goToAccount(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "account";
		} else {
			return "login";
		}
	}

}
