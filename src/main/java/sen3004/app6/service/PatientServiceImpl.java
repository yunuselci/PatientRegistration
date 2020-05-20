package sen3004.app6.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sen3004.app6.dao.PatientRepository;
import sen3004.app6.model.Patient;

@Service
@Transactional
public class PatientServiceImpl implements PatientService {

	@Autowired
    PatientRepository repository;
	
	@Override
	public List<Patient> findAll() {
		return repository.findAll();
	}

	@Override
	public Patient findById(long id) {
		return repository.findById(id);
	}

	@Override
	public void create(Patient patient) {
		repository.create(patient);
	}

	@Override
	public void delete(long id) {
		repository.delete(id);
	}

	@Override
	public void update(Patient patient) {
		repository.update(patient);
	}

}
