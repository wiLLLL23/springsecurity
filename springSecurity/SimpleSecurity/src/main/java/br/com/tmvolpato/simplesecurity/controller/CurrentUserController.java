package br.com.tmvolpato.simplesecurity.controller;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import br.com.tmvolpato.simplesecurity.entity.CurrentUser;

@ControllerAdvice(value="currentUser")
public class CurrentUserController {
	
	private static final Logger LOGGER = Logger.getLogger(CurrentUserController.class);
	
	@ModelAttribute(value="currentUser")
	public CurrentUser getCurrentUserAdvice(Authentication authentication){
		LOGGER.debug("Accessing getCurrentUserAdvice");
		
		return (authentication == null) ? null : (CurrentUser) authentication.getPrincipal();
	}

}
