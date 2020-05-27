package sen3004.project.model;

import javax.persistence.*;

@Entity
@Table(name = "symptom")
public class Symptom {

    //// Properties
    // Attributes
    @Id
    private long ID;
    
    @Column(name = "name")
    private String name;

    //// Methods
    // Object implementation
    @Override
    public boolean equals(Object target){

        // Overriding equals allows the checkbox values to be objects themselves instead of their ID
        if (target == null){
            return false;
        } else {
            if (target instanceof Symptom){
                return (ID == ((Symptom) target).getID());
            } else {
                return false;
            }
        }
    }
    // Access modifiers
    public long getID() {
        return ID;
    }
    public void setID(long ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    
}