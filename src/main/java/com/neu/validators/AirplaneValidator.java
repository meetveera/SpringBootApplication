package com.neu.validators;




import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.pojo.Airplane;

public class AirplaneValidator implements Validator {

	@Override
	public boolean supports(Class aClass) {
		return aClass.equals(Airplane.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Airplane airplane =(Airplane) obj;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"airlineName","error.invalid.airlineName","Airplane Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"owner","error.invalid.owner","Owner Required");
		
		
	}

}
