package com.neu.validators;



import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.pojo.Payment;

public class PaymentValidator implements Validator {

	@Override
	public boolean supports(Class aClass) {
		
		return aClass.equals(Payment.class);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Payment payment = (Payment)o;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"creditCardNumber","error.invalid.creditCardNumber","Credit Card Number Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"fullName","error.invalid.fullName","Full Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"expiration_month","error.invalid.expiration_month","Expiration Month Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"expiration_year","error.invalid.expiration_year","Expiration year Required");
		
		
	}

}
