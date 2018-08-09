package stcs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import stcs.mapper.*;
import stcs.model.*;
import stcs.utils.JsonUtils;





@Service("noteService")
public class NoteServiceImpl implements NoteService{

	@Resource(name="sentenceMapper")
	private SentenceMapper sentenceMapper;
	
	
	public Integer add(Sentence s) {
		return sentenceMapper.insertSelective(s);
	}

	

}
