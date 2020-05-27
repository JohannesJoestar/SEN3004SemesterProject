package sen3004.project.web;

import java.util.List;

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
    // Request mappings: general
    @RequestMapping(value = {"/form", "form.html"}, method = RequestMethod.GET)
    public ModelAndView displayForm(){
        return new ModelAndView("form")
            .addObject("patient", new Patient())
            .addObject("allSymptoms", service.getAllSymptoms());
    }
    @RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView processForm(@Valid @ModelAttribute Patient patient, BindingResult result) {
        TIDV.validate(patient, result);
        return new ModelAndView(result.hasErrors() ? "form" : "result")
            .addObject("patient", patient)
            .addObject("allSymptoms", service.getAllSymptoms());
    }
  
  
}
