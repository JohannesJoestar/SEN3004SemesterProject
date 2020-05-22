package sen3004.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import sen3004.project.dao.PatientRepository;
import sen3004.project.model.Patient;

public class PatientService implements IPatient{

    //// Properties
    // References
    @Autowired
    PatientRepository repository;

    //// Methods
    // Interface implementation
    @Override
    public List<Patient> findAll() {
        return repository.findAll();
    }
    @Override
    public Patient findByID(long ID) {
        return repository.findByID(ID);
    }
    @Override
    public Patient update(Patient patient) {
        return repository.update(patient);
    }
    @Override
    public void create(Patient patient) {
        repository.create(patient);
    }
    @Override
    public void delete(long ID) {
        repository.delete(ID);
    }
    
}