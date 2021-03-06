package sen3004.project.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "patient")
public class Patient {
    
    //// Properties
    // Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;

    @Column(name = "tid", unique = true)
    private long TID;

    @NotEmpty
    @Size(max = 100)
    @Column(name = "name")
    private String name;

    @NotEmpty
    @Size(max = 100)
    @Column(name = "surname")
    private String surname;

    @Past
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Column(name = "date_birth")
    @NotNull
    private LocalDate dateOfBirth;

    @Past
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Column(name = "date_symptom")
    @NotNull
    private LocalDate dateOfFirstSymptom;

    @ManyToMany
    @JoinTable(
        name = "patient_symptom",
        joinColumns =  @JoinColumn(name = "pid"),
        inverseJoinColumns = @JoinColumn(name = "sid"))
    @OrderBy(value = "id")
    @NotEmpty
    private List<Symptom> symptoms;

    //// Methods
    // Access modifiers
    public long getID() {
        return ID;
    }
    public void setID(long iD) {
        ID = iD;
    }

    public long getTID() {
        return TID;
    }
    public void setTID(long tID) {
        TID = tID;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public LocalDate getDateOfFirstSymptom() {
        return dateOfFirstSymptom;
    }
    public void setDateOfFirstSymptom(LocalDate dateOfFirstSymptom) {
        this.dateOfFirstSymptom = dateOfFirstSymptom;
    }

    public List<Symptom> getSymptoms(){
        return symptoms;
    }
    public void setSymptoms(List<Symptom> symptoms){
        this.symptoms = symptoms;
    }
}