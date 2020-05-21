package sen3004.app6.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import sen3004.app6.CustomValidationController;
import sen3004.app6.model.Patient;
import sen3004.app6.service.PatientServiceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class PatientController {

    @Autowired
    PatientServiceImpl service;

    @Autowired
    CustomValidationController customValidationController;

    @InitBinder
    protected void initBinder(final WebDataBinder binder){
        binder.addValidators(customValidationController);
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource
                = new ReloadableResourceBundleMessageSource();

        messageSource.setBasename("classpath:messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Bean
    public LocalValidatorFactoryBean getValidator() {
        LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
        bean.setValidationMessageSource(messageSource());
        return bean;
    }

    @RequestMapping(value = {"/", "index.html"}, method = RequestMethod.GET)
    public String getIndex() {
        return "index";
    }


    @RequestMapping(value = {"/display-form", "create.html"}, method = RequestMethod.GET)
    public ModelAndView displayForm() {
        ModelAndView mv = new ModelAndView("form");
        mv.addObject("patient", new Patient());

        return mv;
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public ModelAndView processForm(@Valid @ModelAttribute Patient patient, BindingResult result) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("patient", patient);

        if (result.hasErrors())
            mv.setViewName("form");
        else {
            mv.setViewName("result");
            service.create(patient);
            mv.addObject("patients", service.findAll());
        }

        return mv;
    }

    @RequestMapping(value = {"/list-patients", "list.html"}, method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("result");
        mv.addObject("patients", service.findAll());

        return mv;
    }

    @RequestMapping(value = {"/edit/{id}"}, method = RequestMethod.GET)
    public ModelAndView editList(@PathVariable long id) {
        ModelAndView mv = new ModelAndView("update");
        mv.addObject("patient", service.findById(id));
        return mv;
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public ModelAndView update(@Valid @ModelAttribute Patient patient,
                               BindingResult result,
                               @PathVariable long id
                               ) {
        ModelAndView mv = new ModelAndView();
        if (result.hasErrors()) {
            patient.setId(id);
            mv.setViewName("update");
            return mv;
        }
        service.update(patient);
        mv.addObject("patients", service.findAll());
        mv.setViewName("result");


        return mv;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable long id) {
        ModelAndView mv = new ModelAndView("result");
        service.delete(id);
        mv.addObject("patients", service.findAll());

        return mv;
    }

}
