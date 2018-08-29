package stcs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import stcs.service.LoginService;


@Controller("indexAction")
public class IndexAction{
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@RequestMapping("/index")
	public String first(HttpSession session) {
		//需登录
//		if(session.getAttribute("uid")==null) {
//			return "/unlogin";
//		}
		session.setAttribute("types", loginService.getTypesJson());
		session.setAttribute("langs", loginService.getLangsJson());
		
		
		return "/index";
	}
	
	
}
