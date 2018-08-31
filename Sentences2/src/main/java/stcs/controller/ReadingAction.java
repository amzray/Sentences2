package stcs.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;

import stcs.service.ReadingService;
import stcs.utils.Encoding;
import stcs.utils.Page;
import stcs.model.*;


@Controller
public class ReadingAction{
	
	@Resource(name="readingService")
	private ReadingService readingService;
	
	private static Integer readingPageSize = 5;

	//阅读页
	@RequestMapping(value="/reading", method=RequestMethod.GET)
	public String reading(HttpSession session, Model model, 
			@RequestParam(required=false) Integer currPage,
			@RequestParam(required=false) String order,
			@RequestParam(required=false) String author,
			@RequestParam(required=false) String works,
			@RequestParam(required=false) String text,
			@RequestParam(required=false) Integer LanguageId,
			@RequestParam(required=false) Integer TypeId) {
		//需登录
//		if(session.getAttribute("uid")==null) {
//			return "/unlogin";
//		}
		//没有cuurPage请求参数时（从索引跳转来）默认跳转到第一页
		if(currPage==null) {
			model.addAttribute("currPage", 1);
			return "redirect:/reading";
		}
		return "/reading";
	}

	//分页阅读
	@RequestMapping(value="/rp", method=RequestMethod.GET)
	@ResponseBody
	public Page<Sentence> readingPage(
			@RequestParam Integer currPage, 
			@RequestParam(required=false) String order,
			@RequestParam(required=false) String author,
			@RequestParam(required=false) String works,
			@RequestParam(required=false) String text,
			@RequestParam(required=false) Integer languageId,
			@RequestParam(required=false) Integer typeId) throws UnsupportedEncodingException {
		
		Sentence sentence = new Sentence();
		if(author!=null&&author!="") {
			sentence.setAuthor(Encoding.encodeUTF8(author));
		}
		if(works!=null&&works!="") {
			sentence.setWorks(Encoding.encodeUTF8(works));
		}
		if(text!=null&&text!="") {
			sentence.setText(Encoding.encodeUTF8(text));
		}
		//前端传值为0时表示不限数据库中的值
		if(languageId!=null&&languageId!=0) {
			sentence.setLanguageId(languageId);
		}
		//前端传值为0时表示不限数据库中的值
		if(typeId!=null&&typeId!=0) {
			sentence.setTypeId(typeId);
		}
		
		//test
//		System.out.println(new Gson().toJson(sentence));
		
		
		Integer totolRecord = readingService.getSentencesCount(sentence);
		Page<Sentence> p = new Page<Sentence>(currPage, readingPageSize, totolRecord);
		
		return readingService.getSentencesInPage(p, sentence);
		
	}
	
	
	
}
