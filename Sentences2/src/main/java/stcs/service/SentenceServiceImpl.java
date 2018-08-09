package stcs.service;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import stcs.mapper.SentenceMapper;
import stcs.model.Sentence;

@Service("sentenceService")
public class SentenceServiceImpl implements SentenceService{
	
	@Resource(name="sentenceMapper")
	private SentenceMapper sentenceMapper;
	
	public Sentence getSingleSentence(Integer sid) {
		return sentenceMapper.selectByPrimaryKey(sid);
	}


	public Integer update(Sentence s) {
		return sentenceMapper.updateByPrimaryKeySelective(s);
	}


	public Integer delete(Integer sid) {
		return sentenceMapper.deleteByPrimaryKey(sid);
	}

	public Integer randomSentence() {
		List<Integer> li = sentenceMapper.selectAllPrimaryKeys();
		Random random = new Random(System.currentTimeMillis());
		return li.get(random.nextInt(li.size()));
	}

}
