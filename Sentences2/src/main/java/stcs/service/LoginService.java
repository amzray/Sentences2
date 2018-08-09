package stcs.service;


public interface LoginService {

	public Integer validate(String password);
	
	public String getLangsJson();

	public String getTypesJson();
}
