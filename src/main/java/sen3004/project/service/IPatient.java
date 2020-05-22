package sen3004.project.service;

import java.util.List;

import sen3004.project.model.Patient;

public interface IPatient {

    //// Methods
    // Interface bodies
	public List<Patient> findAll();
    public Patient findByID(long ID);
    public Patient update(Patient patient);
	public void create(Patient patient);
	public void delete(long ID);
}
