package br.com.tmvolpato.simplesecurity.converter;

import java.beans.PropertyEditorSupport;

import br.com.tmvolpato.simplesecurity.entity.Profile;

public class ProfileConverter extends PropertyEditorSupport{
	
	public void setAsText(String text) throws IllegalArgumentException{
		Profile profile = Profile.ROLE_ADMIN;
		
		if(text.equalsIgnoreCase("ROLE_USER")){
			profile = Profile.ROLE_USER;
		}		
		super.setValue(profile);		
	}

}
