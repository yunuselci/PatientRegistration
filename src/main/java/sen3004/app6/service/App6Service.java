package sen3004.app6.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sen3004.app6.dao.App6Repository;
import sen3004.app6.model.Person;

@Service
@Transactional
public class App6Service implements IPerson {

	@Autowired
	App6Repository repository;
	
	@Override
	public List<Person> findAll() {
		return repository.findAll();
	}

	@Override
	public Person findById(long id) {
		return repository.findById(id);
	}

	@Override
	public void create(Person person) {
		repository.create(person);
	}

	@Override
	public void delete(long id) {
		repository.delete(id);
	}

	@Override
	public void update(Person person) {
		repository.update(person);
	}

}
