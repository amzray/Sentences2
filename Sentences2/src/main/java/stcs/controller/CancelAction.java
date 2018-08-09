package stcs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/cancel")
@Controller
public class CancelAction{
	
	@RequestMapping(method=RequestMethod.GET)
	public String cancel(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("types");
		session.removeAttribute("lang");
		return "redirect:/index";
	}
	
}
