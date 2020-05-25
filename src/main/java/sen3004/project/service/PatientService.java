package sen3004.project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import sen3004.project.model.Patient;

@Repository
interface PatientRepository extends JpaRepository<Patient, Long> {}

@Service
@Transactional
public class PatientService {

    //// Properties
    // References
    @Autowired
    PatientRepository repository;

    //// Methods
    // Interface implementation
    
}