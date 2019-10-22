package br.com.tmvolpato.simplesecurity.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.tmvolpato.simplesecurity.converter.ProfileConverter;
import br.com.tmvolpato.simplesecurity.entity.Profile;
import br.com.tmvolpato.simplesecurity.entity.User;
import br.com.tmvolpato.simplesecurity.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	private static final Logger LOGGER = Logger.getLogger(UserController.class);

	@Autowired
	private UserService service;

	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Profile.class, new ProfileConverter());
	}

	@RequestMapping("/add")
	public String userPage(@ModelAttribute("user") User user) {
		LOGGER.debug("Accessed userAdd page!");
		return "userAdd";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user) {

		LOGGER.debug("Saving a new user...");
		User emailExist = service.findUserByEmail(user.getEmail());

		if (emailExist != null) {
			return new ModelAndView("userAdd", "error",
					"Password do not match!, try a new email");
		}

		if (!user.getPassword().equals(user.getPasswordRepeated())) {
			return new ModelAndView("userAdd", "error","Passwords do not match!, try again");
		}

		service.createUser(user);
		return new ModelAndView("redirect:/user/list");
	}
	
	@RequestMapping("/{id}")
	public ModelAndView getUser(@PathVariable("id") Long id, ModelMap model){
		LOGGER.debug("Getting user by id {" + id + "}");
		
		User user = service.findById(id);
		model.addAttribute("user", user);
		return new ModelAndView("user", model);
	}
	
	@RequestMapping("/list")
	public ModelAndView getUsers(ModelMap model){
		LOGGER.debug("List of Users");
		model.addAttribute("users", service.findUsers());
		return new ModelAndView("users", model);
	}
}
