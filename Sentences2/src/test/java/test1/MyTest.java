package test1;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import stcs.mapper.LanguageMapper;
import stcs.mapper.SentenceMapper;
import stcs.model.Language;
import stcs.model.LanguageExample;

public class MyTest {
	
	@Test
	public void testSelectAll() {
		String xml = "config/springConfig.xml";
		ApplicationContext spring = new ClassPathXmlApplicationContext(xml);
		SentenceMapper mapper = spring.getBean(SentenceMapper.class);
		List<Integer> result = mapper.selectAllPrimaryKeys();
		for(int i = 0; i<result.size(); i++) {
			System.out.println(result.get(i));
		}
	}
}
