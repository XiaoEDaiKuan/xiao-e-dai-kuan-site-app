package com.webloan.test.service.impl;

import java.util.List;

import javax.persistence.EntityManager;

import com.webloan.test.model.Person;
import com.webloan.test.service.PersonService;


public class PersonServiceImpl implements PersonService {
	
	private EntityManager entityManager;
	
	public EntityManager getEntityManager() {
		return entityManager;
	}
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public void deletePerson(Long personId) {
		entityManager.remove(entityManager.getReference(Person.class, personId));
	}
	
	@SuppressWarnings("unchecked")
	public List<Person> getPersons() {
		return entityManager.createQuery("select p from Person p").getResultList();
	}
	
	public void save(Person person) {
		entityManager.persist(person);
	}
	
	public void update(Person person) {
		entityManager.merge(person);
	}

}
