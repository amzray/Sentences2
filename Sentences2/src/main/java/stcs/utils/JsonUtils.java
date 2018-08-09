package stcs.utils;

import org.springframework.stereotype.*;

import com.google.gson.Gson;

@Component("jsonUtils")
public class JsonUtils {
	public static Gson gson = new Gson();
}
