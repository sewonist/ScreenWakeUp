package it.ane.screenwakeup;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class ScreenWakeUpContext extends FREContext {

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
        
		map.put("isSupported", new IsSupportedFunction());
		map.put("lock", new LockFunction());
		
        return map;
	}

}