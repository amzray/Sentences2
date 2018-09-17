package stcs.service;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import stcs.mapper.*;
import stcs.model.*;
import stcs.model.SentenceExample.Criteria;
import stcs.utils.JsonUtils;
import stcs.utils.Page;


@Service("readingService")
public class ReadingServiceImpl implements ReadingService{

	
	@Resource(name="sentenceMapper")
	private SentenceMapper sentenceMapper;
	
	public Integer getSentencesCount(Sentence condition) {
		
		SentenceExample example = generateExample(condition);
		
		Integer i = (int)sentenceMapper.countByExample(example);
		System.out.println(i);
		return i;
	}
	
	
	public List<Sentence> getAllSentences() {
		SentenceExample se = new SentenceExample();
		se.setOrderByClause("`create_time` DESC");
		return sentenceMapper.selectByExample(se);
		
	}


	public Page<Sentence> getSentencesInPage(Page<Sentence> p, Sentence condition) {
		
		SentenceExample example = generateExample(condition);
		//逆序
		example.setOrderByClause("`create_time` DESC");
		//结果分页
		example.setStartRow(p.getStartRow());
		example.setPageSize(p.getPageSize());
		p.setList(sentenceMapper.selectByExample(example));
		return p;
	}


	
	public SentenceExample generateExample(Sentence condition) {
		SentenceExample example = new SentenceExample();
		
		if(condition!=null) {
			//为查询添加条件
			Criteria criteria = example.createCriteria();
			
			//语言类型，精确匹配
			if(condition.getLanguageId()!=null) {
				criteria.andLanguageIdEqualTo(condition.getLanguageId());
			}
			if(condition.getTypeId()!=null) {
				criteria.andTypeIdEqualTo(condition.getTypeId());
			}
			//文本内容，模糊查询
			if(condition.getText()!=null) {
				criteria.andTextLike("%"+condition.getText()+"%");
			}
			//作者名称，模糊查询
			if(condition.getAuthor()!=null) {
				criteria.andAuthorLike("%"+condition.getAuthor()+"%");
			}
			//出处名称，模糊查询
			if(condition.getWorks()!=null) {
				criteria.andWorksLike("%"+condition.getWorks()+"%");
			}
			//心得内容，模糊查询
			if(condition.getReflection()!=null) {
				criteria.andReflectionLike("%"+condition.getReflection()+"%");
			}
			//标签（单次查询只限单个标签），模糊查询
			if(condition.getLabels()!=null) {
				criteria.andLabelsLike("%"+condition.getLabels()+"%");
			}
			
		}
		return example;
		
	}


	
	

}
