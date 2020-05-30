package sen3004.project.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sen3004.project.model.Patient;
import sen3004.project.service.WebService;
import sen3004.project.validator.TIDValidator;

@Controller
public class WebController {

    //// Properties
    // References
    @Autowired
    WebService service;
    @Autowired
    TIDValidator TIDV;

    //// Methods
    // Request mappings: general
    @RequestMapping(value = "/patient/register", method = RequestMethod.GET)
    public ModelAndView displayForm(){
        return new ModelAndView("register-patient")
            .addObject("patient", new Patient())
            .addObject("allSymptoms", service.getAllSymptoms());
    }
    @RequestMapping(value = "/patient/view", method = RequestMethod.POST)
	public ModelAndView processForm(@Valid @ModelAttribute Patient patient, BindingResult result) {
        ModelAndView MV = new ModelAndView();

        // Validation
        TIDV.validate(patient, result);
        if (result.hasErrors()){
            MV.setViewName("register-patient");
        } else {
            service.savePatient(patient);
            MV.setViewName("view-patient");
        }
        
        return MV
            .addObject("patient", patient)
            .addObject("allSymptoms", service.getAllSymptoms());
    }
    // Request mappings: patient
    @RequestMapping(value = "/patient/all", method = RequestMethod.GET)
    public ModelAndView viewPatients(){
        return new ModelAndView("view-patients")
            .addObject("patients", service.getAllPatients());
    }
    @RequestMapping(value = "/patient/{PID}/delete", method = RequestMethod.GET)
    public ModelAndView deletePatient(@PathVariable long PID){
        service.deletePatientByID(PID);
        return viewPatients();
    }
    @RequestMapping(value = "/patient/{PID}/edit", method = RequestMethod.GET)
    public ModelAndView editPatient(@PathVariable long PID){
        return new ModelAndView("register-patient")
            .addObject("patient", service.getPatientByID(PID))
            .addObject("pid", String.valueOf(PID))
            .addObject("allSymptoms", service.getAllSymptoms());
    }
  
  
}
