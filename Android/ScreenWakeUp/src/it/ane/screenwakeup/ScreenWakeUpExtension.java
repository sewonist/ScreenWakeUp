package it.ane.screenwakeup;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ScreenWakeUpExtension implements FREExtension {

	@Override
	public FREContext createContext(String arg0) {
		return new ScreenWakeUpContext();
	}

	@Override
	public void dispose() {
	}

	@Override
	public void initialize() {
	}

}
