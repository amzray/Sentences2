package stcs.service;

import java.util.List;

import stcs.model.Sentence;
import stcs.utils.Page;

public interface ReadingService {
	
	public Integer getSentencesCount(Sentence condition);
	
	public List<Sentence> getAllSentences();

	public Page<Sentence> getSentencesInPage(Page<Sentence> p, Sentence condition);

	
	
}
