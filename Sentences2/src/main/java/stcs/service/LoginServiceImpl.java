package stcs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import stcs.model.Customer;
import stcs.model.Language;
import stcs.model.LanguageExample;
import stcs.model.Type;
import stcs.model.TypeExample;
import stcs.utils.JsonUtils;
import stcs.mapper.CustomerMapper;
import stcs.mapper.LanguageMapper;
import stcs.mapper.TypeMapper;





@Service("loginService")
public class LoginServiceImpl implements LoginService{

	private static int SINGLETON_CUSTOMER = 1;
	
	@Resource(name="customerMapper")
	private CustomerMapper customerMapper;
	@Resource(name="languageMapper")
	private LanguageMapper languageMapper;
	@Resource(name="typeMapper")
	private TypeMapper typeMapper;

	public Integer validate(String password) {
		Customer cust = customerMapper.selectByPrimaryKey(SINGLETON_CUSTOMER);
		if(!(cust.getPassword().equals(password))) {
			return -1;
		}else {
			return SINGLETON_CUSTOMER;
		}
	}
	
	public String getLangsJson() {
		List<Language> li = languageMapper.selectByExample(new LanguageExample());
		String str = JsonUtils.gson.toJson(li);
		return str;
				
	}

	public String getTypesJson() {
		List<Type> li = typeMapper.selectByExample(new TypeExample());
		String str = JsonUtils.gson.toJson(li);
		return str;
	}

}
