package sen3004.app6.service;

import java.util.List;

import sen3004.app6.model.Person;

public interface IPerson {
	public List<Person> findAll();

	public Person findById(long id);
	
	public void create(Person person);
	
	public void delete(long id);

	public void update(Person person);

}
