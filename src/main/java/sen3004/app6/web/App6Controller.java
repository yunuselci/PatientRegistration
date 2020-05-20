package sen3004.app6.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sen3004.app6.model.Person;
import sen3004.app6.service.App6Service;

@Controller
public class App6Controller {

	@Autowired
	App6Service service;

	@RequestMapping(value = {"/", "index.html"}, method = RequestMethod.GET)
	public String getIndex() {
		return "index";
	}



	@RequestMapping(value = { "/display-form", "create.html" }, method = RequestMethod.GET)
	public ModelAndView displayForm() {
		ModelAndView mv = new ModelAndView("form");
		mv.addObject("person", new Person());

		return mv;
	}

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView processForm(@Valid @ModelAttribute Person person, BindingResult result) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("person", person);

		if (result.hasErrors())
			mv.setViewName("form");
		else {
			mv.setViewName("result");
			service.create(person);
			mv.addObject("people", service.findAll());
		}

		return mv;
	}

	@RequestMapping(value = {"/list-people", "list.html"}, method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("result");
		mv.addObject("people", service.findAll());
		
		return mv;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("result");
		service.delete(id);
		mv.addObject("people", service.findAll());
			
		return mv;
	}

}
