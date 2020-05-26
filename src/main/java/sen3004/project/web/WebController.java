package sen3004.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sen3004.project.model.Patient;
import sen3004.project.service.WebService;

@Controller
public class WebController {

    //// Properties
    // References
    @Autowired
    WebService service;

    //// Methods
    // Request mappings
    @RequestMapping(value = {"/form", "form.html"}, method = RequestMethod.GET)
    public ModelAndView displayForm(){
        ModelAndView MV = new ModelAndView("form");
        MV.addObject("patient", new Patient());
        
        return MV;
    }
    @RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView processForm(@ModelAttribute Patient patient) {
		ModelAndView mv = new ModelAndView();
        mv.addObject("patient", patient);
        mv.setViewName("result");
		return mv;
	}
  
  
}
