package com.kamiworks
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BasicHitTarget extends MovieClip
	{
		private var ragebar:RageBar = new RageBar(10,0);
		private var firstTime:Boolean = true;
		public var phase:int = 0;
		
		public function BasicHitTarget(x:Number, y:Number)
		{			
			addEventListener(Event.ADDED_TO_STAGE, reset);
			setPos(x,y);
		}
		
		public function reset(e:Event=null):void{
			gotoAndStop(0);
		}
		
		private function setPos(x:Number, y:Number):void{
			this.x = x;
			this.y = y;
		}
		
		private function phaseshift(phase:int):void{
			switch(phase){
				case 0:
					gotoAndStop("Normal");
					phase = 0;
					break;
				case 1:
					gotoAndStop("Level1");
					phase = 1;
					break;
				case 2:
					gotoAndStop("Level2");
					phase = 2;
					break;
				case 3:
					gotoAndStop("Level3");
					phase = 3;
					break;
			}
		}
		
		public function increaseRage():void{
			ragebar.boost();
			if(firstTime){
				addRageBar();
			}
		}
		
		private function addRageBar():void{
			addChild(ragebar);
			ragebar.addEventListener("START", rageCheck);
			ragebar.addEventListener("LEVEL1", rageCheck);
			ragebar.addEventListener("LEVEL2", rageCheck);
			ragebar.addEventListener("LEVEL3", rageCheck);
			ragebar.addEventListener("MAX", rageCheck);
		}
		
		private function rageCheck(e:Event):void{
			switch(e.type){
				case "START":
					phaseshift(0);	
					break;
				case "LEVEL1":
					phaseshift(1);	
					break;
				case "LEVEL2":
					phaseshift(2);	
					break;
				case "LEVEL3":
					phaseshift(3);	
					break;
				case "MAX":
					dispatchEvent(new Event("Max Rage"));
					break;
			}
		}
	}
}