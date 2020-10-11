package com.me.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.dao.FlightDetailsDAO;
import com.me.dao.PassengerDAO;
import com.me.dao.TicketDAO;
import com.me.exception.AdException;
import com.me.pojo.FlightDetails;
import com.me.pojo.Passenger;
import com.me.pojo.Payment;
import com.neu.validators.PaymentValidator;

@Controller
@RequestMapping(value = "/payment*.htm")
public class PaymentController {

	@Autowired
	@Qualifier("pdao")
	PassengerDAO pdao;

	@Autowired
	@Qualifier("paymentValidator")
	PaymentValidator validator;

	@Autowired
	@Qualifier("tdao")
	TicketDAO tdao;

	@Autowired
	@Qualifier("fdao")
	FlightDetailsDAO fdao;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	
	@RequestMapping(value = "/payment.htm", method = RequestMethod.GET)
	public String initialize(@ModelAttribute("payment") Payment payment) {
		
		
		return "payment";
	}

	@RequestMapping(value = "/payment.htm", method = RequestMethod.POST)
	public String addPayment(HttpServletRequest request, HttpServletResponse response) throws AdException {

		HttpSession session = request.getSession();
		long passenger_id = ((Long) session.getAttribute("passenger_id"));

		try {

			String number = request.getParameter("creditCardNumber");
			
			long creditCardNumber = Long.parseLong(number);
			
			String bankName = request.getParameter("bankName");
			
			String fullName = request.getParameter("fullName");
			
			String expiration_month = request.getParameter("expiration_month");
			
		//	Cookie exp_month = new Cookie("month", expiration_month);
			String expiration_year = request.getParameter("expiration_year");
			
		//	Cookie exp_year = new Cookie("year", expiration_year);
			Payment paymnt = pdao.createPayment(creditCardNumber, bankName, fullName, expiration_month,
					expiration_year);

			pdao.updatePassenger(passenger_id, paymnt);

			Passenger passenger = pdao.searchPassenger(passenger_id);
			FlightDetails flightDetail = (FlightDetails) session.getAttribute("flightdetail");

			tdao.bookTicket(passenger, flightDetail);
			int availSeats = flightDetail.getAvailableSeats();
			fdao.updateAvailableSeats(flightDetail, availSeats, availSeats-1);
		//	response.addCookie(exp_month);
		//	response.addCookie(exp_year);

		} catch (Exception e) {
			System.out.println("Could not add payment/ticket" + e.getMessage());
		}

		return "printTicket";
	}
}
