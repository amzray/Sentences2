package stcs.service;

import stcs.model.Sentence;

public interface SentenceService {
	public Sentence getSingleSentence(Integer sid);

	public Integer update(Sentence s);

	public Integer delete(Integer sid);

	public Integer randomSentence();
}
