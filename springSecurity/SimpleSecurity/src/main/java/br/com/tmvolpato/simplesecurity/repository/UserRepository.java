package br.com.tmvolpato.simplesecurity.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.tmvolpato.simplesecurity.entity.User;

public interface UserRepository extends JpaRepository<User, Long>{
	
	public User findByEmail(String email);

}
