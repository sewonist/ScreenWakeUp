package it.ane.screenwakeup;

import android.app.Activity;
import android.content.Context;
import android.os.PowerManager;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class LockFunction implements FREFunction {

	protected PowerManager.WakeLock mWakeLock;
	private Boolean isLock;
	
	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		
		if(mWakeLock==null){
			Activity activity =  ctx.getActivity();
			final PowerManager pm = (PowerManager) activity.getSystemService(Context.POWER_SERVICE);
	        this.mWakeLock = pm.newWakeLock(PowerManager.SCREEN_DIM_WAKE_LOCK, "ScreenWakeUp");
	        isLock = false;
		}
		
		try {
			Boolean flag =  args[0].getAsBool();
			
			Log.e("ScreenWakeUp", "flag : "+flag.toString()+", lock : "+isLock.toString());
			
			if(flag==true && isLock==false){
				Log.e("ScreenWakeUp", "acquire()");
				this.mWakeLock.acquire();
			} else if (flag==false && isLock == true) {
				Log.e("ScreenWakeUp", "release()");
				this.mWakeLock.release();
			}
			
			isLock = flag;
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

