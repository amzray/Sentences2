package stcs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import stcs.model.Sentence;
import stcs.service.NoteService;

@RequestMapping("/note")
@Controller
public class NoteAction{
	
	@Resource(name = "noteService")
	private NoteService noteService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String note(HttpSession session) {
		//需登录
//		if(session.getAttribute("uid")==null) {
//			return "/unlogin";
//		}
		return "/note";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String notePost(Model model, Sentence s) {
		System.out.println(new Gson().toJson(s));
		Integer result = noteService.add(s);
		model.addAttribute("status", result);
		return "/note";
	}
}
