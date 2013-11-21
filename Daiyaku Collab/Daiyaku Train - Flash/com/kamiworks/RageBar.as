package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class RageBar extends MovieClip
	{			
		public function RageBar(x:Number, y:Number){
			init();
			setPos(x,y);
		}
		
		private function init(){
			stop();
		}
		
		public function setPos(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
		}
		
		public function boost(){
			nextFrame();
			checkFrame();
		}
		
		private function checkFrame(){
			if(currentFrame < 15){
				dispatchEvent(new Event("START"));
			}else if(currentFrame >= 15 && currentFrame < 45){
				dispatchEvent(new Event("LEVEL1"));				
			}else if(currentFrame >= 45 && currentFrame < 70){
				dispatchEvent(new Event("LEVEL2"));
			}else if(currentFrame >= 70 && currentFrame < totalFrames){
				dispatchEvent(new Event("LEVEL3"));				
			}else if(currentFrame == totalFrames){
				dispatchEvent(new Event("MAX"));
			}
		}
	}		
}