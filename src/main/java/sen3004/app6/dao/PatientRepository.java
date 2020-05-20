package sen3004.app6.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import sen3004.app6.model.Patient;
import sen3004.app6.service.PatientService;

@Repository
public class PatientRepository implements PatientService {

	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Patient> findAll(){
		return entityManager.createQuery("from Patient", Patient.class).getResultList();
	}
	
	public Patient findById(long id){
		return entityManager.find(Patient.class, id);
	}

	@Override
	public void update(Patient patient) {
		entityManager.merge(patient);

	}

	@Override
	public void create(Patient patient) {
		entityManager.persist(patient);
	}

	@Override
	public void delete(long id) {
		entityManager.remove(entityManager.getReference(Patient.class, id));
	} 
}
