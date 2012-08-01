package it.ane.screenwakeup;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class IsSupportedFunction implements FREFunction {

	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		// Supported
		FREObject result = null;
		
		try 
		{
			result = FREObject.newObject(true);
		}
		catch (FREWrongThreadException fwte)
		{
			fwte.printStackTrace();
		}
		
		return result;
	}

}

