package sen3004.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import sen3004.project.model.Patient;
import sen3004.project.service.IPatient;

@Repository
public class PatientRepository implements IPatient {

    //// Properties
    // References
    @PersistenceContext
    private EntityManager manager;

    // Comitting
    //// Methods
    // Interface implementation
    @Override
    public List<Patient> findAll(){
        return manager.createQuery("FROM Patient", Patient.class)
            .getResultList();
    }
    @Override
    public Patient findByID(long ID){
        return manager.find(Patient.class, ID);
    }
    @Override
    public Patient update(Patient patient){
        return manager.merge(patient);
    }
	@Override
	public void create(Patient patient) {
		manager.persist(patient); 
	}
	@Override
	public void delete(long ID) {
		manager.remove(
            manager.getReference(Patient.class, ID)
        );
	} 

}