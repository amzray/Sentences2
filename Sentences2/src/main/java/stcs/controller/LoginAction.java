package stcs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import stcs.service.LoginService;


@RequestMapping("/login")
@Controller
public class LoginAction{
	
	@Resource(name = "loginService")
	private LoginService loginService;

	@RequestMapping(method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String loginPost(Model model, HttpSession session, @RequestParam String password) {
		Integer result = loginService.validate(password);
		if(result<0) {
			model.addAttribute("passwordStatus", result);
			return "redirect:/login";
		}
		else{
			session.setAttribute("uid", result);
			session.setAttribute("types", loginService.getTypesJson());
			session.setAttribute("langs", loginService.getLangsJson());
			return "redirect:/index";
		}
	} 
	
}