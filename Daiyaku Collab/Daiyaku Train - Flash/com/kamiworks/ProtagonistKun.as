package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ProtagonistKun extends MovieClip
	{
		public var direction:String = "Right";
		
		public function ProtagonistKun(x:Number, y:Number)
		{
			addEventListener(Event.ADDED_TO_STAGE, start);
			setPos(x,y);			
		}
		
		private function start(e:Event):void{
			reset();
			addEventListener(Event.ENTER_FRAME, mainLoop);				
		}
		
		public function reset(e:Event=null):void{
			gotoAndStop(60);
		}	
		
		public function kill():void{
			reset();
			removeEventListener(Event.ENTER_FRAME, mainLoop);				
		}
		
		private function setPos(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
		}
		
		public function changeDirection(s:String):void{
			direction = s;
		}		
		
		public function moveHead(direction:String, difficulty:Number):void{			
			direction == "Right" ?  gotoAndStop(currentFrame+difficulty) : gotoAndStop(currentFrame-difficulty);
		}
		
		private function mainLoop(e:Event):void{				
			direction == "Right" ?  nextFrame() : prevFrame();
		}
	}
}