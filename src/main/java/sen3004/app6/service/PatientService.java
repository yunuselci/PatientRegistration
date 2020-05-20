package sen3004.app6.service;

import java.util.List;

import sen3004.app6.model.Patient;

public interface PatientService {
	public List<Patient> findAll();

	public Patient findById(long id);
	
	public void create(Patient patient);
	
	public void delete(long id);

	public void update(Patient patient);

}
