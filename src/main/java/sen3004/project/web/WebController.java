package sen3004.project.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sen3004.project.model.Patient;
import sen3004.project.model.Symptom;
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
    // Request mappings
    @RequestMapping(value = {"/form", "form.html"}, method = RequestMethod.GET)
    public ModelAndView displayForm(){
        ModelAndView MV = new ModelAndView("form");
        MV.addObject("patient", new Patient());

        // Symptoms as model attribute
        List<Symptom> allSymptoms = service.getAllSymptoms();
        MV.addObject("allSymptoms", allSymptoms);
        
        return MV;
    }
    @RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView processForm(@Valid @ModelAttribute Patient patient, BindingResult result) {
		ModelAndView MV = new ModelAndView();
        MV.addObject("patient", patient);
        TIDV.validate(patient, result);
        MV.setViewName(
            (result.hasErrors() ? "form" : "result")
        );
		return MV;
	}
  
  
}
