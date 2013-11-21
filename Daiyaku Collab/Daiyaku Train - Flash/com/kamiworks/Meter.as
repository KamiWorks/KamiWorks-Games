package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Meter extends MovieClip
	{				
		public var direction:String = "Right"
		
		public function Meter(x:Number, y:Number):void
		{
			setPos(x,y);
			addEventListener(Event.ADDED_TO_STAGE, reset);
		}
		
		public function setPos(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
		}
		
		public function changeDirection(direction:String):void{
			this.direction = direction;
		}
		
		public function reset(e:Event=null):void{
			gotoAndStop(60);
		}
		
		public function start():void{
			addEventListener(Event.ENTER_FRAME, mainLoop);			
		}
		
		public function kill():void{
			reset();
			removeEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		public function movePointer(direction:String, difficulty:Number):void{			
			direction == "Right" ?  gotoAndStop(currentFrame+difficulty) : gotoAndStop(currentFrame-difficulty);
		}
				
		private function mainLoop(e:Event):void{
			direction == "Right" ?  nextFrame() : prevFrame();
			if(currentFrame >= totalFrames-18){
				hitRight();
			}else if(currentFrame <= 18){
				hitLeft();
			}
		}
		
		private function hitRight():void{
			dispatchEvent(new Event("HIT_RIGHT"));
		}
		
		private function hitLeft():void{
			dispatchEvent(new Event("HIT_LEFT"));
		}
		
	}
}