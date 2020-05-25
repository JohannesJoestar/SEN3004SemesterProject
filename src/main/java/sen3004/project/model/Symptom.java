package sen3004.project.model;

import javax.persistence.*;

@Entity
@Table(name = "symptom")
public class Symptom {

    //// Properties
    // Attributes
    @Id
    private long ID;
    private String key;

    //// Methods
    // Access modifiers
    public long getID() {
        return ID;
    }
    public void setID(long ID) {
        this.ID = ID;
    }

    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

    
}