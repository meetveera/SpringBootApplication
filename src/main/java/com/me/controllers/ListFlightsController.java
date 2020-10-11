package com.me.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.dao.ListFlightsDAO;
import com.me.exception.AdException;
import com.me.pojo.Airplane;
import com.me.pojo.FlightDetails;

@Controller
@RequestMapping(value="/listflights.htm")
public class ListFlightsController {

	@Autowired
	@Qualifier("ldao")
	ListFlightsDAO ldao;
	
	
	@RequestMapping(value = "/listflights.htm", method = RequestMethod.POST)
	public String initializeForm(@ModelAttribute("flightDetails") FlightDetails flightDetails, HttpServletRequest request) throws AdException
	{
		HttpSession session = request.getSession();
		String from = request.getParameter("from");
	
		System.out.println("Meet"+from);
		String dest = request.getParameter("dest");
	
		String deptDate = request.getParameter("deptDate");
		String retDate = request.getParameter("arrDate");
		String travelClass = request.getParameter("travelClass");

		System.out.println("From place"+from+"Dest"+dest+"Dept date"+deptDate);
		
		try{
		
		List<String> flightlist = ldao.listFlights(from, dest, deptDate, travelClass);
		
		int length = flightlist.size();
		System.out.println("Length is "+length);
		
		
		session.setAttribute("flightlist", flightlist);
	
		
		}
		catch(AdException e)
        {
            System.out.println("Exception: " + e.getMessage());
        }
		
		return "flightList";
	}
	
}
