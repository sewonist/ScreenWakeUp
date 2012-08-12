package it.ane
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class ScreenWakeUp extends EventDispatcher
	{
		private static const EXTENSION_ID : String = "it.ane.ScreenWakeUp";
		
		private var context:ExtensionContext;
		
		public function ScreenWakeUp(target:IEventDispatcher=null)
		{
			super(target);
			
			try{
				context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
				context.addEventListener(StatusEvent.STATUS, onStatusHandler);
			}catch(e:Error){
				trace(e.message, e.errorID);
			}
		}
		
		protected function onStatusHandler(event:Event):void
		{
			
		}
		
		public function get isSupported():Boolean{
			var result:Boolean = context.call("isSupported");
			return result;
		}
		
		public function lock($flag:Boolean):void
		{
			context.call("lock", $flag);
		}
		
	}
}