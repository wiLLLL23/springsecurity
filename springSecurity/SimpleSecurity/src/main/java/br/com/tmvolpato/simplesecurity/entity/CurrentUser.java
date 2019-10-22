package br.com.tmvolpato.simplesecurity.entity;

import org.springframework.security.core.authority.AuthorityUtils;

public class CurrentUser extends org.springframework.security.core.userdetails.User{

	private User user;
	
	public CurrentUser(User user){
		super(user.getEmail(), user.getPassword(), AuthorityUtils.createAuthorityList(user.getProfile().toString()));
		this.user = user;
	}
	
	public User getUser(){
		return user;
	}
	
	public Long getId(){
		return user.getId();
	}
	
	public Profile getProfile(){
		return user.getProfile();
	}

}
