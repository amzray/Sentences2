package stcs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import stcs.model.Sentence;
import stcs.service.ReadingService;
import stcs.service.SentenceService;


@Controller
public class SentenceAction{
	
	@Resource(name = "sentenceService")
	private SentenceService sentenceService;
	
	@RequestMapping("/sentence")
	public String sentence(HttpSession session, @RequestParam(required=false) Integer sid,  Model model) {
		//需登录
//		if(session.getAttribute("uid")==null) {
//			return "/unlogin";
//		}
		
		if(sid==null) {
			//随机查看句子
			sid = sentenceService.randomSentence();
			return "redirect:/sentence?sid="+sid;
		}
		model.addAttribute("sid", sid);
		return "/sentence";
	}
	

	//单句阅读
	@RequestMapping(value="/ss", method=RequestMethod.GET)
	@ResponseBody
	public Sentence sentenceContent(
		@RequestParam Integer sid,
		Model model) {
		Sentence s = sentenceService.getSingleSentence(sid);
		return s;
	}

	//更新句子内容
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateSentence(Model model, Sentence s) {
		Integer result = sentenceService.update(s);
		model.addAttribute("updateStatus", result);
		return "redirect:/sentence?sid="+s.getId();
	}
	
	//删除句子
		@RequestMapping(value="/delete",method=RequestMethod.GET)
		@ResponseBody
		public Integer deleteSentence(Model model, @RequestParam Integer sid) {
			return sentenceService.delete(sid);
		}
}
