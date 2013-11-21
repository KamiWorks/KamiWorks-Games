package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class StartScreen extends MovieClip
	{
		public function StartScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void{
			var start_button:MovieClip;
			start_button = this.getChildByName("start_button") as MovieClip;
			start_button.addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent):void{
			dispatchEvent(new Event("Start Game"));
		}
	}
}