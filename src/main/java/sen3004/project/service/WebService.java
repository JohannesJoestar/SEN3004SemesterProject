package sen3004.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import sen3004.project.model.Patient;
import sen3004.project.model.Symptom;

@Repository
interface PatientRepository extends JpaRepository<Patient, Long> {}
@Repository
interface SymptomRepository extends JpaRepository<Symptom, Long> {}

@Service
@Transactional
public class WebService {

    //// Properties
    // References
    @Autowired
    PatientRepository repoPatient;
    @Autowired
    SymptomRepository repoSymptom;

    //// Methods
    // Service implementation: Patient
    public Patient getPatientByID(long ID){
        return repoPatient.getOne(ID);
    }
    public List<Patient> getAllPatients(){
        return repoPatient.findAll();
    }
    public void savePatient(Patient patient){
        repoPatient.save(patient);
    }
    public void deletePatientByID(long ID){
        repoPatient.deleteById(ID);
    }
    public boolean patientExistsByTID(long TID){

        // We needed a way to handle the JdbcSQLIntegrityConstraintViolationException
        // We decided to use a custom query for it
        ExampleMatcher matcher = ExampleMatcher.matching()
            .withIgnorePaths("ID")
            .withMatcher("TID", GenericPropertyMatchers.exact());

        // Example
        Patient probe = new Patient();
        probe.setTID(TID);

        Example<Patient> example = Example.of(probe, matcher);

        return repoPatient.exists(example);
    }
    // Service implementation: Symptom
    public List<Symptom> getAllSymptoms(){
        return repoSymptom.findAll();
    }
}