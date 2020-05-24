package sen3004.project.web;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sen3004.project.model.Patient;

@Controller

public class WebController {
    //// Properties
    // References

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
