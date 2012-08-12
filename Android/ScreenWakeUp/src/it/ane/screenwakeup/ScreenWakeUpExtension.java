package it.ane.screenwakeup;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ScreenWakeUpExtension implements FREExtension {

	@Override
	public FREContext createContext(String arg0) {
		
		Log.e("ScreenWakeUp", "call createContext");
		
		return new ScreenWakeUpContext();
	}

	@Override
	public void dispose() {
	}

	@Override
	public void initialize() {
	}

}
