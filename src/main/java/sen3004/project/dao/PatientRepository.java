package sen3004.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import sen3004.project.model.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {}