package stcs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/nss")
@Controller
public class NoSuchSentenceAction {
	@RequestMapping(method=RequestMethod.GET)
	public String noSuchSentence() {
		return "/noSuchSentence";
	}
}
