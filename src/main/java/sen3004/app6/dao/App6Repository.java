package sen3004.app6.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import sen3004.app6.model.Person;
import sen3004.app6.service.IPerson;

@Repository
public class App6Repository implements IPerson {

	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Person> findAll(){
		return entityManager.createQuery("from Person", Person.class).getResultList();
	}
	
	public Person findById(long id){
		return entityManager.find(Person.class, id);
	}
	
//	public List<Person> findByLastName(String lastName){
//		return entityManager.createQuery("from Person where lname = :lname", Person.class).setParameter("lname", lastName).getResultList();
//	}
//	
//	public Person update(Person person){
//		return entityManager.merge(person);
//	}

	@Override
	public void create(Person person) {
		entityManager.persist(person); 
	}

	@Override
	public void delete(long id) {
		entityManager.remove(entityManager.getReference(Person.class, id));
	} 
}
