package it.ane.screenwakeup;

import android.app.Activity;
import android.content.Context;
import android.os.PowerManager;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class LockFunction implements FREFunction {

	protected PowerManager.WakeLock mWakeLock;
	
	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		
		if(mWakeLock==null){
			Activity activity =  ctx.getActivity();
			final PowerManager pm = (PowerManager) activity.getSystemService(Context.POWER_SERVICE);
	        this.mWakeLock = pm.newWakeLock(PowerManager.SCREEN_DIM_WAKE_LOCK, "ScreenWakeUp");
		}
		
		try {
			Boolean flag =  args[0].getAsBool();
			
			if(flag){
				this.mWakeLock.acquire();
			} else {
				this.mWakeLock.release();
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}

