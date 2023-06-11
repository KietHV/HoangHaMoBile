package com.java5.Asm.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.java5.Asm.Entity.Users;

import jakarta.transaction.Transactional;
@Service
@Transactional
public interface UserRepository extends JpaRepository<Users, Long> {
	Optional<Users> findByEmail(String email);
	@Modifying
	@Query(value = "UPDATE Users u set u.firstName =:firstName," + " u.lastName =:lastName,"
			+ "u.email =:email where u.id =:id")
	void update(String firstName, String lastName, String email, Long id);

	@Modifying
    @Query(value = "UPDATE Users u SET u.firstName = :firstName, u.lastName = :lastName, u.email = :email, u.password = :password, u.isEnabled = :isEnabled WHERE u.id = :id")
    void updateUserById(Long id, String firstName, String lastName, String email, String password, Boolean isEnabled);

	List<Users> findAllByemailContainingIgnoreCase(String keywords);
	
}
