package com.neu.validators;



import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.pojo.Passenger;

public class PassengerValidator implements Validator {

	@Override
	public boolean supports(Class aClass) {
		
		return aClass.equals(Passenger.class);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		
		Passenger passenger = (Passenger)o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"firstName","error.invalid.firstName","First Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"lastName","error.invalid.lastName","Last Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"gender","error.invalid.gender","Gender Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email","error.invalid.email","Email Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"dob","error.invalid.dob","Date of Birth Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"phonenum","error.invalid.phonenum","Phone Number Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"address","error.invalid.address","Address Required");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors,"payment","error.invalid.payment.creditCardNumber","Credit Card Number Required");
		
	}

}

