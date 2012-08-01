package
{
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	import it.ane.ScreenWakeUp;
	
	public class ScreenWakeUpTester extends Sprite
	{
		private var _buttonOn:PushButton;
		private var _buttonOff:PushButton;
		private var _status:Label;
		private var _screenWakeUp:ScreenWakeUp;
		private var _isSupported:Boolean;
		
		public function ScreenWakeUpTester()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_buttonOn = new PushButton(this, 100, 20, "ScreenWakeUp ON", onClick);
			_buttonOff = new PushButton(this, 100, 50, "ScreenWakeUp OFF", onClick);
			_status = new Label(this, 100, 80, "status : OFF");
			
			_screenWakeUp = new ScreenWakeUp;
			_isSupported = _screenWakeUp.isSupported;
			
		}
		
		protected function onClick(event:MouseEvent):void
		{
			if(event.currentTarget == _buttonOn){
				if(_isSupported){
					_screenWakeUp.lock(true);
					_status.text = "status : ON";
				}
			} else if (event.currentTarget == _buttonOff) {
				if(_isSupported){
					_screenWakeUp.lock(false);
					_status.text = "status : OFF";
				}
			}
		}
	}
}