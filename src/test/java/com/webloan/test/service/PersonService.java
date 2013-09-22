package com.webloan.test.service;

import java.util.List;

import com.webloan.test.model.Person;


public interface PersonService {
	
	void save(Person person);
	
	void update(Person person);
	
	void deletePerson(Long personId);
	
	List<Person> getPersons();
}
