package com.me.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.dao.AirplaneDAO;
import com.me.exception.AdException;
import com.me.pojo.Airplane;
import com.neu.validators.AirplaneValidator;


@Controller
@RequestMapping(value = "/*Airplane.htm")
public class AirplaneController {

	@Autowired
	@Qualifier("airplaneValidator")
	AirplaneValidator validator;
	
	@Autowired
	@Qualifier("adao")
	AirplaneDAO adao;
	
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(validator);
	} 
	
	@RequestMapping(value = "/addAirplane.htm", method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("airplane") Airplane airplane,BindingResult result) throws Exception
	{
		validator.validate(airplane,result);
		if(result.hasErrors()){
    		return "addAirplane"; 
    	}
		
		try{
			
			String name= airplane.getAirlineName();
			
			String owner = airplane.getOwner();
			
			
			adao.create(name, owner);
			
		}
		catch(AdException e)
        {
            System.out.println("Exception: " + e.getMessage());
        }
        
    	
		return "addedAirplane";

		
		
	}

	
	
	
	@RequestMapping(value = "/addAirplane.htm", method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("airplane") Airplane airplane,BindingResult result)
	{
		
		return "addAirplane";
	}
	
	@RequestMapping(value = "/deleteAirplane.htm", method = RequestMethod.GET)
	public String delete()
	{
		
		return "deleteAirplane";
	}
	
	@RequestMapping(value = "/deleteAirplane.htm", method = RequestMethod.POST)
	public String deleteAirplane(HttpServletRequest request)
	{
		
		try{
			
			String id = request.getParameter("airplane_id");
			
			
		    long airplane_id = Long.parseLong(id);
		
		adao.deleteAirplane(airplane_id);
		
		}
		
		catch(AdException e)
        {
            System.out.println("Exception: " + e.getMessage());
            
        }
        
		
		return "deletedAirplane";
	
	}
	

	
}



