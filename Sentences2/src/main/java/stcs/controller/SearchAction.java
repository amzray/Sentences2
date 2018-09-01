package stcs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/search")
@Controller
public class SearchAction {
	@RequestMapping(method=RequestMethod.GET)
	public String search() {
		return "/search";
	}
}
